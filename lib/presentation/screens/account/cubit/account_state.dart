import '../../login/models/login_model.dart';

abstract class AccountState {}

class AccountInitialState extends AccountState {}

class GetAccountDataErrorState extends AccountState {}

class GetAccountDataLoadingState extends AccountState {}

class GetAccountDataSuccesState extends AccountState {
  LogInModel loginModel;
  GetAccountDataSuccesState(
    this.loginModel,
  );
}

class AccountNameChangeState extends AccountState {}

class AccountNameEditState extends AccountState {}

class AccountUpdateDataLoadingState extends AccountState {}

class AccountUpdateDataSuccessState extends AccountState {}

class AccountUpdateDataErrorState extends AccountState {}

class AccountUpdateDataState extends AccountState {}
