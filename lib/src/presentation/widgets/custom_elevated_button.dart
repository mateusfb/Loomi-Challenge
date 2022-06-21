import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.text,
      this.fillColor,
      this.loadingColor,
      required this.onPressed,
      this.size,
      this.loading = false,
      this.shape})
      : super(key: key);
  final Text text;
  final Color? fillColor;
  final Color? loadingColor;
  final Function()? onPressed;
  final Size? size;
  final bool loading;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        child: loading
            ? CircularProgressIndicator(
                color: loadingColor,
              )
            : text,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(size),
          backgroundColor:
              MaterialStateProperty.all(fillColor ?? CustomColors.white),
          shape: MaterialStateProperty.all(
            shape ??
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
