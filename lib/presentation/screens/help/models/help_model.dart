class HelpModel {
  late int id;
  late String question;
  late String answer;

  HelpModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    question = map['question'];
    answer = map['answer'];
  }
}
