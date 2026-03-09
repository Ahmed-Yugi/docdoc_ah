import 'dart:math';

import 'package:dio/dio.dart';
import 'package:docdoc/features/home/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/const/api_const.dart';
import '../../../core/helper/cash_helper.dart';
import '../data/home_data_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  Dio dio = Dio();

  Future getHomeData() async {
    emit(HomeLoadingState());

    try {
      final token = CacheHelper.getToken();
      final response = await dio.get(
        APIConst.home,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        final data = HomeDataModel.fromJson(response.data);
        emit(HomeSuccessState(homeData: data.data!));
      }
    } catch (e) {
      print("======================$e==================");
      emit(HomeErrorState(errorMassage: e.toString()));
    }
  }

}