import 'package:auth_mobile_app/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      required this.icon,
      this.onPressed,
      required this.hint,
      this.controller,
      this.obsecured = false});
  final String hint;
  final String icon;
  final void Function()? onPressed;
  final TextEditingController? controller;
  final bool obsecured;
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
          CustomTextFormField(
            icon: icon,
            onPressed: onPressed,
            controller: controller,
            obsecured: obsecured,
          ),
        ],
      ),
    );
  }
}
