import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/titles.dart';
import '../../components/show_toast.dart';
import 'components/app_bar_account.dart';
import 'components/info_list.dart';
import 'components/log_out_button.dart';
import 'cubit/account_cubit.dart';
import 'cubit/account_state.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountState>(
      listener: (context, state) {
        if (state is AccountUpdateDataState) {
          AccountCubit.get(context).updateProfileData();
        }
        if (state is AccountUpdateDataSuccessState) {
          ShowToast.get(
            msg: AccountCubit.get(context).loginModel!.message!,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,

          floatingActionButton: !AccountCubit.get(context).isEditingName
              ? const LogOutButton()
              : null,
          appBar: const PreferredSize(
            preferredSize: Size(
              double.infinity,
              appBarHeight * 1.5,
            ), //125
            child: AccountScreenAppBar(),
          ),
          body: const AccountInfoList(),
          // body: SingleChildScrollView(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       AccountInfoList(),
          //       const Divider(
          //         color: Colors.black12,
          //         thickness: 1.5,
          //         endIndent: 20,
          //         indent: 20,
          //         height: 3,
          //       ),
          //       const SizedBox(height: 80),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}

  // ..._accountInfoList.entries.map(
            //   (item) {
            //     return Column(
            //       children: [
            //         ListTile(
            //           title: CustomText(
            //             text: item.key,
            //             size: 18,
            //             weight: FontWeight.w600,
            //             color: Colors.black,
            //             align: TextAlign.left,
            //           ),
            //           leading: Icon(
            //             item.value,
            //             color: Colors.black,
            //           ),
            //           trailing: IconBtn(
            //             icon: Icons.arrow_forward_ios,
            //             onPressed: () {},
            //             size: 20,
            //           ),
            //         ),
            //         const Divider(
            //           color: Colors.black12,
            //           thickness: 1.5,
            //           height: 10,
            //         ),
            //       ],
            //     );
            //   },
            // ),
          