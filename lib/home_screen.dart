import 'package:flutter/material.dart';
import 'package:week_7_task/grid_view_demo.dart';
import 'package:week_7_task/list_view_demo.dart';
import 'package:week_7_task/parallex_demo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Collections')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                'Navigation',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('ListView'),
              onTap: () => navigate(context, ListViewDemo()),
            ),
            ListTile(
              title: Text('GridView'),
              onTap: () => navigate(context, GridViewDemo()),
            ),
            ListTile(
              title: Text('Parallax ListView'),
              onTap: () => navigate(context, ParallaxListView()),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => navigate(context, ListViewDemo()),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
            ),
            child: Text(
              'ListView',
              style: TextStyle(
                color: Colors.black, // Black text color
                fontWeight: FontWeight.w600, // Slightly bold
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => navigate(context, GridViewDemo()),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text(
              'GridView',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => navigate(context, ParallaxListView()),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Text(
              'ListView with Parallax Effect',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
