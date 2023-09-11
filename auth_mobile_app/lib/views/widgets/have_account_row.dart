import 'package:flutter/material.dart';

class HaveAccountRow extends StatelessWidget {
  const HaveAccountRow(
      {super.key, required this.text, required this.button, this.onTap});
  final String text;
  final String button;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Row(
        children: [
          Text(text,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          const SizedBox(width: 6),
          InkWell(
            onTap: onTap,
            child: Text(button,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff4F90F0))),
          )
        ],
      ),
    );
  }
}
