import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/colors.dart';

class InicioInfo1 extends StatefulWidget {
  const InicioInfo1({super.key});

  @override
  State<InicioInfo1> createState() => _InicioInfo1State();
}

class _InicioInfo1State extends State<InicioInfo1> {
  String textoInfo = 'Encuentra Barberos y Salones Fácilmente en tus manos';
  String direcImagen = 'assets/Images/InicioInfo1.jpg';
  int selectPage = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                direcImagen,
                height: screenHeight * 0.58,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
              Container(
                width: screenWidth, // Ancho del cuadrado
                height: screenHeight * 0.42, // Alto del cuadrado
                decoration: BoxDecoration(
                    color: colorPrincipal,
                    border: Border.all(color: Colors.transparent)),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        textoInfo,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    rowBarras(),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    btnNxt()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row rowBarras() {
    return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      barrasEstado(35, colorSecundario),
                      barrasEstado(10, const Color.fromARGB(255, 58, 58, 58)),
                      barrasEstado(10, const Color.fromARGB(255, 58, 58, 58)),
                    ],
                  );
  }

  ElevatedButton btnNxt() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorSecundario,
          minimumSize: const Size(
              340, 55), // double.infinity is the width and 30 is the height
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        ),
        onPressed: nextAct(),
        child: const Text(
          "Seguir",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ));
  }

  Container barrasEstado(double widthBar, Color colorBtn) {
    return Container(
      // Ancho del cuadrado
      margin: const EdgeInsets.only(right: 3),
      width: widthBar,
      height: 10, // Alto del cuadrado
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: colorBtn),
    );
  }

  nextAct() {
    return () {
      setState(() {
        if (selectPage == 0) {
          textoInfo = 'Reserve su peluquero y salón favorito rápidamente';
          direcImagen = 'assets/Images/InicioInfo2.jpg';
          selectPage = 1;
        } else if (selectPage == 1) {
          textoInfo = '¡Ven a ser tu mismo con nosotros ahora mismo!';
          direcImagen = 'assets/Images/InicioInfo3.png';
          selectPage = 2;
        }
        else{
          Navigator.pushNamed(context, '/LogIn');
        }
      });
    };
  }
}
