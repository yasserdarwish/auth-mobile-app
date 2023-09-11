import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(4)),
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        onPressed: onPressed,
        color: Color(0xff007BFF),
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
