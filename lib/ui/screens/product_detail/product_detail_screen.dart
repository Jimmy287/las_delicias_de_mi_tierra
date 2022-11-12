import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:las_delicias_de_mi_tierra/domain/entities/product_entity.dart';
import 'package:las_delicias_de_mi_tierra/ui/tabs/home/widgets/custom_button.dart';
import 'package:las_delicias_de_mi_tierra/ui/themes/app_theme_light.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailScreen({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(productEntity.path!)),
                          color: AppThemeLight.cardColor,
                          borderRadius: BorderRadius.circular(36),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                offset: const Offset(5, 5),
                                blurRadius: 10,
                                spreadRadius: 5)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productEntity.name!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${productEntity.price}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  color: AppThemeLight.secondary,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              productEntity.description!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: GoogleFonts.poppins(
                                  color: Colors.black54, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: 'Agregar al carrito',
                    onPressed: () => print('Add to cart'),
                    icon: Icons.shopping_cart_outlined,
                    width: double.infinity,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 45,
                height: 45,
                margin: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppThemeLight.background,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 5)
                  ],
                ),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
