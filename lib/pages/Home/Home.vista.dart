import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mr_garcia_app/pages/Inicio/InicioInfo1.vista.dart';
import 'package:mr_garcia_app/pages/colors.dart';

class HomeGeneral extends StatefulWidget {
  const HomeGeneral({super.key});

  @override
  State<HomeGeneral> createState() => _HomeGeneralState();
}

class _HomeGeneralState extends State<HomeGeneral> {
  int selectedPage = 0;
  final List<Widget> pages = [
    const InicioInfo1(),
    const InicioInfo1(),
    const InicioInfo1(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Esto sirve para mantener el movimiento entre paginas
      extendBody: true,
      body: Container(
        child: pages[selectedPage],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          index: selectedPage,
          height: 40,
          items: <Widget>[
            _buildNavItem(selectedPage == 0),
            _buildNavItem(selectedPage == 1),
            _buildNavItem(selectedPage == 2),
          ],
          //Colores circulo item seleccionado
          buttonBackgroundColor: colorPrincipal,
          //color aura item seleccionado
          backgroundColor: colorPrincipal,
          //color aura item seleccuonado
          color: colorSecundario,
          //animaciones
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 200),
          //actualizar pantallas
          onTap: (index){
            setState(() {
              selectedPage = index;
            });
          },
          ),
          
    );
  }

  Widget _buildNavItem( bool isSelected){
    return Icon(isSelected ? Icons.rectangle_rounded: Icons.circle,size: 20, color: isSelected ? colorSecundario: colorPrincipal);
  }
}
