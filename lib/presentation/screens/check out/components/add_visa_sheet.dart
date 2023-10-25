import 'package:flutter/material.dart';

import '../../../components/text_widget.dart';
import '../../cart/cubit/carts_cubit.dart';
import '../constants/consts.dart';
import 'add_card_button.dart';
import 'bottom_sheet_title.dart';
import 'drop_down_button.dart';
import 'text_field.dart';

class AddVisaSheet extends StatelessWidget {
  const AddVisaSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomSheetTitle(
            title: visaTitle,
            onPressed: null,
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CardField(
                  title: 'Name',
                  hint: 'Enter Card Name',
                  inputType: TextInputType.name,
                  controller: CartsCubit.get(context).nameController,
                ),
                CardField(
                  title: 'Number',
                  hint: 'Enter Card Number',
                  inputType: TextInputType.number,
                  controller: CartsCubit.get(context).numberController,
                ),
                const DefaultText(
                  text: 'Expiration Date',
                  size: 20,
                  color: Colors.black,
                  align: TextAlign.left,
                  padding: EdgeInsets.fromLTRB(10, 12, 10, 5),
                ),
                Row(
                  children: const [
                    Expanded(
                      child: MenuButton(
                        counter: 1,
                        itemsNumber: 12,
                      ),
                    ),
                    Expanded(
                      child: MenuButton(
                        counter: 2022,
                        itemsNumber: 20,
                      ),
                    ),
                  ],
                ),
                const AddCardButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
