import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Demo")),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        children: List.generate(10, (index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.dark_mode, size: 40, color: Colors.blue),
                const SizedBox(height: 8),
                Text('Item ${index + 1}'),
              ],
            ),
          );
        }),
      ),
    );
  }
}
