import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView Demo")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.label),
            title: Text('Item ${index + 1}'),
            subtitle: Text('This is the subtitle of Item ${index + 1}'),
          );
        },
      ),
    );
  }
}
