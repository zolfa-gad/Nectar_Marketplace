// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/colors.dart';
import '../../../components/icon_button.dart';
import '../../../components/text_widget.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';
import 'edit_name_field.dart';

class UserNameAndEmail extends StatelessWidget {
  const UserNameAndEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return Expanded(
          child: ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AccountCubit.get(context).isEditingName
                    ? const EditAccountName()
                    : DefaultText(
                        text: AccountCubit.get(context).usernameController.text,
                        size: 20,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                const SizedBox(width: 10),
                DefaultIconButton(
                  // padding: const EdgeInsets.symmetric(horizontal: 7),
                  icon: AccountCubit.get(context).editIcon,
                  size: AccountCubit.get(context).editIconSize,
                  color: greenColor,
                  onPressed: () {
                    AccountCubit.get(context).editAccountName();
                  },
                ),
              ],
            ),
            subtitle: DefaultText(
              text: AccountCubit.get(context).loginModel == null
                  ? ''
                  : AccountCubit.get(context).loginModel!.userData!.email,
              size: 16,
              weight: FontWeight.w500,
              color: Colors.grey,
              align: TextAlign.left,
            ),
          ),
        );
      },
    );
  }
}
