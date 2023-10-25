// ignore_for_file: unnecessary_null_comparison

class RegisterModel {
  late bool status;
  late String? message;
  late RegisterUserDataModel? userData;

  RegisterModel({
    required this.status,
    required this.message,
    required this.userData,
  });

  RegisterModel.fromJson(Map<String, dynamic> map) {
    status = map['status'];
    message = map['message'];
    userData = map['data'] != null
        ? RegisterUserDataModel.fromJson(map['data'])
        : null;
    // userData  = UserDataModel.fromJson(map['data']);
    // data != null ? data = UserDataModel.fromJson(map['data']) : null;
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

class RegisterUserDataModel {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;

  RegisterUserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });
  RegisterUserDataModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    image = map['image'];
    token = map['token'];
  }
  // UserDataModel.formJson

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userID': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'tokenAuth': token,
    };
  }

  // String toJson() => json.encode(toMap());

  // factory UserDataModel.fromJson(String source) => UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
