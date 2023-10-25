// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../data/models/product_model.dart';

class CartsModel {
  // late bool status;
  late int id;
  late int quantity;
  late ProductModel product;
  CartsModel({
    required this.id,
    // required this.status,
    required this.quantity,
    required this.product,
  });

  CartsModel.fromJson(Map<String, dynamic> map) {
    // status = map['status'];
    id = map['id'];
    quantity = map['quantity'];
    product = ProductModel.fromJson(map['product']);
  }
}



// class ProductCartsModel {
//   late int id;
//   late int quantity;
//   late ProductModel product;
//   ProductCartsModel({
//     required this.id,
//     required this.quantity,
//     required this.product,
//   });
//   ProductCartsModel.fromJson(Map<String, dynamic> map) {
//     id = map['id'];
//     quantity = map['quantity'];
//     product = ProductModel.fromJson(map['product']);
//   }
// }



