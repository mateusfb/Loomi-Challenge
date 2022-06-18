import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.text,
      this.fillColor,
      this.textColor,
      required this.onPressed,
      this.size})
      : super(key: key);
  final Text text;
  final Color? fillColor;
  final Color? textColor;
  final Function() onPressed;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        child: text,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(size),
          backgroundColor:
              MaterialStateProperty.all(fillColor ?? CustomColors.white),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              side: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
