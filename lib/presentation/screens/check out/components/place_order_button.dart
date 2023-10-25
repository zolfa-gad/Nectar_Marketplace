import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/buttons.dart';
import '../../../../data/constants/images.dart';
import '../../../components/alert_dialog.dart';
import '../../../components/orange_button.dart';
import '../../cart/cubit/carts_cubit.dart';
import '../../cart/cubit/carts_state.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/cubit/home_state.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartsCubit, CartsState>(
      listener: (context, state) {
        // if (state is PlaceOrderSuccessState) {
        //   // Navigator.pop(context);
        //   CartsCubit.get(context).getMyCartsList();

        //   ShowDialog.get(
        //     context: context,
        //     image: orderSuccessImage,
        //     height: 200,
        //     buttonText: 'Ok',
        //     primaryText: 'Your Order has been accepted',
        //     secondaryText:
        //         'Your items has been placcd and is on it\'s way to being processed',
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //       // CartsCubit.get(context).getMyCartsList();

        //       // HomeCubit.get(context).changeNavigateScreenIndex(indx: 0);
        //       // Navigator.pop(context);
        //       // // CartsCubit.get(context).getMyCartsList();
        //       // Navigator.pop;
        //       // Navigator.pop(context);
        //     },
        //   );
        // } else if (state is PlaceOrderErrorState) {
        //   // Navigator.pop(context);

        //   ShowDialog.get(
        //     context: context,
        //     image: orderErrorImage,
        //     buttonText: 'Close',
        //     primaryText: 'Oops! Order Failed',
        //     secondaryText: 'Something went tembly wrong.',
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //       // Navigator.pop;

        //       // Navigator.pop(context);
        //       // Navigator.pop(context);
        //     },
        // );
        // }
      },
      builder: (context, state) {
        return Center(
          child: state is PlaceOrderLoadingState
              ? const Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                )
              : DefaultOrangeButton(
                  text: placeOrderButton,
                  padding: const EdgeInsets.only(top: 5),
                  onPressed: onPressed,
                  // onPressed: () {
                  //   //add order
                  //   CartsCubit.get(context).placeNewOrder();
                  //   // HomeCubit.get(context).getHomeImages();
                  //   // CartsCubit.get(context).getMyCartsList();
                  //   // Navigator.pop(context);

                  //   // if the user choose visa will go to add car screen
                  // },
                ),
        );
      },
    );
  }
}
