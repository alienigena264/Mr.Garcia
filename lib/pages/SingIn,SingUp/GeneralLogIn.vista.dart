// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/colors.dart';

class LogInSingUp extends StatefulWidget {
  const LogInSingUp({super.key});

  @override
  State<LogInSingUp> createState() => _LogInSingUpState();
}

class _LogInSingUpState extends State<LogInSingUp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colorPrincipal,
      body:   Text('LogInSingUp'),
    );
  }
}