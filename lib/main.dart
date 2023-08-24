import 'package:flutter/material.dart';
import 'package:inventory/HomeScreen.dart';
import 'package:inventory/ItemsList.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/AddItemScreen.dart';
import 'package:inventory/NotificationScreen.dart';
import 'package:inventory/profileScreen.dart';
import "package:inventory/EditScreen.dart";
import "package:inventory/DeleteScreen.dart";
import 'package:inventory/LoginScreen.dart';
import 'package:inventory/BottomNavigationBar.dart';
import 'package:inventory/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for Firebase.initializeApp()
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp()); // Replace MyApp with your app's widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
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
        builder: (context, state) => RegisterView(),
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
    Future.delayed(const Duration(seconds: 5), () {
      GoRouter.of(context).go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to your solution!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
            Stack(
              children: [
                Image.asset("assets/images/splesh.png"),
                Positioned(
                  top: MediaQuery.of(context).size.height * .2,
                  left: MediaQuery.of(context).size.width * .45,
                  child: const Center(child: CircularProgressIndicator()),
                )
              ],
            ),
          ],
        ), // Show a loading indicator or logo
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
        title: const Text('Register'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go('/login');
          },
          child: const Text("login"),
        ),
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
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go('/home');
          },
          child: const Text("home"),
        ),
      ),
    );
  }
}
