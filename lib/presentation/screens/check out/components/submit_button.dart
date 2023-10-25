import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/buttons.dart';
import '../../../components/orange_button.dart';
import '../../cart/cubit/carts_cubit.dart';
import '../../cart/cubit/carts_state.dart';
import 'add_visa_sheet.dart';
import 'show_bottom_sheet.dart';

class SubmitPaymentButton extends StatelessWidget {
  const SubmitPaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        return Center(
          child: DefaultOrangeButton(
            text: submitButton,
            padding: const EdgeInsets.only(top: 5),
            isEnabled:
                CartsCubit.get(context).radioListValue != null ? true : false,
            onPressed: () {
              if (CartsCubit.get(context).payMethod == 2) {
                // Navigator.pop(context);
                ShowBottomSheet.get(
                  context: context,
                  enableDrag: false,
                  isDismissible: false,
                  builder: (_) {
                    return BlocProvider.value(
                      value: BlocProvider.of<CartsCubit>(context),
                      child: Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: const SizedBox(
                          height: 300,
                          child: AddVisaSheet(),
                        ),
                      ),
                    );
                  },
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
        );
      },
    );
  }
}
