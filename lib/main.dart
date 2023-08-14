import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import "package:inventory/AllText.dart";
import 'package:inventory/FCard.dart';
import 'package:inventory/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget  build(BuildContext context) {
    return const  MaterialApp(
      title: 'Inventory',
      home: BottomNavigationScreen()
    );
  }
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
    Screen1(),
    Screen2(),
    Screen3(),
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
          decoration:const BoxDecoration(border: Border(top: BorderSide(width: 2,color:Color.fromRGBO(107, 59, 225,1)))),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            currentIndex: _currentIndex,
            selectedItemColor:Color.fromRGBO(107, 59, 225,1),
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            iconSize:31 ,
    
            
          
            unselectedFontSize: 14,
            selectedFontSize: 16,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,),
                label: "Home"),
                
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Screen 2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Screen 3',
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

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
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

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Text('Screen 2 Content'),
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
        title: Text('Screen 1'),
      ),
      body: Center(
        child: Text('Screen 1 Content'),
      ),
    );
  }
}
