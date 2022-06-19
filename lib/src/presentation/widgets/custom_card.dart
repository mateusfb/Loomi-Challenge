import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key, this.child}) : super(key: key);

  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: CustomColors.cardBorderColor, width: 1),
      ),
      color: CustomColors.cardColor.withOpacity(0.4),
      margin: const EdgeInsets.all(10),
      child: child,
    );
  }
}
