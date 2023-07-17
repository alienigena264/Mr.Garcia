import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/Inicio/Inicio.vista.dart';
import 'package:mr_garcia_app/pages/Inicio/InicioInfo1.vista.dart';
import 'package:mr_garcia_app/pages/Inicio/InicioInfo2.vista.dart';
import 'package:mr_garcia_app/pages/Inicio/InicioInfo3.vista.dart';

void main() => runApp(const MyApp());
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/InicioInfo1': (context) => const InicioInfo1(),
        '/InicioInfo2': (context) => const InicioInfo2(),
        '/InicioInfo3': (context) => const InicioInfo3()
      },
    );
  }
}