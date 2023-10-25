

class CategoryDataModel {
  late int id;
  late String name;
  late String image;

  CategoryDataModel({
    required this.id,
    required this.name,
    required this.image,
  });

  CategoryDataModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = toCapital(map['name']);
    image = map['image'];
  }

  toCapital(String str) {
    str = str
        .replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.isNotEmpty
            ? '${str[0].toUpperCase()}${str.substring(1).toLowerCase()}'
            : '')
        .join(' ');
    return str;
  }
// Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'image': image,
  //   };
  // }
  // String toJson() => json.encode(toMap());

  // factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
