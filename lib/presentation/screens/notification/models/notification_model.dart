class NotifyModel {
  late int id;
  late String title;
  late String message;

  NotifyModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    message = map['message'];
  }
}
