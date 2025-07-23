import 'package:flutter/material.dart';
import 'package:week_7_task/grid_view_demo.dart';
import 'package:week_7_task/list_view_demo.dart';
import 'package:week_7_task/parallex_demo.dart';

class HomeScreenNavigation extends StatefulWidget {
  const HomeScreenNavigation({super.key});

  @override
  State<HomeScreenNavigation> createState() => _HomeScreenNavigationState();
}

class _HomeScreenNavigationState extends State<HomeScreenNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ListViewDemo(),
    GridViewDemo(),
    ParallaxListView(),
  ];

  final List<String> _titles = [
    'ListView Demo',
    'GridView Demo',
    'Parallax ListView',
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex])),
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
              onTap: () {
                Navigator.pop(context);
                _onTabTapped(0);
              },
            ),
            ListTile(
              title: Text('GridView'),
              onTap: () {
                Navigator.pop(context);
                _onTabTapped(1);
              },
            ),
            ListTile(
              title: Text('Parallax ListView'),
              onTap: () {
                Navigator.pop(context);
                _onTabTapped(2);
              },
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ListView'),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'GridView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            label: 'Parallax',
          ),
        ],
      ),
    );
  }
}
