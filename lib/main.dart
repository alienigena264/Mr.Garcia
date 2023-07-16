import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/logIn.vista.dart';

void main() => runApp(const MyApp());
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LogIn(),
      },
    );
  }
}