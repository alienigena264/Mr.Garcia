
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/colors.dart';
import 'package:url_launcher/url_launcher.dart';


class RegisterDateil extends StatefulWidget {
  const RegisterDateil({super.key});

  @override
  State<RegisterDateil> createState() => _RegisterDateilState();
}

class _RegisterDateilState extends State<RegisterDateil> {
  // controladores de todos los campos de texto
  final emailController = TextEditingController();
  final contrasenaController = TextEditingController();
  final contrasenaConfirmacionController = TextEditingController();
  final primerNombreController = TextEditingController();
  final segundoNombreController = TextEditingController();
  final primerApellidoController = TextEditingController();
  final segundoApellidoController = TextEditingController();
  final telefonoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? emailValidator_;
  String? contrasenaValidator_;
  String? contrasenaConfirmacionValidator_;
  String? telefonoValidator_;
  String? primerNombreValidator_;
  String? segundoNombreValidator_;
  String? primerApellidoValidator_;
  String? segundoApellidoValidator_;

  @override
  void initState() {
    super.initState();


    contrasenaController.addListener(contrasenaValidator);
    contrasenaConfirmacionController
        .addListener(contrasenaConfirmacionValidator);
    primerNombreController.addListener(primerNombreValidator);
    segundoNombreController.addListener(segundoNombreValidator);
    primerApellidoController.addListener(primerApellidoValidator);
    segundoApellidoController.addListener(segundoApellidoValidator);
    telefonoController.addListener(telefonoValidator);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: colorPrincipal,
        body: SingleChildScrollView(
            child: Container(
          color: colorPrincipal,
          child: Column(
            children: [
              Stack(
                children: [
                  // Contenedor con texto y fondo
                  barraSuperior_(),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              emailInput(),
              contrasenaInput(),
              contrasenaConfirmacionInput(),
              nombres(),
              apellidos(),
              telefonoInput(),
              //aca debe ir el de confirmar
              const SizedBox(height: 40),
              registroButtom_(),
            ],
          ),
        )),
      ),
    );
  }

