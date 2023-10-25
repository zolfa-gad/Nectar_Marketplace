import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../data/constants/colors.dart';
import '../../../components/text_widget.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final Function(Country)? onCountryChanged;

  const PhoneNumberField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
    this.onCountryChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorWidth: 2,
      cursorColor: orangeColor,
      autofocus: true,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      dropdownIconPosition: IconPosition.trailing,
      initialCountryCode: 'EG',
      // showCountryFlag: false,
      // disableLengthCheck: true,
      flagsButtonPadding: const EdgeInsets.only(left: 12),
      dropdownTextStyle: const TextStyle(
        fontSize: 20,
      ),
      dropdownIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.grey,
      ),
      style: const TextStyle(height: 2),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorMaxLines: 2,
        label: DefaultText(
          text: label,
          size: 20,
          weight: FontWeight.w600,
          // color: Colors.black54,
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          // color: Colors.black54,
        ),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: orangeColor,
            width: 2,
          ),
        ),
      ),
      onCountryChanged: onCountryChanged,
    );
  }
}
