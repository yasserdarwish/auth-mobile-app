import 'package:flutter/material.dart';

class RememberMeRow extends StatefulWidget {
  const RememberMeRow({super.key, required this.text});
  final String text;

  @override
  State<RememberMeRow> createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 17,
            width: 16,
            child: Transform.scale(
              scale: 0.8,
              child: Checkbox.adaptive(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  value: isChecked,
                  onChanged: (checked) {
                    isChecked = checked!;
                    setState(() {});
                  }),
            ),
          ),
          const SizedBox(width: 8),
          const Text('Remember me',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Text(widget.text,
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
