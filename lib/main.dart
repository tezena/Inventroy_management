import 'package:flutter/material.dart';
import 'package:inventory/HomeScreen.dart';
import 'package:inventory/Screen1.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/AddItemScreen.dart';
import 'package:inventory/NotificationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Inventory',
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => BottomNavigationScreen(),
      ),
    ],
  );
}

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ItemsScreen(),
    AddProductForm(),
    NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: PageStorageBucket(), // Use a custom PageStorageBucket
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: SizedBox(
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 2, color: Color.fromRGBO(107, 59, 225, 1)))),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            currentIndex: _currentIndex,
            selectedItemColor: const Color.fromRGBO(107, 11, 232, 1),
            unselectedItemColor: const Color.fromRGBO(107, 59, 225, 1),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            iconSize: 31,
            unselectedFontSize: 14,
            selectedFontSize: 16,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2_rounded),
                label: 'Items',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Screen',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Screen 4',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: const Center(
        child: Text('Screen 3 Content'),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: const Center(
        child: Text('Screen 1 Content'),
      ),
    );
  }
}
