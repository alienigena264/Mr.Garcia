import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/colors.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      pasar(); // Llama a la función "pasar" después de 5 segundos
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              Image.asset(
                'assets/Images/InicioApp.jpg',
                height: screenHeight,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
              Container(
                width: screenWidth, // Ancho del cuadrado
                height: screenHeight, // Alto del cuadrado
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                child: textInicio_(screenHeight),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column textInicio_(double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenHeight * 0.70,
        ),
        const Text(
          'Bienvenido a',
          style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenHeight * 0.02),
        const Text(
          'Mr.Garcia',
          style: TextStyle(
              color: colorSecundario,
              fontSize: 60,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        const Text(
          'La mejor aplicación de peluquería y salón en \n este siglo para su buena apariencia y belleza.',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }

  void pasar() {
    // Lógica de la función "pasar"
    Navigator.pushNamed(context, '/InicioInfo1');
  }
}
