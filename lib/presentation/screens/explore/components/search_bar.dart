import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/constants/fonts.dart';
import '../../../../data/constants/icons.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.autofocus = false,
    this.onEditingComplete,
    this.suffixIcon,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final bool autofocus;
  final Widget? suffixIcon;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 60,
      // height: 100, //57
      // alignment: Alignment.center,
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 10,
      //   // vertical: 10,
      // ),
      padding: padding,
      // margin: padding,
      // decoration: BoxDecoration(
      //   color: Colors.grey[200],
      //   borderRadius: BorderRadius.circular(12),
      // ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
        autofocus: autofocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        cursorWidth: 2,
        textAlign: TextAlign.left,
        enableInteractiveSelection: false,
        textCapitalization: TextCapitalization.words,
        textAlignVertical: TextAlignVertical.bottom,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          cut: true,
          paste: true,
          selectAll: true,
        ),
        // strutStyle: const StrutStyle(
        //   // height: 1.3,
        //   height: 1.8,
        //   fontSize: 16,
        // ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Search Store',
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black38,
            fontFamily: robotoFont,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
              width: 2,
            ),
          ),
          // enabledBorder: InputBorder.none,
          // focusedBorder: InputBorder.none,
          // prefixIcon: Icon(
          //   Icons.search,
          //   color: Colors.black,
          //   size: 30,
          // ),
          prefixIcon: SvgPicture.asset(
            searchSvgIcon,
            fit: BoxFit.scaleDown,
            color: Colors.black,
            height: 20,
          ),
          suffix: suffixIcon,
        ),
      ),
    );
  }
}
