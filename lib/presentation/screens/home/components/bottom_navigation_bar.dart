import 'package:flutter/material.dart';

import 'navigate_items.dart';

class BottomNavigateBar extends StatelessWidget {
  const BottomNavigateBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
          ),
        ],
        // color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: const NavigateItems(),
    );
  }
}
