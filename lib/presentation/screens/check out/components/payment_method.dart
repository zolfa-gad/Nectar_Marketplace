import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/cubit/carts_cubit.dart';
import 'check_item.dart';
import 'payment_sheet.dart';
import 'show_bottom_sheet.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckOutItem(
      index: 1,
      onTap: () {
        debugPrint('statement: Payment');
        ShowBottomSheet.get(
          context: context,
          enableDrag: false,
          isDismissible: false,
          builder: (_) {
            return BlocProvider.value(
              value: BlocProvider.of<CartsCubit>(context),
              child: const SizedBox(
                height: 300,
                child: PaymentSheet(),
              ),
            );
          },
        );
      },
    );
  }
}
