import 'package:flutter/material.dart';

import '../../utils/fonts.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    Key? key,
    required this.items,
    this.value,
    this.icon,
    required this.onChanged,
    this.color = Colors.black,
  }) : super(key: key);

  final List<DropdownMenuItem<Object>> items;
  final Object? value;
  final IconData? icon;
  final Function(Object?) onChanged;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            isDense: true,
            value: value,
            icon: Icon(
              icon,
              color: color,
            ),
            onChanged: onChanged,
            items: items,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: color),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
