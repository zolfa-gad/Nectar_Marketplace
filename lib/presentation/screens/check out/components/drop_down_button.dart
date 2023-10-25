import 'package:flutter/material.dart';

import '../../../../data/constants/fonts.dart';
import '../../../components/text_widget.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.counter,
    required this.itemsNumber,
  }) : super(key: key);

  final int counter;
  final int itemsNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      child: DropdownButtonFormField(
        value: counter,
        focusColor: Colors.orange[200]!,
        borderRadius: BorderRadius.circular(10),
        menuMaxHeight: 250,
        isExpanded: false,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 25,
        ),
        decoration: InputDecoration(
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
        items: List.generate(
          itemsNumber,
          (index) => DropdownMenuItem(
            value: counter + index,
            child: Center(
              child: DefaultText(
                text: '${counter + index}'.padLeft(2, '0'),
                size: 18,
                fontFamily: questrialFont,
              ),
            ),
          ),
        ),
        onChanged: (newValue) {
          // setState(() {
          //   dropdownvalue = newValue!;
          // });
        },
      ),
    );
  }
}
