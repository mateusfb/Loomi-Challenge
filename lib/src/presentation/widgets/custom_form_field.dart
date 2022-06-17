import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';
import '../../utils/fonts.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({Key? key, this.label, this.obscureText})
      : super(key: key);
  final String? label;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              label!,
              style: Fonts.formLabel,
            ),
          ),
        TextFormField(
          style: Fonts.inputTextStyle,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              borderSide: BorderSide.none,
            ),
            fillColor: CustomColors.white.withOpacity(0.3),
            filled: true,
          ),
        ),
      ],
    );
  }
}
