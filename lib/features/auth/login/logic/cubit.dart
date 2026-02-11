import 'package:dio/dio.dart';
import 'package:docdoc/features/auth/login/logic/state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/const/api_const.dart';
import '../../register/data/auth_response.dart';
import '../data/user_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  Dio dio = Dio();

  Future login (UserLoginModel user) async{
    emit(LoginLoadingState());
    try {
      final response = await dio.post(APIConst.login, data: user.toJson());
      if(response.statusCode == 200){
        final auth = AuthResponse.fromJson(response.data);

        emit(LoginSuccessState(
          token: auth.data!.token!,
          userName: auth.data!.username!,
        ));
      }
    }catch(e){
      print("======================$e==================");
      emit(LoginErrorState(errorMassage: e.toString()));
    }
  }
}