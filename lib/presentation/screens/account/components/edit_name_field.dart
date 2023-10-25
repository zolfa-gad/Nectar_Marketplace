import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class EditAccountName extends StatelessWidget {
  const EditAccountName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return SizedBox(
          // height: 35,
          height: 50,
          width: MediaQuery.of(context).size.width - 190,
          // width: AccountCubit.get(context).nameFieldWidth(),
          child: TextField(
            controller: AccountCubit.get(context).usernameController,
            // readOnly: AccountCubit.get(context).readOnly,
            // readOnly: false,
            autofocus: true,
            clipBehavior: Clip.antiAlias,
            maxLines: 1,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            // onEditingComplete: () {
            //   AccountCubit.get(context).changeAccountName();
            // },
            onSubmitted: (value) {
              AccountCubit.get(context).editAccountName();
            },
          ),
        );
      },
    );
  }
}
