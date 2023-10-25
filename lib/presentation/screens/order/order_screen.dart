import 'package:flutter/material.dart';

import '../../../data/constants/images.dart';
import '../../components/alert_dialog.dart';
import '../../components/orange_button.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: DefaultOrangeButton(
        text: 'Back To Home',
        onPressed: () {
          ShowDialog.get(
            context: context,
            image: orderErrorImage,
            height: 200,
            buttonText: 'Back To Home',
            primaryText: 'Your Order has been accepted',
            secondaryText:
                'Your items has been placcd and is on it\'s way to being processed',
            onPressed: () {},
          );
          ShowDialog.get(
            context: context,
            image: orderSuccessImage,
            buttonText: 'Back To Home',
            primaryText: 'Oops! Order Failed',
            secondaryText: 'Something went tembly wrong.',
            onPressed: () {},
          );
        },
      ),
      body: Image.asset(orderSuccessImage),
    );
  }
}
