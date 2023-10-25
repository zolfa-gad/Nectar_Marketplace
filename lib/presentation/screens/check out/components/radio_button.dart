import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/colors.dart';
import '../../../components/text_widget.dart';
import '../../cart/cubit/carts_cubit.dart';
import '../../cart/cubit/carts_state.dart';
import '../models/pay_radio_button.dart';

class PaymentRadioButton extends StatelessWidget {
  const PaymentRadioButton({
    Key? key,
    required this.radioItem,
  }) : super(key: key);

  final RadioButtonModel radioItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        return RadioListTile(
          value: radioItem.value,
          activeColor: greenColor,
          selectedTileColor: greenColor,
          secondary: Icon(
            radioItem.icon,
            size: 30,
            color: radioItem.value == CartsCubit.get(context).radioListValue
                ? greenColor
                : Colors.black45,
          ),
          groupValue: CartsCubit.get(context).radioListValue,
          title: DefaultText(
            text: radioItem.title,
            size: 20,
            color: Colors.black87,
            align: TextAlign.left,
          ),
          onChanged: (value) {
            CartsCubit.get(context).onRadioListChange(value);
          },
        );
      },
    );
  }
}
