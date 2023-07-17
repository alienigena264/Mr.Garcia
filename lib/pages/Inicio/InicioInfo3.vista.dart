import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/colors.dart';

class InicioInfo3 extends StatefulWidget {
  const InicioInfo3({super.key});

  @override
  State<InicioInfo3> createState() => _InicioInfo3State();
}

class _InicioInfo3State extends State<InicioInfo3> {
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
                'assets/Images/InicioInfo3.png',
                height: screenHeight * 0.58,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
              Container(
                width: screenWidth, // Ancho del cuadrado
                height: screenHeight * 0.42, // Alto del cuadrado
                decoration: BoxDecoration(
                  color: colorPrincipal,
                  border: Border.all(
                  color: Colors.transparent
                )),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(left: 3, right: 3),
                      child:  Text(
                        '¡Ven a ser guapo y hermoso con nosotros ahora mismo!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        barrasEstado(10,const Color.fromARGB(255, 58, 58, 58)),
                        barrasEstado(10, const Color.fromARGB(255, 58, 58, 58)),
                        barrasEstado(35, colorSecundario),
                      ],
                    ),
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

  ElevatedButton btnNxt() {
    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorSecundario,
                        minimumSize: const Size(340,
                            55), // double.infinity is the width and 30 is the height
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
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
      Navigator.pushNamed(context, '/InicioInfo1');
    };
  }
}
