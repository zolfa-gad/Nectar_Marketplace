import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/fields.dart';
import '../../../components/icon_button.dart';
import '../../../components/input_field.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LogFormField extends StatelessWidget {
  const LogFormField({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInCubit, LogInState>(
      builder: (context, state) {
        LogInCubit cubit = LogInCubit.get(context);
        return Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 15,
              ),
              InputField(
                controller: emailController,
                label: emailField['label']!,
                hint: emailField['hint']!,
                inputType: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Please enter email address';
                  } else {
                    if (cubit.loginModel != null && state is LogInSuccesState) {
                      if (!cubit.loginModel!.status) {
                        if (cubit.loginModel!.message!.contains(
                          'email',
                        )) {
                          return cubit.loginModel!.message;
                        }
                      }
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              // password
              InputField(
                controller: passwordController,
                label: passwordField['label']!,
                hint: passwordField['hint']!,
                inputType: TextInputType.visiblePassword,
                isObscure: cubit.isObscure,
                suffixIcon: DefaultIconButton(
                  icon: cubit.visibilityIcon,
                  color: Colors.grey,
                  onPressed: () {
                    cubit.changeVisibilityIcon();
                  },
                ),
                validator: (password) {
                  if (password!.isEmpty) {
                    return 'Please enter password';
                  } else {
                    if (cubit.loginModel != null && state is LogInSuccesState) {
                      if (cubit.loginModel!.status) {
                        if (!cubit.loginModel!.message!.contains(
                          'password',
                        )) {
                          return cubit.loginModel!.message;
                        }
                      }
                    }
                  }
                  return null;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
