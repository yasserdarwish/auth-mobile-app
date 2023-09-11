import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset(
                icon,
              )),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
