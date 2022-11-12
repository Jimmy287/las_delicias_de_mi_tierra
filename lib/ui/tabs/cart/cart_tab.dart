import 'package:flutter/material.dart';
import 'package:las_delicias_de_mi_tierra/data/repositories/json_get_products.dart';
import 'package:las_delicias_de_mi_tierra/domain/entities/product_entity.dart';
import 'package:las_delicias_de_mi_tierra/ui/screens/product_detail/product_detail_screen.dart';
import 'package:las_delicias_de_mi_tierra/ui/shared/load_data_error_widget.dart';
import 'package:las_delicias_de_mi_tierra/ui/tabs/cart/widgets/custom_cart_item.dart';
import 'package:las_delicias_de_mi_tierra/ui/tabs/home/widgets/custom_button.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductEntity>>(
        future: JsonGetProducts.readProductsJson(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            const LoadDataErrorWidget();
          }
          if (snapshot.hasData) {
            final List<ProductEntity> productsList = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: productsList.length,
                        itemBuilder: (context, index) =>
                            CustomCartItem(productEntity: productsList[index])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.08),
                    child: CustomButton(
                      text: 'Pagar',
                      onPressed: () => print('Payed'),
                      width: double.infinity,
                      icon: Icons.payment_rounded,
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        });
  }
}
