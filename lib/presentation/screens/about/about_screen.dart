import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/titles.dart';
import '../../components/app_bar_default.dart';
import '../../components/icon_button.dart';
import 'components/about_info.dart';
import 'cubit/about_cubit.dart';
import 'cubit/about_state.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCubit()..getAboutInfo(),
      child: BlocBuilder<AboutCubit, AboutState>(
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
                child: state is AboutLoadingState
                    ? const CircularProgressIndicator()
                    : const AboutInfoItem()
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
