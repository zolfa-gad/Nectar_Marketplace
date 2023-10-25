import '../models/register_model.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterSuccesState extends RegisterState {
  final RegisterModel registerModel;

  RegisterSuccesState(this.registerModel);
}

class RegisterErrorState extends RegisterState {}

class RegisterProfileSuccesState extends RegisterState {}

class RegisterProfileNotFoundState extends RegisterState {}

class RegisterChangeVisibilityState extends RegisterState {}

class RegisterCountryCodeChangeState extends RegisterState {}
