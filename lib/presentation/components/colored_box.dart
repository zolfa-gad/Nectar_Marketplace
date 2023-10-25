import 'package:flutter/material.dart';

class DefaultColoredBox extends StatelessWidget {
  const DefaultColoredBox({
    Key? key,
    this.child,
    this.isAllColored = false,
  }) : super(key: key);

  final Widget? child;
  final bool isAllColored;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: isAllColored ? Alignment.bottomLeft : Alignment.center,
          colors: [
            Colors.green[100]!.withOpacity(0.7),
            Colors.orange[100]!.withOpacity(0.5),
            Colors.white,
            Colors.white,
            // Colors.white,
          ],
        ),
      ),
      child: child,
    );
  }
}
