import 'package:flutter/material.dart';

import '../cubit/account_cubit.dart';
import 'info_item.dart';


class AccountInfoList extends StatelessWidget {
  const AccountInfoList({Key? key}) : super(key: key);

  // final Map<String, IconData> _accountInfoList = {
  //   'Orders': Icons.shopping_bag_outlined,
  //   'My Details': Icons.badge_outlined,
  //   'Delivery Address': Icons.location_on_outlined,
  //   'Payment Methods': Icons.payment,
  //   'Promo Card': Icons.ac_unit,
  //   'Notifecations': Icons.notifications_none,
  //   'Help': Icons.help_outline,
  //   'About': Icons.info_outline,
  // };

  // final Map<String, String> _accountInfoList = {
  //   'Orders': ordersSvgIcon,
  //   'My Details': detailsSvgIcon,
  //   'Delivery Address': deliveryAddSvgIcon,
  //   'Payment Methods': paymentSvgIcon,
  //   'Promo Card': promoCardSvgIcon,
  //   'Notifications': notificationSvgIcon,
  //   'Help': helpSvgIcon,
  //   'About': aboutSvgIcon,
  // };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            itemCount: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InfoListItem(
                infoItem: AccountCubit.get(context).accountInfoList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black12,
                thickness: 1.5,
                endIndent: 20,
                indent: 20,
                height: 3,
              );
            },
          ),
          const Divider(
            color: Colors.black12,
            thickness: 1.5,
            endIndent: 20,
            indent: 20,
            height: 3,
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
