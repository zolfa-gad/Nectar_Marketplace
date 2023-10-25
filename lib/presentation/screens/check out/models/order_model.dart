class OrderModel {
  late int id;
  late String payMethod;
  late String cost;
  late String vat;
  late String discount;
  late int points;
  late String total;

  OrderModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    payMethod = map['payment_method'];
    cost = map['cost'];
    vat = map['vat'];
    discount = map['discount'];
    points = map['points'];
    total = map['total'];
  }
}

