import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';
import '../../utils/custom_icons.dart';
import '../../utils/fonts.dart';
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
    StorePage(),
    CartPage(),
    ProfilePage(),
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
              CustomIcons.shop,
            ),
            title: Text(
              'Loja',
              style: Fonts.navigationItemTextStyle,
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(
              CustomIcons.cart,
            ),
            title: Text(
              'Carrinho',
              style: Fonts.navigationItemTextStyle,
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(
              CustomIcons.person,
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
          SizedBox(
            width: screenSize.width,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: pages[_activePage],
            ),
          ),
        ],
      ),
    );
  }
}
