import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/titles.dart';
import '../../components/app_bar_default.dart';
import '../../components/icon_button.dart';
import 'components/help_list.dart';
import 'cubit/help_cubit.dart';
import 'cubit/help_state.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelpCubit()..getHelpInfo(),
      child: BlocBuilder<HelpCubit, HelpState>(
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size(
                double.infinity,
                appBarHeight,
              ),
              child: SafeArea(
                child: DefaultAppBar(
                  titleText: helpBarTitle,
                  leadingIcon: DefaultIconButton(
                    icon: Icons.arrow_back_ios_new,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ),
            body: Center(
                child: state is HelpLoadingState
                    ? const CircularProgressIndicator()
                    : const HelpInfoList()
                // : Container(
                //     width: 100,
                //     height: 100,
                //     color: Colors.amber,
                //   ),
                ),
          );
        },
      ),
    );
  }
}
