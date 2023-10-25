class CityModel {
  late String id;
  late String name;
  late String countryID;

  CityModel({
    required this.id,
    required this.name,
    required this.countryID,
  });

  CityModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    countryID = map['country_id'];
  }
}
