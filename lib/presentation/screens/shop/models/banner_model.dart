// ignore_for_file: public_member_api_docs, sort_constructors_first
class BannerModel {
  late int id;
  late String image;
  // late String? category;
  // late String? product;

  BannerModel({
    required this.id,
    required this.image,
    // this.category,
    // this.product,
  });

  BannerModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    image = map['image'];
    // category = map['category'];
    // product = map['product'];
  }
  // "id": 19,
  //           "image": "https://student.valuxapps.com/storage/uploads/banners/1626545208UfigP.golden-coin-money-cashback-promotion-ecommerce-poster-banner-template-blue-background-216757528.jpg",
  //           "category": null,
  //           "product": null
}
