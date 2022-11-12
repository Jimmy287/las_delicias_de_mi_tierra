import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:las_delicias_de_mi_tierra/domain/entities/product_entity.dart';
import 'package:las_delicias_de_mi_tierra/ui/screens/product_detail/product_detail_screen.dart';
import 'package:las_delicias_de_mi_tierra/ui/themes/app_theme_light.dart';

class CustomProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const CustomProductCard({
    super.key,
    required this.size,
    required this.productEntity,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailScreen(productEntity: productEntity),
          )),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
        decoration: BoxDecoration(
          color: AppThemeLight.background,
          borderRadius: BorderRadius.circular(22),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(5, 5),
                blurRadius: 10,
                spreadRadius: 5)
          ],
        ),
        height: size.height * 0.35,
        width: size.width * 0.75,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                  color: AppThemeLight.cardColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
              child: Column(
                children: [
                  Text(productEntity.name!,
                      style: GoogleFonts.dancingScript(
                          color: AppThemeLight.primary,
                          fontSize: 52,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 46),
                    child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(productEntity.path!)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    productEntity.description!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                        color: Colors.black54, fontSize: 16),
                  ),
                  Text(
                    '\$${productEntity.price}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                        color: AppThemeLight.secondary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
