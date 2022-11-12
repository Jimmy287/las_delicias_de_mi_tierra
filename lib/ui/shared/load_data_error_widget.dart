import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadDataErrorWidget extends StatelessWidget {
  const LoadDataErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Ha ocurrido un error al cargar los productos. Por favor intente nuevamente.',
        textAlign: TextAlign.justify,
        style: GoogleFonts.poppins(color: Colors.black54, fontSize: 16),
      ),
    );
  }
}
