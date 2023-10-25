class CountryModel {
  late String id;
  late String sortName;
  late String name;
  // String phoneCode;

  CountryModel({
    required this.id,
    required this.sortName,
    required this.name,
    // required this.phoneCode,
  });

  CountryModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    sortName = map['sortname'];
    name = map['name'];
    // phoneCode= map['phonecode'] ;
  }
}
