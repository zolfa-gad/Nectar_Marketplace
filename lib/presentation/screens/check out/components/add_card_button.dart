import 'package:flutter/material.dart';

import '../../../../data/constants/buttons.dart';
import '../../../components/orange_button.dart';
import '../../../components/show_toast.dart';
import '../../cart/cubit/carts_cubit.dart';

class AddCardButton extends StatelessWidget {
  const AddCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultOrangeButton(
        text: addCardButton,
        padding: const EdgeInsets.symmetric(vertical: 20),
        onPressed: () {
          if (CartsCubit.get(context).nameController.text.isNotEmpty &&
              CartsCubit.get(context).numberController.text.isNotEmpty) {
            //save data with shared prefes

            Navigator.pop(context);
            Navigator.pop(context);
          } else {
            ShowToast.get(msg: 'Please Enter Your Data.');
          }
        },
      ),
    );
  }
}
