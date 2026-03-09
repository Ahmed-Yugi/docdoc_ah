import 'package:dio/dio.dart';
import 'package:docdoc/features/auth/register/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/api_const.dart';
import '../../../../core/helper/cash_helper.dart';
import '../data/auth_response.dart';
import '../data/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  Dio dio = Dio();

  Future register (UserModel user) async{
    emit(RegisterLoadingState());
    try {
     final response = await dio.post(APIConst.register, data: user.toJson());
     if(response.statusCode == 200){
       final auth = AuthResponse.fromJson(response.data);
       await CacheHelper.saveToken(auth.data!.token!);
       emit(RegisterSuccessState(
         token: auth.data!.token!,
         userName: auth.data!.username!,
       ));
     }
    }catch(e){
      print("======================$e==================");
      emit(RegisterErrorState(errorMassage: e.toString()));
    }
  }
}