// ignore_for_file: unnecessary_null_comparison

class LogInModel {
  late bool status;
  late String? message;
  late LoginUserDataModel? userData;

  LogInModel({
    required this.status,
    required this.message,
    required this.userData,
  });

  LogInModel.fromJson(Map<String, dynamic> map) {
    status = map['status'];
    message = map['message'];
    userData =
        map['data'] != null ? LoginUserDataModel.fromJson(map['data']) : null;
    // userData  = LoginUserDataModel.fromJson(map['data']);
    // data != null ? data = LoginUserDataModel.fromJson(map['data']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'status': status,
  //     'message': message,
  //     'data': data.toJson(),
  //   };
  // }

  // String toJson() => json.encode(toJson());

  // factory LogInModel.fromJson(String source) => LogInModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class LoginUserDataModel {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String points;
  late String credit;
  late String token;

  LoginUserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });
  LoginUserDataModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = toCapital(map['name']);
    email = map['email'];
    phone = map['phone'];
    image = map['image'];
    points = map['points'].toString();
    credit = map['credit'].toString();
    token = map['token'];
  }
  // LoginUserDataModel.formJson

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'userID': id,
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'image': image,
  //     'points': points,
  //     'credit': credit,
  //     'tokenAuth': token,
  //   };
  // }

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

  // String toJson() => json.encode(toMap());

  // factory LoginUserDataModel.fromJson(String source) => UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
