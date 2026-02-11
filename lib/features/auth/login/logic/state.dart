class LoginStates{}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String userName;
  final String token;
  LoginSuccessState({
    required  this.token,
    required  this.userName,
  });
}

class LoginErrorState extends LoginStates{
  final String errorMassage;

  LoginErrorState({required this.errorMassage});
}

