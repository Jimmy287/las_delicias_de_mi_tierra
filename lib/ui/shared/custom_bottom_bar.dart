import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:las_delicias_de_mi_tierra/global/enviroment.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:las_delicias_de_mi_tierra/domain/providers/bottom_bar_provider.dart';
import 'package:las_delicias_de_mi_tierra/ui/themes/app_theme_light.dart';
import 'package:provider/provider.dart';

late AnimationController animationController;
bool notificationReceived = false;

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottombarProvider bottombarProvider =
        Provider.of<BottombarProvider>(context);
    final double height = MediaQuery.of(context).size.height * 0.08;
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomBarItem(
            index: 0,
            icon: Icons.home_outlined,
            callback: () {
              bottombarProvider.currentIndex = 0;
            },
            bottombarProvider: bottombarProvider,
            height: height,
          ),
          BottomBarItem(
            index: 1,
            icon: FontAwesomeIcons.whatsapp,
            callback: () async {
              // Send WhatsApp message to number phone
              final Uri _url = Uri.parse(
                  "whatsapp://send?phone=${Enviroment.whatsappNumber}&text=Hola");
              if (!await launchUrl(_url)) throw 'Could not launch $_url';
            },
            bottombarProvider: bottombarProvider,
            height: height,
          ),
          BottomBarItem(
            index: 2,
            icon: Icons.shopping_cart_outlined,
            callback: () {
              bottombarProvider.currentIndex = 2;
            },
            bottombarProvider: bottombarProvider,
            height: height,
          ),
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final int index;
  final VoidCallback callback;
  final BottombarProvider bottombarProvider;
  final IconData icon;
  final double iconSize;
  final double height;
  const BottomBarItem({
    Key? key,
    required this.index,
    required this.callback,
    required this.bottombarProvider,
    required this.icon,
    required this.height,
    this.iconSize = 34,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => bottombarProvider.currentIndex == index
      ? Column(
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              from: 10,
              child: Container(
                height: height,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: AppThemeLight.secondary,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppThemeLight.secondary.withAlpha(56),
                        blurRadius: 12.0,
                        spreadRadius: 0.0,
                        offset: const Offset(
                          8.0,
                          8.0,
                        ),
                      ),
                    ]),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        icon,
                        color: Colors.white,
                        size: iconSize,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
          ],
        )
      : InkWell(
          onTap: callback,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Icon(
                icon,
                color: AppThemeLight.primary,
                size: iconSize,
              ),
              const Spacer()
            ],
          ),
        );
}
