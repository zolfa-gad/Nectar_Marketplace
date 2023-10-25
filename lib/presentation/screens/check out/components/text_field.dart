import 'package:flutter/material.dart';

import '../../../../data/constants/fonts.dart';

class CardField extends StatelessWidget {
  const CardField({
    Key? key,
    required this.title,
    required this.hint,
    this.inputType,
    required this.controller,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextInputType? inputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      child: TextField(
        controller: controller,
        textCapitalization: TextCapitalization.words,
        keyboardType: inputType,
        maxLength: title == 'Number' ? 14 : 50,
        style: TextStyle(
          fontFamily: title == 'Number' ? questrialFont : robotoFont,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.orange[200]!,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.orange[200]!,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
