import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:las_delicias_de_mi_tierra/domain/entities/product_entity.dart';
import 'package:las_delicias_de_mi_tierra/ui/themes/app_theme_light.dart';

class CustomCartItem extends StatelessWidget {
  final ProductEntity productEntity;
  const CustomCartItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 18),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                color: AppThemeLight.cardColor,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(image: AssetImage(productEntity.path!))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productEntity.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text('Cantidad ${productEntity.quantity}')
              ],
            ),
          ),
          const Spacer(),
          Text(
            '\$${productEntity.price}',
            style: GoogleFonts.poppins(
                color: AppThemeLight.secondary,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
