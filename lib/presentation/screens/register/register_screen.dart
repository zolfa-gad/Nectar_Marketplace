// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/colors.dart';
import '../../components/colored_box.dart';
import '../../components/mixed_text.dart';
import 'components/already_have_account.dart';
import 'components/app_bar_register.dart';
import 'components/form_field_sign_up.dart';
import 'components/button_sign_up.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_state.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final List policyText = const [
    ['By continuing you agree to our ', false],
    ['Terms of Service\n', true],
    ['and ', false],
    ['Privacy Policy', true],
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        // listener: (context, state) {
        // if (AppLocalServices.getLocalData('token') != null) {
        //   Navigator.pushNamed(context, numberScreen);
        //   // Navigator.pushReplacementNamed(context, locationScreen);
        // }

        // if (state is RegisterSuccesState) {
        //   if (state.registerModel.status) {
        //     ShowToast.get(
        //       msg: state.registerModel.message!,
        //     );
        //   } else {
        //     ShowToast.get(
        //       msg: state.registerModel.message!,
        //     );
        //   }
        // }
        // },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: DefaultColoredBox(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const RegisterAppBar(),
                    SignFormField(
                      formKey: _formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      userNameController: userNameController,
                      phoneController: phoneController,
                    ),
                    MixedText(
                      stringsText: policyText,
                      differentColor: orangeColor,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    SignUpButton(
                      formKey: _formKey,
                      userNameController: userNameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      phoneController: phoneController,
                    ),
                    const SizedBox(height: 15),
                    const AlreadyHaveAccount(),
                    const SizedBox(height: 100),
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

            // SingleChildScrollView(
                //   physics: const NeverScrollableScrollPhysics(),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 25,
                //       // vertical: 25,
                //     ),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         // username
                //         InputFormField(formKey: _formKey),
                //         const SizedBox(
                //           height: 20,
                //         ),
                //         type == 'in'
                //             ? const Align(
                //                 alignment: Alignment.centerRight,
                //                 child: CustomText(
                //                   text: 'Forgot Password?',
                //                   size: 14,
                //                   weight: FontWeight.w500,
                //                   color: Colors.black,
                //                 ),
                //               )
                //             : Align(
                //                 alignment: Alignment.centerLeft,
                //                 child: RichText(
                //                   text: TextSpan(
                //                     style: const TextStyle(
                //                       fontSize: 14,
                //                       color: Colors.black,
                //                     ),
                //                     children: [
                //                       const TextSpan(
                //                         text: 'By continuing you agree to our ',
                //                       ),
                //                       TextSpan(
                //                         text: 'Terms of Service\n',
                //                         style: TextStyle(
                //                           color: bloc.greenColor,
                //                         ),
                //                       ),
                //                       const TextSpan(text: 'and '),
                //                       TextSpan(
                //                         text: 'Privacy Policy',
                //                         style: TextStyle(
                //                           color: bloc.greenColor,
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //         const SizedBox(
                //           height: 30,
                //         ),
                //         // button
                //         GreenBtn(
                //           text: type == 'in' ? 'Log in' : 'Sign Up',
                //           onPressed: () {
                //             String resultText = '';
                //             if (_formKey.currentState!.validate()) {
                //               resultText = '';
                //               if (type == 'up') {
                //                 resultText = 'You have sign up succesfully.';
                //               } else if (type == 'in') {
                //                 resultText = 'You have log in succesfully.';
                //               }
                //               Navigator.pushNamed(context, '/home');
                //             } else {
                //               resultText = 'Please verify the data entered.';
                //             }
                //             bloc.snackBar(context, resultText);
                //             // ScaffoldMessenger.of(context).showSnackBar(
                //             //   SnackBar(
                //             //     content: Text(resultText),
                //             //     backgroundColor: Colors.black87,
                //             //     duration: const Duration(seconds: 7),
                //             //     dismissDirection: DismissDirection.horizontal,
                //             //     padding: const EdgeInsets.symmetric(
                //             //       vertical: 10,
                //             //       horizontal: 20,
                //             //     ),
                //             //     behavior: SnackBarBehavior.floating,
                //             //     action: SnackBarAction(
                //             //       label: 'Ok',
                //             //       onPressed: () {},
                //             //     ),
                //             //   ),
                //             // );
                //           },
                //         ),
                //         const SizedBox(
                //           height: 15,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             CustomText(
                //               text: type == 'in'
                //                   ? 'Don\'t have an account? '
                //                   : 'Already have an account? ',
                //               size: 14,
                //               weight: FontWeight.w600,
                //               color: Colors.black,
                //             ),
                //             InkWell(
                //               onTap: () {
                //                 bloc.emailControll = TextEditingController();
                //                 bloc.passWordControll = TextEditingController();
                //                 bloc.userNameControll = TextEditingController();
                //                 type == 'in'
                //                     ? Navigator.of(context)
                //                         .pushReplacementNamed('/signUp')
                //                     : Navigator.of(context)
                //                         .pushReplacementNamed('/logIn');
                //               },
                //               child: CustomText(
                //                 text: type == 'in' ? 'Sign up' : 'Log in',
                //                 size: 14,
                //                 weight: FontWeight.w600,
                //                 color: bloc.greenColor,
                //               ),
                //             ),
                //           ],
                //         ),
                //         const SizedBox(
                //           height: 15,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
