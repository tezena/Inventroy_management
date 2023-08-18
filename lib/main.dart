import 'package:flutter/material.dart';
import 'package:inventory/HomeScreen.dart';
import 'package:inventory/Screen1.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/AddItemScreen.dart';
import 'package:inventory/NotificationScreen.dart';
import 'package:inventory/profileScreen.dart';
import "package:inventory/EditScreen.dart";
import "package:inventory/DeleteScreen.dart";
import 'package:inventory/LoginScreen.dart';
import 'package:inventory/BottomNavigationBar.dart';
import 'package:inventory/register.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Inventory',
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) =>RegisterView() ,
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => BottomNavigationScreen(),
      ),
    ],
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay and navigate to the register page
    Future.delayed(Duration(seconds: 2), () {
      GoRouter.of(context).go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator or logo
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  // Implement the registration UI here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child:ElevatedButton(
          onPressed:  () {
      GoRouter.of(context).go('/login');
    },
          child: Text("login"),) ,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  // Implement the login UI here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child:ElevatedButton(
          onPressed:  () {
      GoRouter.of(context).go('/home');
    },
          child: Text("home"),),
      ),
    );
  }
}






// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Inventory',
//       routerConfig: _router,
//     );
//   }

//   final _router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/home',
//         builder: (context, state) => HomeScreen(),
//       ),
//       GoRoute(
//         path: '/',
//         builder: (context, state) => BottomNavigationScreen(),
//       ),
//     ],
//   );
// }

// class BottomNavigationScreen extends StatefulWidget {
//   const BottomNavigationScreen({super.key});
//   @override
//   _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
// }

// class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const ItemsScreen(),
//     AddProductForm(),
//     NotificationPage(),
//     ProfilePage(),
//     const EditScreen(),
//     const DeleteScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageStorage(
//         bucket: PageStorageBucket(), // Use a custom PageStorageBucket
//         child: _screens[_currentIndex],
//       ),
//       bottomNavigationBar: SizedBox(
//         child: Container(
//           decoration: const BoxDecoration(
//               border: Border(
//                   top: BorderSide(
//                       width: 2, color: Color.fromRGBO(107, 59, 225, 1)))),
//           child: BottomNavigationBar(
//             showUnselectedLabels: true,
//             currentIndex: _currentIndex,
//             selectedItemColor: const Color.fromRGBO(107, 11, 232, 1),
//             unselectedItemColor: const Color.fromRGBO(107, 59, 225, 1),
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.white,
//             iconSize: 31,
//             unselectedFontSize: 14,
//             selectedFontSize: 16,
//             onTap: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             items: const [
//               BottomNavigationBarItem(
//                   icon: Icon(
//                     Icons.home,
//                   ),
//                   label: "Home"),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.inventory_2_rounded),
//                 label: 'Items',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Screen',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.settings),
//                 label: 'Screen 4',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.settings),
//                 label: 'Screen 5',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.settings),
//                 label: 'Edit',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.settings),
//                 label: 'Delete',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
