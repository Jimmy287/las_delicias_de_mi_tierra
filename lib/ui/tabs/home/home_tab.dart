import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:las_delicias_de_mi_tierra/ui/themes/app_theme_light.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 26, vertical: size.height * 0.14),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('¿Quiénes somos?',
                  style: GoogleFonts.poppins(
                      color: AppThemeLight.primary,
                      fontSize: 32,
                      fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 8,
              ),
              Text(
                'La empresa dedicada a la producción y comercialización de postres creados a base de frutas típicas o endémicas de la región (borojó, almirajó, piña, chontaduro y cacao) ubicada en Quibdó – Chocó',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(color: Colors.black54, fontSize: 16),
              ),
            ],
          ),
          Spacer(),
          // CustomProductCard(size: size),
        ],
      ),
    );
  }
}
