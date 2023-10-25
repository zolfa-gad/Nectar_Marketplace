class RegionModel {
  late String id;
  late String name;
  late String cityID;

  RegionModel({
    required this.id,
    required this.name,
    required this.cityID,
  });

  RegionModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    cityID = map['city_id'];
  }
}
