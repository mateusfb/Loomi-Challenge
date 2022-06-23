import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xtintas/src/external/models/benefit.dart';
import 'package:xtintas/src/external/models/cart_item.dart';
import 'package:xtintas/src/external/models/paint.dart';
import 'package:xtintas/src/presentation/stores/cart_store.dart';
import 'package:xtintas/src/presentation/stores/paint_store.dart';
import 'package:xtintas/src/presentation/widgets/custom_image_container.dart';
import 'package:xtintas/src/presentation/widgets/custom_loader.dart';

import '../../../utils/custom_colors.dart';
import '../../../utils/custom_icons.dart';
import '../../../utils/fonts.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_elevated_button.dart';

class StorePage extends StatelessWidget {
  StorePage({Key? key}) : super(key: key);

  final PaintStore paintStore = GetIt.I.get<PaintStore>();
  final CartStore cartStore = GetIt.I.get<CartStore>();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    if (cartStore.itensInCart.isEmpty) cartStore.fetchItemsInCart();

    return FutureBuilder(
      future: paintStore.getPaints(),
      builder: (context, AsyncSnapshot<List<Paint>?> snapshot) {
        if (snapshot.hasData) {
          List<Paint> paints = snapshot.data!;
          paintStore.changeSelectedPaint(0);

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Text(
                      'Opções de tintas',
                      style: Fonts.title2,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Flexible(
                      child: ExpandablePageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: paints.length,
                        controller: pageController,
                        itemBuilder: (context, index) => _PaintItem(
                          paint: paints.elementAt(index),
                        ),
                        onPageChanged: paintStore.changeSelectedPaint,
                      ),
                    ),
                    Observer(
                      builder: (_) => _BenefitsCard(
                          benefits: paints
                              .elementAt(paintStore.selectedPaint)
                              .benefits),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      text: Text(
                        'Adicionar ao carrinho',
                        style: Fonts.boldButtonTextStyle,
                      ),
                      onPressed: () async {
                        Paint paint =
                            paints.elementAt(paintStore.selectedPaint);

                        showLoading(context);

                        if (cartStore.itensInCart.containsKey(paint.name) &&
                            cartStore.itensInCart[paint.name]!.quantity < 5) {
                          await cartStore.putCartItem(
                              cartStore.itensInCart[paint.name]!.id!,
                              cartStore.itensInCart[paint.name]!.quantity + 1);
                          await cartStore.fetchItemsInCart();
                        } else if (!cartStore.itensInCart
                            .containsKey(paint.name)) {
                          CartItem c = CartItem(paint: paint, quantity: 1);

                          await cartStore.postCartItem(c);
                          await cartStore.fetchItemsInCart();
                        }

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
    );
  }
}

class _PaintItem extends StatelessWidget {
  const _PaintItem({Key? key, required this.paint}) : super(key: key);

  final Paint paint;

  final Radius _radius = const Radius.circular(40);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  color: CustomColors.cardIndicationColor,
                ),
                child: Text(
                  'Indicação',
                  style: Fonts.indicationCardTextStyle,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_rounded,
                  color: CustomColors.cardIndicationColor,
                  size: 35,
                ),
                CustomImageContainer(
                  imageUrl: paint.image,
                  scale: 7,
                  loadingColor: CustomColors.secondary,
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: CustomColors.cardIndicationColor,
                  size: 35,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              paint.name,
              style: Fonts.subtitle2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: Text(
                      'Como pintar',
                      style: Fonts.boldButtonTextStyle,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'how_to_paint');
                    },
                    fillColor: CustomColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: _radius, topLeft: _radius),
                    ),
                    size: const Size(0, 44),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    text: Text(
                      'Tirar dúvidas',
                      style: Fonts.boldButtonTextStyle,
                    ),
                    onPressed: null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: _radius, topRight: _radius),
                    ),
                    fillColor: CustomColors.mediumGrey,
                    size: const Size(0, 44),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class _BenefitsCard extends StatelessWidget {
  const _BenefitsCard({Key? key, required this.benefits}) : super(key: key);

  final List<Benefit> benefits;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diferenciais',
              style: Fonts.title3,
            ),
            Column(
              children: benefits
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Row(
                        children: [
                          Icon(
                            CustomIcons.fromName(e.icon),
                            color: CustomColors.black,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            e.name,
                            style: Fonts.subtitle3,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
