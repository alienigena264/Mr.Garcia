

import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/colors.dart';

class LogGeneral extends StatefulWidget {
  const LogGeneral({super.key});

  @override
  State<LogGeneral> createState() => _LogGeneralState();
}

class _LogGeneralState extends State<LogGeneral> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    final screenHeight = screenSize.height;
    // ignore: unused_local_variable
    final screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: colorPrincipal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Images/LogoLogGeneral.png',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const Text("Como quieres ingresar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: screenWidth * 0.8,
              height: 45,
              child: metodosInicio(Icons.facebook, 'Facebook'),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: screenWidth * 0.8,
              height: 45,
              child: metodosInicio(Icons.g_mobiledata, 'Google'),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: screenWidth * 0.8,
              height: 45,
              child: metodosInicio(Icons.apple, 'Apple'),
            ),
            const SizedBox(
              height: 30,
            ),
            divider(screenWidth),
            const SizedBox(
              height: 30,
            ),
            botonIniciarPass(screenWidth),
            const SizedBox(
              height: 30,
            ),
            registrarse(),
          ],
        ),
      ),
    );
  }

  Row registrarse() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿No tienes una cuenta?',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Registrar');
                },
                child: const Text(
                  'Registrate',
                  style: TextStyle(color: colorSecundario, fontSize: 15),
                ),
              ),
            ],
          );
  }

  Row divider(double screenWidth) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.4,
                height: 4,
                color: colorPrincipalExtraLight,
              ),
              const Text(
                '  O  ',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Container(
                width: screenWidth * 0.4,
                height: 4,
                color: colorPrincipalExtraLight,
              ),
            ],
          );
  }

  ElevatedButton botonIniciarPass(double screenWidth) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorSecundario,
        minimumSize:  Size(screenWidth * 0.75, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      onPressed: () {},
      child: const Text(
        "Iniciar con correo",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  ElevatedButton metodosInicio(IconData icono, String marca) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorPrincipalLight,
        side: const BorderSide(
            color: Color(0xff35383F),
            width: 1), // Cambia el color y el ancho del borde aquí
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icono),
          Text(
            ' Continuar con $marca',
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}
