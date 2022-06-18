import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';
import '../../utils/fonts.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      this.label,
      this.obscureText,
      this.validator,
      this.onChanged,
      this.controller,
      this.suffix,
      this.enabled = true})
      : super(key: key);
  final String? label;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool enabled;

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
            suffixIcon: suffix,
          ),
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          enabled: enabled,
        ),
      ],
    );
  }
}
