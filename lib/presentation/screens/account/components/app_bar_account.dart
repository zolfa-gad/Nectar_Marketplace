import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/titles.dart';
import '../../../components/app_bar_default.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';
import 'user_image.dart';
import 'user_name_and_email.dart';

class AccountScreenAppBar extends StatelessWidget {
  const AccountScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return SafeArea(
          child: DefaultAppBar(
            centerTitle: false,
            height: appBarHeight * 1.5,
            elevation: 2,
            titleWidget: state is GetAccountDataLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      UserImage(),
                      SizedBox(
                        width: 10,
                      ),
                      UserNameAndEmail(),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
