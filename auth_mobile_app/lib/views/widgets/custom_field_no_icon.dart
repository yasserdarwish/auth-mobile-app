import 'package:flutter/material.dart';

class CustomFieldNoIcon extends StatelessWidget {
  const CustomFieldNoIcon({super.key, required this.hint, this.controller});
  final String hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hint,
            style: const TextStyle(color: Color(0xff808194), fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            readOnly: true,
            controller: controller,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
