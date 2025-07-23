import 'package:flutter/material.dart';

class ParallaxListView extends StatefulWidget {
  const ParallaxListView({super.key});

  @override
  State<ParallaxListView> createState() => _ParallaxListViewState();
}

class _ParallaxListViewState extends State<ParallaxListView> {
  final ScrollController _scrollController = ScrollController();
  final List<String> images = List.generate(
    10,
    (index) => 'https://picsum.photos/id/${index + 10}/400/300',
  );

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parallax Image List')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ParallaxImage(
            imageUrl: images[index],
            scrollController: _scrollController,
            title: 'Image #${index + 1}', // custom title instead of image ID
          );
        },
      ),
    );
  }
}

class ParallaxImage extends StatefulWidget {
  final String imageUrl;
  final ScrollController scrollController;
  final String title;

  const ParallaxImage({
    super.key,
    required this.imageUrl,
    required this.scrollController,
    required this.title,
  });

  @override
  State<ParallaxImage> createState() => _ParallaxImageState();
}

class _ParallaxImageState extends State<ParallaxImage> {
  late double _offset = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_updateOffset);
  }

  void _updateOffset() {
    if (!mounted) return;
    final RenderObject? object = context.findRenderObject();
    if (object is RenderBox) {
      final position = object.localToGlobal(Offset.zero);
      setState(() {
        _offset = position.dy * 0.3;
      });
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateOffset);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.translate(
                offset: Offset(0, -_offset),
                child: Image.network(widget.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
