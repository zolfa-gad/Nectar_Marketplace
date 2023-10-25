// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressDataModel {
  late int id;
  late String name;
  late String city;
  late String region;
  late String details;
  late String notes;
  late double latitude;
  late double longitude;

  AddressDataModel({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.latitude,
    required this.longitude,
  });

  AddressDataModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    city = map['city'];
    region = map['region'];
    details = map['details'];
    notes = map['notes'];
    latitude = map['latitude'];
    longitude = map['longitude'];
  }

  //  "id": 2769,
  //               "name": "home",
  //               "city": "cairo",
  //               "region": "nasr city",
  //               "details": "zaker hussein street",
  //               "notes": "notes",
  //               "latitude": 30.061686300000001637044988456182181835174560546875,
  //               "longitude": 31.326008800000000320551407639868557453155517578125
}
