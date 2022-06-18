import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class TogglePasswordVisibilityButton extends StatelessWidget {
  const TogglePasswordVisibilityButton(
      {Key? key, required this.showPassword, required this.onTap})
      : super(key: key);

  final bool showPassword;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        showPassword ? Icons.visibility : Icons.visibility_off,
        color: CustomColors.primary,
      ),
      onTap: onTap,
    );
  }
}
