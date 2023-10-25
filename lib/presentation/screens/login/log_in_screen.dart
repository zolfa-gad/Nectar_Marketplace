// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/prefs.dart';
import '../../../data/constants/screens.dart';
import '../../../data/services/local_sevices.dart';
import '../../components/colored_box.dart';
import '../../components/show_toast.dart';
import '../location/cubit/location_cubit.dart';
import 'components/app_bar_login.dart';
import 'components/forget_password_text.dart';
import 'components/form_field_log_in.dart';
import 'components/button_log_in.dart';
import 'components/not_have_account.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({
    Key? key,
    // required this.screenType,
  }) : super(key: key);

  // final String screenType;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogInCubit(),
        ),
        BlocProvider(
          create: (context) => LocationCubit(),
        ),
      ],
      child: BlocConsumer<LogInCubit, LogInState>(
        listener: (context, state) {
          if (AppLocalServices.getLocalData(tokenPrefs) != null) {
            debugPrint('statement: Log In Listener');
            if (state is LogInSuccesState) {
              LogInCubit.get(context).getAddress();
            }

            if (state is LogInAddressSuccessState) {
              debugPrint('statement: when going to home screen');

              if (LogInCubit.get(context).addressModel == null) {
                Navigator.pushReplacementNamed(context, locationScreen);
              } else {
                Navigator.pushReplacementNamed(context, homeScreen);
              }
            }
          }

          if (state is LogInSuccesState) {
            if (state.loginModel.status) {
              ShowToast.get(
                msg: state.loginModel.message!,
              );
            } else {
              ShowToast.get(
                msg: state.loginModel.message!,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: DefaultColoredBox(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const LogInAppBar(),
                    LogFormField(
                      formKey: _formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    const ForgetPasswordText(),
                    LogInButton(
                      formKey: _formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const NotHaveAccount(),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

                // child: NestedScrollView(
                //   // floatHeaderSlivers: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   headerSliverBuilder: (context, _) {
                //     return [
                //       const LogInAppBar(),
                //     ];
                //   },
                //                   ),

  