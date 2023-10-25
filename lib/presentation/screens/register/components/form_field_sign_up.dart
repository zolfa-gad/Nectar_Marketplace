import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/fields.dart';
import '../../../components/icon_button.dart';
import '../../../components/input_field.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class SignFormField extends StatelessWidget {
  const SignFormField({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.userNameController,
    required this.phoneController,
    // required this.phoneFormKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  // final GlobalKey<FormState> phoneFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController userNameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 15,
              ),
              InputField(
                controller: userNameController,
                label: userNameField['label']!,
                hint: userNameField['hint']!,
                inputType: TextInputType.name,
                validator: (userName) {
                  if (userName!.isEmpty) {
                    return userNameField['error'];
                  } else {
                    if (cubit.registerModel != null &&
                        state is RegisterSuccesState) {
                      if (!cubit.registerModel!.status) {
                        if (cubit.registerModel!.message!.contains(
                          'name',
                        )) {
                          return cubit.registerModel!.message;
                        }
                      }
                    }
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              // email
              InputField(
                controller: emailController,
                label: emailField['label']!,
                hint: emailField['hint']!,
                inputType: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty) {
                    return emailField['error'];
                  } else {
                    if (cubit.registerModel != null &&
                        state is RegisterSuccesState) {
                      if (!cubit.registerModel!.status) {
                        if (cubit.registerModel!.message!.contains(
                          'email',
                        )) {
                          return cubit.registerModel!.message;
                        }
                      }
                    }
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              //phone
              // PhoneNumberField(
              //   // formKey: phoneFormKey,
              //   controller: phoneController,
              //   label: phoneField['label']!,
              //   hint: phoneField['hint']!,
              //   onCountryChanged: (country) {
              //     debugPrint('Country Change: $country');
              //     cubit.onCountryCodeChange(country.dialCode);
              //   },
              //   validator: (phone) {
              //     debugPrint('valiate: ${phone!.completeNumber}');
              //     if (phone.number.isEmpty) {
              //       return phoneField['error'];
              //     } else {
              //       if (cubit.registerModel != null &&
              //           state is RegisterSuccesState) {
              //         if (!cubit.registerModel!.status) {
              //           if (cubit.registerModel!.message!.contains('phone')) {
              //             return cubit.registerModel!.message;
              //           }
              //         }
              //       }
              //       return null;
              //     }
              //   },
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
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
                    return passwordField['error'];
                  } else {
                    if (cubit.registerModel != null &&
                        state is RegisterSuccesState) {
                      if (!cubit.registerModel!.status) {
                        if (cubit.registerModel!.message!
                            .contains('password')) {
                          return cubit.registerModel!.message;
                        }
                      }
                    }
                    return null;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
