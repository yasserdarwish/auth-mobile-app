import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onPressed, required this.text, this.color});
  final void Function()? onPressed;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: MaterialButton(
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(4)),
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        onPressed: onPressed,
        color: color,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
