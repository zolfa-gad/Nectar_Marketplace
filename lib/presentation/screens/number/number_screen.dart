import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/fields.dart';
import '../../../data/constants/prefs.dart';
import '../../../data/constants/screens.dart';
import '../../../data/services/local_sevices.dart';
import '../../components/colored_box.dart';
import '../../components/show_toast.dart';
import '../register/cubit/register_cubit.dart';
import '../register/cubit/register_state.dart';
import 'components/app_bar_number.dart';
import 'components/phone_field.dart';

class NumberVerfyScreen extends StatelessWidget {
  const NumberVerfyScreen({
    Key? key,
    required this.emailController,
    required this.userNameController,
    required this.passwordController,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (AppLocalServices.getLocalData(tokenPrefs) != null) {
            Navigator.pushReplacementNamed(context, locationScreen);
          }

          if (state is RegisterSuccesState) {
            if (state.registerModel.status) {
              ShowToast.get(
                msg: state.registerModel.message!,
              );
            } else {
              ShowToast.get(
                msg: state.registerModel.message!,
              );
            }
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              onPressed: () {
                if (phoneController.text.isNotEmpty) {
                  RegisterCubit.get(context).userRegister(
                    name: userNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    phone: phoneController.text,
                  );
                } else {
                  RegisterCubit.get(context).userRegister(
                    name: userNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    phone: '',
                  );
                }
              },
            ),
            body: SafeArea(
              child: DefaultColoredBox(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  shrinkWrap: true,
                  children: [
                    NumberAppBar(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PhoneNumberField(
                      controller: phoneController,
                      label: phoneField['label']!,
                      hint: phoneField['hint']!,
                      onCountryChanged: (country) {
                        cubit.onCountryCodeChange(country.dialCode);
                      },
                      validator: (phone) {
                        if (phone!.number.isEmpty) {
                          return phoneField['error'];
                        }
                        //  else {
                        //   if (cubit.registerModel != null &&
                        //       state is RegisterSuccesState) {
                        //     if (!cubit.registerModel!.status) {
                        //       if (cubit.registerModel!.message!
                        //           .contains('phone')) {
                        //         return cubit.registerModel!.message;
                        //       }
                        //     }
                        //   }
                        // }

                        return null;
                      },
                    ),
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
