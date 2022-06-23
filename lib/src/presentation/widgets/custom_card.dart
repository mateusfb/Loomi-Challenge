import 'package:flutter/material.dart';
import 'package:xtintas/src/utils/custom_colors.dart';

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
      color: CustomColors.cardColor.withOpacity(0.5),
      child: child,
      elevation: 0,
    );
  }
}
