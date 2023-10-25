// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:nectar_groceriet/presentation/components/icon_button.dart';

// import '../../../../data/constants/const.dart';
// import '../../../components/custom_text.dart';

// class InputField extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final String hint;
//   final TextInputType inputType;
//   final bool isObscure;
//   final DefaultIconButton? suffixIcon;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? Function(String?)? validator;

//   const InputField({
//     Key? key,
//     required this.controller,
//     required this.label,
//     required this.hint,
//     required this.inputType,
//     this.isObscure = false,
//     this.inputFormatters,
//     this.validator,
//     this.suffixIcon,
//   }) : super(key: key);

//   // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   // late IconData icon = Icons.visibility_off_outlined;

//   @override
//   Widget build(BuildContext context) {
//     // context.read<AppCubit>;
//     return TextFormField(
//       controller: controller,
//       inputFormatters: inputFormatters,
//       validator: validator,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       keyboardType: inputType,
//       cursorWidth: 2,
//       cursorColor: greenColor,
//       textAlign: TextAlign.left,
//       enableInteractiveSelection: false,
//       textAlignVertical: TextAlignVertical.bottom,
//       obscureText: isObscure,
//       // obscureText: label == bloc.passLabel ? bloc.isObscurePass : false,
//       strutStyle: const StrutStyle(
//         height: 2,
//         fontSize: 16,
//       ),
//       decoration: InputDecoration(
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         label: CustomText(
//           text: label,
//           size: 20,
//           weight: FontWeight.w600,
//           color: Colors.black54,
//         ),
//         hintText: hint,
//         hintStyle: const TextStyle(
//           color: Colors.black26,
//         ),
//         floatingLabelStyle: const TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//           color: Colors.black54,
//         ),
//         enabledBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.black12,
//           ),
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: greenColor,
//           ),
//         ),
//         suffixIcon: suffixIcon,

//         //  label == passwordField['label']
//         //     ? BlocBuilder<RegisterCubit, RegisterState>(
//         //         builder: (context, state) {
//         //           return IconButton(
//         //             splashColor: null,
//         //             splashRadius: 0.1,
//         //             onPressed: () {
//         //               RegisterCubit.get(context).changeVisibilityIcon();
//         //               // // print('Toggle');
//         //               // bloc.togglePassIcon();
//         //               // // icon = bloc.passIcon;
//         //               // // isObscure = !isObscure;
//         //               // if (bloc.isObscurePass) {
//         //               //   bloc.isObscurePass = false;
//         //               // } else {
//         //               //   bloc.isObscurePass = true;
//         //               // }
//         //               // if (isObscure) {
//         //               //   isObscure = false;
//         //               // } else {
//         //               //   isObscure = true;
//         //               // }
//         //             },
//         //             icon: SizedBox(
//         //               height: 5,
//         //               child: Icon(
//         //                 // bloc.passIcon, //icon if password
//         //                 // Icons.visibility,
//         //                 // icon,
//         //                 RegisterCubit.get(context).VisibilityIcon,
//         //                 color: Colors.black38,
//         //                 size: 20,
//         //               ),
//         //             ),
//         //           );
//         //         },
//         //       )
//         //     : null,
//       ),
//     );
//   }
// }
//     // onFieldSubmitted: (text) {
//       //   // on button
//       //   FormState? input = _formKey.currentState;
//       //   if (input!.validate()) {
//       //     // switch (label) {
//       //     //   case 'Email':
//       //     //     bloc.emailvalidate = true;
//       //     //     break;
//       //     //   case 'Password':
//       //     //     bloc.passwordvalidate = true;
//       //     //     break;
//       //     //   case 'Username':
//       //     //     bloc.usernamevalidate = true;
//       //     //     break;
//       //     // }
//       //   } else {
//       //     // print('error');
//       //     // switch (label) {
//       //     //   case 'Email':
//       //     //     bloc.emailvalidate = false;
//       //     //     break;
//       //     //   case 'Password':
//       //     //     bloc.passwordvalidate = false;
//       //     //     break;
//       //     //   case 'Username':
//       //     //     bloc.usernamevalidate = false;
//       //     //     break;
//       //     // }
//       //   }
//       // },
//       // onTap: () {
//       //   FormState? input = _formKey.currentState;
//       //   if (input!.validate()) {}
//       // },
//       // (inputText) {
//       //   if (label == 'Email') {
//       //     String validty = bloc.checkEmailValidity(controller.text);
//       //     switch (validty) {
//       //       case 'Err':
//       //         return 'Check Your Email.';
//       //       case 'Emt':
//       //         return 'Email Can Not Be Empty.';
//       //     }
//       //     // if (!bloc.cUsernameheckEmailValidity(controller.text)) {
//       //     //   return 'Please, check your email.';
//       //     // }
//       //     // return bloc.checkEmailValidity(controller.text);
//       //   } else if (label == 'Password') {
//       //     bool isValid = bloc.checkPassValidity(controller.text);
//       //     if (!isValid) {
//       //       return 'Password Can Not be Empty or Less Than 8.';
//       //     }
//       //     // return bloc.checkPassValidity(controller.text);
//       //   } else if (label == 'Username') {
//       //     bool isValid = bloc.checkNameValidity(controller.text);
//       //     if (!isValid) {
//       //       return 'Username Can Not be Empty or Less Than 3.';
//       //     }
//       //     // return bloc.checkPassValidity(controller.text);
//       //   }
//       //   // will be send
//       //   // if (inputText!.isEmpty) {
//       //   //   return 'Email can not be empty';
//       //   // }
//       //   return null;
//       // },
