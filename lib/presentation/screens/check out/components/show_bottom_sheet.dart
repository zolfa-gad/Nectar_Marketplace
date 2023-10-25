import 'package:flutter/material.dart';

class ShowBottomSheet {
  static get({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    bool enableDrag = true,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet(
      context: context,
      // useRootNavigator: true,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: builder,
    );
  }
}
