// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class CheckItemModel {
  final String title;
  final String? value;
  final bool isEnabled;
  final Widget? iconWidget;
  final VoidCallback? onTap;
  final String id;

  CheckItemModel({
    required this.id,
    required this.title,
    required this.isEnabled,
    this.value,
    this.iconWidget,
    this.onTap,
  });
}
