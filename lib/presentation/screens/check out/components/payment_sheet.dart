import 'package:flutter/material.dart';

import '../constants/consts.dart';
import 'bottom_sheet_title.dart';
import 'radio_button.dart';
import 'submit_button.dart';

class PaymentSheet extends StatelessWidget {
  const PaymentSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetTitle(
            title: paymentTitle,
            onPressed: null,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return PaymentRadioButton(
                  radioItem: payRadioBtns[index],
                );
              },
            ),
          ),
          const SubmitPaymentButton(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
