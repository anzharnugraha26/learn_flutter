import 'package:flutter/material.dart';
import 'package:neumorphism/screens/home_page.dart';
import 'package:neumorphism/screens/login_page.dart';
import 'package:neumorphism/screens/main_layout.dart';
import 'package:neumorphism/screens/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futuristic UI',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/main_layout': (context) => const MainLayout()
      },
    );
  }
}
