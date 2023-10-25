// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables

class ProductModel {
  late int id;
  late String price;
  late String oldPrice;
  late int? discount;
  late String image;
  late String name;
  late String description;
  late List productImages;
  late bool isFavourite;
  late bool inCart;
  late int itemCount;
  late int review;

  // ProductModel({
  //   required this.id,
  //   required this.price,
  //   required this.oldPrice,
  //   required this.discount,
  //   required this.image,
  //   required this.name,
  //   required this.description,
  //   required this.productImages,
  //   required this.isFavourite,
  //   required this.inCart,
  //   this.itemCount = 0,
  //   this.qunatity = 1,
  // });

  ProductModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    price = map['price'].toString();
    oldPrice = map['old_price'].toString();
    discount = map['discount'];
    image = map['image'];
    name = map['name'];
    description = map['description'];
    // for (var element in map['images']) {
    //   productImages.add(element.toString());
    //   debugPrint(element);
    // }
    productImages = map['images'];
    isFavourite = map['in_favorites'];
    inCart = map['in_cart'];
    itemCount = 1;
    review = -1;
  }
}


// class ProductItem {
//   final String name;
//   final double price;
//   int itemCount = 1;
//   final String quantity;
//   final String image;
//   final String type;
//   bool isFav;
//   bool isInCart;

//   ProductItem({
//     required this.name,
//     required this.image,
//     required this.quantity,
//     required this.price,
//     required this.type,
//     // required this.itemCount,

//     this.isFav = false,
//     this.isInCart = false,
//   });

//   increasCounter() {
//     itemCount++;
//   }

//   decreasCounter() {
//     itemCount--;
//   }
// }