  SizedBox barraSuperior_() {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height*0.25;
    return SizedBox(
      height: screenHeight,
      child: Container(
        decoration: const BoxDecoration(
          color:
              colorSecundario, // Establece el color de fondo del contenedor con el texto
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0)),
        ),
        child: const Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Foto', // el texto que quieres mostrar
              style: TextStyle(
                  color: Colors.white, // Establece el color del texto
                  fontSize: 64.0, // Establece el tamaño del texto
                  fontFamily: "Inder",
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }

  Container emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: emailController,
        validator: (val) {
          return emailValidator_;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: colorPrincipalLight,
          labelText: "Correo",
          labelStyle: TextStyle(color: Colors.grey.shade700),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Container contrasenaInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: contrasenaController,
        validator: (val) {
          return contrasenaValidator_;
        },
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            errorMaxLines: 2,
            filled: true,
            fillColor: colorPrincipalLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: "Contraseña",
            labelStyle: TextStyle(color: Colors.grey.shade700),
            suffixIcon: const Icon(Icons.password)),
      ),
    );
  }

  Container contrasenaConfirmacionInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: contrasenaConfirmacionController,
        validator: (val) {
          return contrasenaConfirmacionValidator_;
        },
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            filled: true,
            fillColor: colorPrincipalLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: "Confirmar Contraseña",
            labelStyle: TextStyle(color: Colors.grey.shade700),
            suffixIcon: const Icon(Icons.password)),
      ),
    );
  }

  Row nombres() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 20),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                return primerNombreValidator_;
              },
              controller: primerNombreController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: colorPrincipalLight,
                labelText: "Primer Nombre",
                labelStyle: TextStyle(color: Colors.grey.shade700),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 30, top: 20),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: segundoNombreController,
              validator: (val) {
                return segundoNombreValidator_;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: colorPrincipalLight,
                labelText: "Segundo Nombre",
                labelStyle: TextStyle(color: Colors.grey.shade700),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row apellidos() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 20),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: primerApellidoController,
              validator: (val) {
                return primerApellidoValidator_;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: colorPrincipalLight,
                labelText: "Primer Apellido",
                labelStyle: TextStyle(color: Colors.grey.shade700),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 30, top: 20),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: segundoApellidoController,
              validator: (val) {
                return segundoApellidoValidator_;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: colorPrincipalLight,
                labelText: "Segundo Apellido",
                labelStyle: TextStyle(color: Colors.grey.shade700),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Container telefonoInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: telefonoController,
        validator: (val) {
          return telefonoValidator_;
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            filled: true,
            fillColor: colorPrincipalLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: "Teléfono",
            labelStyle: TextStyle(color: Colors.grey.shade700),
            suffixIcon: const Icon(Icons.phone)),
      ),
    );
  }

  /*Checkbox checkbox() {
    return Checkbox(
      value: null,
      onChanged:,
    );
  }*/

  ElevatedButton registroButtom_() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorSecundario,
          minimumSize: const Size(340, 55),
          // double.infinity is the width and 30 is the height
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        ),
        onPressed: () {
        },
        child: const Text(
          "Registrarme",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ));
  }


  void contrasenaValidator() {
    contrasenaConfirmacionValidator();
    var contrasena = contrasenaController.text;
    /*
    al menos una mayuscula
    al menos una minuscula
    al menos un digito
    al menos un caracter especial (!@#\$&*~)
    minimo 8 caracteres
    (?=.*?[!@#\$&*~]) carac
     */
    RegExp regexMinus = RegExp(r'[A-Z]');
    RegExp regexMayus = RegExp(r'[a-z]');
    RegExp regexNumeros = RegExp(r'[0-9]');
    RegExp regexCaracteres = RegExp(r'^.{8,16}$');

    if (contrasena.isEmpty) {
      contrasenaValidator_ = "Por favor ingrese su contrasena";
      _formKey.currentState!.validate();
    } else if (!regexCaracteres.hasMatch(contrasena)) {
      contrasenaValidator_ = "La contraseña debe tener entre 8 y 16 caracteres";
      _formKey.currentState!.validate();
    } else if (!regexMinus.hasMatch(contrasena) || !regexMayus.hasMatch(contrasena)) {
      contrasenaValidator_ = "La contraseña debe contener al menos una letra mayúscula y una minúscula";
      _formKey.currentState!.validate();
    } else if (!regexNumeros.hasMatch(contrasenaController.text)){
      contrasenaValidator_ = "La contraseña debe contener al menos un número";
      _formKey.currentState!.validate();
    } else {
      contrasenaValidator_ = null;
      _formKey.currentState!.validate();
    }
  }

  void contrasenaConfirmacionValidator() {
    if (contrasenaConfirmacionController.text != contrasenaController.text) {
      contrasenaConfirmacionValidator_ = "Por favor confirme su contrasena";
      _formKey.currentState!.validate();
    } else {
      contrasenaConfirmacionValidator_ = null;
      _formKey.currentState!.validate();
    }
  }

  void telefonoValidator() {
    if (telefonoController.text.isEmpty) {
      telefonoValidator_ = "Por favor ingrese su numero";
      _formKey.currentState!.validate();
    } else if (telefonoController.text.length != 10) {
      telefonoValidator_ = "Ingrese un numero valido";
      _formKey.currentState!.validate();
    } else {
      telefonoValidator_ = null;
      _formKey.currentState!.validate();
    }
  }

  void primerNombreValidator() {
    RegExp regExp = RegExp(r".*[A-Za-z].*");
    if (primerNombreController.text.isEmpty) {
      primerNombreValidator_ = "Ingrese su nombre";
      _formKey.currentState!.validate();
    } else if (!regExp.hasMatch(primerNombreController.text)) {
      primerNombreValidator_ = "Ingrese un nombre valido";
      _formKey.currentState!.validate();
    } else {
      primerNombreValidator_ = null;
      _formKey.currentState!.validate();
    }
  }

  void segundoNombreValidator() {
    RegExp regExp = RegExp(r"^[a-zA-Z]+$");
    if (segundoNombreController.text.isEmpty){
      segundoNombreValidator_ = null;
      _formKey.currentState!.validate();
    } else if (!regExp.hasMatch(segundoNombreController.text)) {
      segundoNombreValidator_ = "Ingrese un nombre valido";
      _formKey.currentState!.validate();
    } else {
      segundoNombreValidator_ = null;
      _formKey.currentState!.validate();
    }
  }

  void primerApellidoValidator() {
    RegExp regExp = RegExp(r"^[a-zA-Z]+$");
    if (primerApellidoController.text.isEmpty) {
      primerApellidoValidator_ = "Ingrese su apellido";
      _formKey.currentState!.validate();
    } else if (!regExp.hasMatch(primerApellidoController.text)) {
      primerApellidoValidator_ = "Ingrese un apellido valido";
      _formKey.currentState!.validate();
    } else {
      primerApellidoValidator_ = null;
      _formKey.currentState!.validate();
    }
  }

  void segundoApellidoValidator() {
    RegExp regExp = RegExp(r"^[a-zA-Z]+$");
    if (segundoApellidoController.text.isEmpty) {
      segundoApellidoValidator_ = null;
      _formKey.currentState!.validate();
    } else if (!regExp.hasMatch(segundoApellidoController.text)) {
      segundoApellidoValidator_ = "Ingrese un apellido valido";
      _formKey.currentState!.validate();
    } else {
      segundoApellidoValidator_ = null;
      _formKey.currentState!.validate();
    }
  }

}

class AgreeCheck extends StatefulWidget {
  const AgreeCheck({super.key});

  @override
  State<AgreeCheck> createState() => _Checkbox();
}

class _Checkbox extends State<AgreeCheck> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
        width: 250.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: 'Acepto los ', // el texto que quieres mostrar
                        style: TextStyle(
                            color: Colors.black, // Establece el color del texto
                            fontSize: 14.0, // Establece el tamaño del texto
                            fontFamily: "Inder",
                            fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                          text: 'términos y condiciones',
                          style: const TextStyle(
                              color: colorPrincipal, // Establece el color del texto
                              fontSize: 14.0, // Establece el tamaño del texto
                              fontFamily: "Inder",
                              fontWeight: FontWeight.normal),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              const String terminos =
                                  'https://doc-hosting.flycricket.io/chazaunapp-terms-of-use/61d6b708-bd87-4bb3-8392-cc8b9ab1fe48/terms';
                              launchUrl(Uri.parse(terminos));
                            }),
                      const TextSpan(
                        text: ' y nuestra ', // el texto que quieres mostrar
                        style: TextStyle(
                            color: Colors.black, // Establece el color del texto
                            fontSize: 14.0, // Establece el tamaño del texto
                            fontFamily: "Inder",
                            fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                          text: 'política de privacidad.',
                          style: const TextStyle(
                              color: colorPrincipal, // Establece el color del texto
                              fontSize: 14.0, // Establece el tamaño del texto
                              fontFamily: "Inder",
                              fontWeight: FontWeight.normal),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              const String politica =
                                  'https://doc-hosting.flycricket.io/chazaunapp-privacy-policy/f674154c-f1f3-4291-a55f-77743561a2b2/privacy';
                              launchUrl(Uri.parse(politica));
                            })
                    ]))),
          ],
        ));
  }
}