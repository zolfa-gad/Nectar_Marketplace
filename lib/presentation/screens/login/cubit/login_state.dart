import '../models/login_model.dart';

abstract class LogInState {}

class LogInInitialState extends LogInState {}

class LogInSuccesState extends LogInState {
  final LogInModel loginModel;

  LogInSuccesState(this.loginModel);
}

class LogInErrorState extends LogInState {}

class LogInProfileSuccesState extends LogInState {}

class LogInProfileNotFoundState extends LogInState {}

class LogInChangeVisibilityState extends LogInState {}

class LogInAddressLoadingState extends LogInState {}

class LogInAddressSuccessState extends LogInState {}

class LogInAddressErrorState extends LogInState {}
