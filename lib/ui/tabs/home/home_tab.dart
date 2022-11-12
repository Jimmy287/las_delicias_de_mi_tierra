import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:las_delicias_de_mi_tierra/domain/entities/product_entity.dart';
import 'package:las_delicias_de_mi_tierra/ui/tabs/home/widgets/custom_product_card.dart';
import 'package:las_delicias_de_mi_tierra/ui/themes/app_theme_light.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: readProductsJson(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text(
                'Ha ocurrido un error al cargar los productos. Por favor intente nuevamente.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(color: Colors.black54, fontSize: 16),
              ),
            );
          }
          if (snapshot.hasData) {
            final List<ProductEntity> productsList = snapshot.data!;
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 26, vertical: size.height * 0.07),
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
                        style: GoogleFonts.poppins(
                            color: Colors.black54, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: productsList.length,
                        itemBuilder: (context, index) => CustomProductCard(
                            size: size, productEntity: productsList[index])),
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  // CustomProductCard(size: size),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        });
  }

  Future<List<ProductEntity>> readProductsJson() async {
    final String response =
        await rootBundle.loadString('assets/json/product_list.json');
    final data = await jsonDecode(response);
    final List<dynamic> productList = data['products'];
    return productList
        .map((product) => ProductEntity.fromJson(product))
        .toList();
    // print(data.toString());
  }
}
