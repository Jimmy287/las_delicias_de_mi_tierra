import 'package:flutter/material.dart';
import 'package:las_delicias_de_mi_tierra/domain/providers/bottom_bar_provider.dart';
import 'package:las_delicias_de_mi_tierra/ui/shared/custom_bottom_bar.dart';
import 'package:las_delicias_de_mi_tierra/ui/tabs/cart/cart_tab.dart';
import 'package:las_delicias_de_mi_tierra/ui/tabs/home/home_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget currentScreen = const HomeTab();

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BottombarProvider bottombarProvider =
        Provider.of<BottombarProvider>(context);
    switch (bottombarProvider.currentIndex) {
      case 0:
        currentScreen = const HomeTab();
        break;
      case 1:
        currentScreen = const CartTab();
        break;
      case 2:
        currentScreen = const CartTab();
        break;
      default:
    }
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          currentScreen,
          const Align(
              alignment: Alignment.bottomCenter, child: CustomBottomBar())
        ]),
      ),
    );
  }
}
