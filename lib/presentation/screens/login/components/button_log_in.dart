import 'package:flutter/material.dart';

import '../../../../data/constants/buttons.dart';
import '../../../components/orange_button.dart';
import '../cubit/login_cubit.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
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
    return DefaultOrangeButton(
      text: logInButton,
      onPressed: () {
        // if (formKey.currentState!.validate()) {
        LogInCubit.get(context).userLogIn(
          email: emailController.text,
          password: passwordController.text,
          // context: context,
        );
        formKey.currentState!.validate();

        debugPrint('button');
        // if (LogInCubit.get(context).loginModel != null) {
        //   if (LogInCubit.get(context).loginModel!.status) {
        //     if (LogInCubit.get(context).addressModel == null) {
        //       Navigator.pushReplacementNamed(context, locationScreen);
        //     }
        //     Navigator.pushReplacementNamed(context, homeScreen);
        //   }
        // }
        // }
        // String resultText = '';
        // if (formKey.currentState!.validate()) {
        //   resultText = 'You have log in succesfully.';
        //   Navigator.pushNamed(context, homeScreen);
        // } else {
        //   resultText = 'Please verify the data entered.';
        // }
        // cubit.snackBar(context, resultText);
      },
    );
  }
}
