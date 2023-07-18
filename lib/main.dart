import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/Inicio/Inicio.vista.dart';
import 'package:mr_garcia_app/pages/Inicio/InicioInfo1.vista.dart';
import 'package:mr_garcia_app/pages/Log/Log_General.vista.dart';
import 'package:mr_garcia_app/pages/Log/Register.vista.dart';
import 'package:mr_garcia_app/pages/Log/RegisterDetail.vista.dart';


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
        // ignore: prefer_const_constructors
        '/InicioInfo1': (context) => InicioInfo1(),
        '/logGeneral': (context) => const LogGeneral(),
        '/Registrar': (context) => const Register(),
        '/RegistrarDetalle': (context) => const RegisterDateil(),
        
        
      },
    );
  }
}