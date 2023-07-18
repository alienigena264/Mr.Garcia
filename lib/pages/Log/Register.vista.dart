import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    final screenHeight = screenSize.height;
    // ignore: unused_local_variable
    final screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: colorPrincipal,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  "Crea tu cuenta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              inputsBasic(screenWidth, Icons.email, 'Correo', false),
              const SizedBox(
                height: 20,
              ),
              inputsBasic(screenWidth, Icons.lock, 'Contraseña', true),
              const SizedBox(
                height: 35,
              ),
              registrarseBtn(screenWidth),
              const SizedBox(
                height: 40,
              ),
              dividerCustom(screenWidth),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  metodosRegistrarse(screenWidth, Icons.facebook, Colors.blue),
                  const SizedBox(
                    width: 20,
                  ),
                  metodosRegistrarse(
                      screenWidth, Icons.g_mobiledata, Colors.red),
                  const SizedBox(
                    width: 20,
                  ),
                  metodosRegistrarse(screenWidth, Icons.apple, Colors.white),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿Ya tienes una cuenta?',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/logGeneral');
                    },
                    child: const Text(
                      'Inicia sesión',
                      style: TextStyle(color: colorSecundario, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }

  Row dividerCustom(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.28,
          height: 3,
          color: colorPrincipalExtraLight,
        ),
        const Text(
          '  o continua con  ',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        Container(
          width: screenWidth * 0.28,
          height: 3,
          color: colorPrincipalExtraLight,
        ),
      ],
    );
  }

  Center registrarseBtn(double screenWidth) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorSecundario,
          minimumSize: Size(screenWidth * 0.75, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/RegistrarDetalle');
        },
        child: const Text(
          "Registrarse",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Center metodosRegistrarse(double screenWidth, IconData icono, Color color) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorPrincipalExtraLight,
            minimumSize: const Size(75, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {},
          child: Icon(
            icono,
            color: color,
          )),
    );
  }

  Center inputsBasic(
      double screenWidth, IconData icono, String labelText, bool teclado) {
    return Center(
      child: SizedBox(
        width: screenWidth * 0.8,
        height: 45,
        child: Center(
          child: TextField(
            obscureText: teclado,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.grey.shade300),
            decoration: InputDecoration(
              hoverColor: colorAuxiliar,
              filled: true,
              fillColor: colorPrincipalExtraLight,
              prefixIcon: Icon(
                icono,
                color: Colors.grey.shade500,
              ),
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.grey.shade500),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: colorPrincipalLight),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: colorPrincipalLight),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
