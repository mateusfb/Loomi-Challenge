import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:xtintas/src/domain/repositories/i_cart_repository.dart';
import 'package:xtintas/src/external/models/cart_item.dart';
import 'package:xtintas/src/presentation/stores/cart_store.dart';
import 'package:xtintas/src/presentation/widgets/custom_card.dart';
import 'package:xtintas/src/presentation/widgets/custom_dropdown_button.dart';
import 'package:xtintas/src/presentation/widgets/custom_elevated_button.dart';
import 'package:xtintas/src/presentation/widgets/custom_image_container.dart';
import 'package:xtintas/src/presentation/widgets/custom_loader.dart';
import 'package:xtintas/src/utils/custom_colors.dart';
import 'package:xtintas/src/utils/fonts.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final CartStore cartStore = GetIt.I.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => FutureBuilder(
        future: cartStore.cartItemList,
        builder: (context, AsyncSnapshot<List<CartItem>?> snapshot) {
          if (snapshot.hasData) {
            List<CartItem> itemList = snapshot.data!;

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        'Carrinho',
                        style: Fonts.title2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      itemList.isEmpty
                          ? const Expanded(
                              child: Center(
                                child: Text('Seu carrinho está vazio.'),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: itemList.length,
                                itemBuilder: (context, index) => _CartItemCard(
                                  cartItem: itemList.elementAt(index),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                itemList.isEmpty
                    ? Container()
                    : Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              text: Text(
                                'Confirmar compra',
                                style: Fonts.boldButtonTextStyle,
                              ),
                              onPressed: () async {
                                showLoading(context);

                                for (CartItem c in itemList) {
                                  await cartStore.deleteCartItem(c.id!);
                                }

                                await cartStore.fetchItemsInCart();

                                Navigator.pop(context);
                              },
                              fillColor: CustomColors.secondary,
                              size: const Size(0, 60),
                            ),
                          ),
                        ],
                      ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar página'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: CustomColors.secondary),
            );
          }
        },
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  _CartItemCard({Key? key, required this.cartItem}) : super(key: key);

  final CartStore cartStore = GetIt.I.get<CartStore>();

  final CartItem cartItem;
  final Map<String, int> quantities = {
    "1 un.": 1,
    "2 un.": 2,
    "3 un.": 3,
    "4 un.": 4,
    "5 un.": 5,
  };

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () async {
                showLoading(context);

                await cartStore.deleteCartItem(cartItem.id!);
                await cartStore.fetchItemsInCart();

                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                CustomImageContainer(
                  imageUrl: cartItem.paint.image,
                  scale: 10,
                  loadingColor: CustomColors.secondary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              cartItem.paint.name,
                              style: Fonts.cardItemTitle,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: CustomDropdownButton(
                              value: cartItem.quantity,
                              items: quantities.entries
                                  .map((entry) => DropdownMenuItem(
                                      value: entry.value,
                                      child: Text(entry.key)))
                                  .toList(),
                              onChanged: (value) async {
                                showLoading(context);

                                await cartStore.putCartItem(
                                    cartItem.id!, value as int);
                                await cartStore.fetchItemsInCart();

                                Navigator.pop(context);
                              },
                              icon: Icons.keyboard_arrow_down_rounded,
                              color: CustomColors.mediumGrey,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              NumberFormat.simpleCurrency(locale: 'pt_BR')
                                  .format(cartItem.paint.price),
                              style: Fonts.cardItemPrice,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
