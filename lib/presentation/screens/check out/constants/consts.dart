import 'package:flutter/material.dart';

import '../models/check_item_model.dart';
import '../models/pay_radio_button.dart';

String paymentTitle = 'Payment';
String visaTitle = 'Add Visa';
String checkTitle = 'Check Out';

final List<CheckItemModel> checkItems = [
  CheckItemModel(
    id: 'deliver',
    title: 'Delivery',
    value: 'Select Method',
    isEnabled: false,
  ),
  CheckItemModel(
    id: 'pay',
    title: 'Payment',
    isEnabled: true,
    iconWidget: Icon(
      Icons.payment_outlined,
      size: 28,
      color: Colors.redAccent.shade700,
    ),
  ),
  CheckItemModel(
    id: 'code',
    title: 'Promo Code',
    value: 'Pick Discount',
    isEnabled: false,
  ),
  CheckItemModel(
    id: 'cost',
    title: 'Total Cost',
    // value: '$totalPrice',
    isEnabled: true,
  ),
];

final List<RadioButtonModel> payRadioBtns = [
  RadioButtonModel(
    title: 'Pay by cash',
    value: 'CASH',
    icon: Icons.attach_money,
  ),
  RadioButtonModel(
    title: 'Pay with visa',
    value: 'VISA',
    icon: Icons.credit_card,
  ),
];

List termText = const [
  ['By placing an order you agree to our\n', false],
  ['Terms ', true],
  ['And ', false],
  ['Conditions', true],
];
