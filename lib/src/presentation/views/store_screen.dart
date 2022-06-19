import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/paint.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/custom_elevated_button.dart';

import '../../utils/custom_colors.dart';
import '../../utils/fonts.dart';
import '../widgets/custom_card.dart';
import 'pages/cart_page.dart';
import 'pages/profile_page.dart';
import 'pages/store_page.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  static const routeName = "store";

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List<Widget> pages = [
    const StorePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 25,
        borderRadius: const Radius.circular(20),
        elevation: 20,
        strokeColor: CustomColors.secondary,
        selectedColor: CustomColors.secondary,
        unSelectedColor: CustomColors.mediumGrey,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(
              Icons.storefront,
            ),
            title: Text(
              'Loja',
              style: Fonts.navigationItemTextStyle,
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
            title: Text(
              'Carrinho',
              style: Fonts.navigationItemTextStyle,
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(
              Icons.person_outline,
            ),
            title: Text(
              'Perfil',
              style: Fonts.navigationItemTextStyle,
            ),
          ),
        ],
        currentIndex: _activePage,
        onTap: (index) {
          setState(() {
            _activePage = index;
          });
        },
      ),
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            color: CustomColors.lightGrey,
          ),
          Positioned(
            left: -150,
            top: 130,
            child: Container(
              width: screenSize.height / 2.5,
              height: screenSize.height / 2.5,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    CustomColors.secondary.withOpacity(0.3),
                    CustomColors.lightGrey.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 200,
            top: 400,
            child: Container(
              width: screenSize.height / 2.5,
              height: screenSize.height / 2.5,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    CustomColors.secondary.withOpacity(0.3),
                    CustomColors.lightGrey.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: screenSize.width, child: pages[_activePage]),
        ],
      ),
    );
  }
}
