import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:mr_garcia_app/pages/colors.dart';


class InicioInfo1 extends StatefulWidget {
  const InicioInfo1({super.key});
  @override
  State<InicioInfo1> createState() => _InicioInfo1State();
}

class _InicioInfo1State extends State<InicioInfo1> with SingleTickerProviderStateMixin {
  String textoInfo = 'Encuentra Barberos y Salones Fácilmente en tus manos';
  String direcImagen = 'assets/Images/InicioInfo1.jpg';
  int selectPage = 0;
  late AnimationController _animationController;
  // ignore: unused_field
  late SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _setupAnimations();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _setupAnimations() {
    const duration = Duration(milliseconds: 300);
    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          from: const Duration(milliseconds: 0),
          to: duration,
          tag: 'fadeTransition',
        )
        .animate(_animationController);
  }

  void _playAnimations() {
    _animationController.reset();
    _animationController.forward();
  }

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
                  border: Border.all(color: Colors.transparent),
                ),
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
                          fontWeight: FontWeight.bold,
                        ),
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
                    botonSiguiente(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton botonSiguiente() {
    return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorSecundario,
                      minimumSize: const Size(340, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    onPressed: () {
                      nextAct();
                      _playAnimations();
                    },
                    child: const Text(
                      "Seguir",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
  }

  Widget rowBarras() {
    if (selectPage == 0) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          barrasEstado(35, colorSecundario),
          barrasEstado(10, const Color.fromARGB(255, 58, 58, 58)),
          barrasEstado(10, const Color.fromARGB(255, 58, 58, 58)),
        ],
      );
    } else if (selectPage == 1) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          barrasEstado(10, const Color.fromARGB(255, 58, 58, 58)),
          barrasEstado(35, colorSecundario),
          barrasEstado(10, const Color.fromARGB(255, 58, 58, 58)),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          barrasEstado(10, const Color.fromARGB(255, 58, 58, 58)),
          barrasEstado(10, const Color.fromARGB(255, 58, 58, 58)),
          barrasEstado(35, colorSecundario),
        ],
      );
    }
  }

  Widget barrasEstado(double widthBar, Color colorBtn) {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5),
      width: widthBar,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: colorBtn,
      ),
    );
  }

  void nextAct() {
    setState(() {
      if (selectPage == 0) {
        textoInfo = 'Reserve su peluquero y salón favorito rápidamente';
        direcImagen = 'assets/Images/InicioInfo2.jpg';
        selectPage = 1;
      } else if (selectPage == 1) {
        textoInfo = '¡Ven a ser tu mismo con nosotros ahora mismo!';
        direcImagen = 'assets/Images/InicioInfo3.png';
        selectPage = 2;
      } else {
        // ignore: avoid_print
        Navigator.pushNamed(context, '/logGeneral');
      }
    });
  }
}
