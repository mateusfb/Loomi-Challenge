import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/paint.dart';

import '../../../utils/custom_colors.dart';
import '../../../utils/fonts.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_elevated_button.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Opções de tinta',
          style: Fonts.title2,
        ),
        const SizedBox(
          height: 20,
        )
      ],
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
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              color: CustomColors.cardIndicationColor,
              child: Text(
                'Indicação',
                style: Fonts.indicationCardTextStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_rounded,
                color: CustomColors.cardIndicationColor,
              ),
              Image.network(paint.image),
              Icon(
                Icons.arrow_forward_rounded,
                color: CustomColors.cardIndicationColor,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            paint.name,
            style: Fonts.subtitle2,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                text: Text(
                  'Como pintar',
                  style: Fonts.boldButtonTextStyle,
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: _radius, topLeft: _radius),
                ),
              ),
              CustomElevatedButton(
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
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
