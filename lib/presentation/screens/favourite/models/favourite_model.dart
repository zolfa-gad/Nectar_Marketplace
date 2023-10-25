
class FavouriteModel {
  late int id;

  late int productId;
  late String price;
  late int discount;
  late String image;
  late String name;
  // late bool isFavourite;
  // late bool inCart;

  FavouriteModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];

    productId = map['product']['id'];
    price = map['product']['price'].toString();
    discount = map['product']['discount'];
    image = map['product']['image'];
    name = map['product']['name'];
  }
}
