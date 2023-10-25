import 'package:flutter/material.dart';

import '../../../../data/constants/buttons.dart';
import '../../../components/orange_button.dart';
import '../../number/number_screen.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.userNameController,
    required this.passwordController,
    required this.phoneController,
    // required this.phoneFormKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  // final GlobalKey<FormState> phoneFormKey;
  final TextEditingController emailController;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return DefaultOrangeButton(
      text: signUpButton,
      onPressed: () {
        formKey.currentState!.validate();

        if (userNameController.text.isNotEmpty &&
            emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NumberVerfyScreen(
                emailController: emailController,
                userNameController: userNameController,
                passwordController: passwordController,
                phoneController: phoneController,
              ),
            ),
          );
        }
        // if (formKey.currentState!.validate()) {

        // RegisterCubit.get(context).userRegister(
        //   name: userNameController.text,
        //   email: emailController.text,
        //   password: passwordController.text,
        //   // phone: phoneController.text,
        // );

        // cubit.snackBar(context, cubit.resultMessage);
        // Navigator.pushReplacementNamed(context, homeScreen);
        // }

        // String resultText = '';
        // if (formKey.currentState!.validate()) {
        //   resultText = 'You have sign up succesfully.';
        //   Navigator.pushNamed(context, homeScreen);
        // } else {
        //   resultText = 'Please verify the data entered.';
        // }
        // cubit.snackBar(context, resultText);
      },
    );
  }
}
