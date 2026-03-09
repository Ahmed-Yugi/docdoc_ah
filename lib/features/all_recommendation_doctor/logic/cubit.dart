import 'dart:async';
import 'package:docdoc/core/helper/dio_helper.dart';
import 'package:docdoc/features/all_recommendation_doctor/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/const/api_const.dart';
import '../../../core/helper/response_helper.dart';
import '../data/all_doctors_data_model.dart';

class AllDoctorsCubit extends Cubit<AllDoctorsStates> {
  AllDoctorsCubit() : super(AllDoctorsInitialState());
  AllDoctorsDataModel? _originalDoctors;
  AllDoctorsDataModel? _searchedDoctors;
  Timer? _debounce;

  //Get All Doctors Data
  Future getAllDoctorsData() async {
    emit(AllDoctorsLoadingState());
    try {
      final response = await DioHelper.getData(
        url: APIConst.doctor,
      );
      final docData = ResponseHelper.handleResponse<AllDoctorsDataModel>(
        response: response,
        fromJson: (json) => AllDoctorsDataModel.fromJson(json),
      );
      _originalDoctors = docData;
      emit(AllDoctorsSuccessState(allDoctorsData: docData));
    } catch (e) {
      print("======================$e==================");
      emit(AllDoctorsErrorState(errorMassage: e.toString()));
    }
  }

  //Search From API
  Future searchFromApi(String query) async {
    try {
       final response = await DioHelper.getData(
        url: APIConst.searchDoctor,
         query: {
          "name": query,
        },
      );
      final docData = ResponseHelper.handleResponse<AllDoctorsDataModel>(
        response: response,
        fromJson: (json) => AllDoctorsDataModel.fromJson(json),
      );
      _searchedDoctors = docData;
      emit(AllDoctorsSuccessState(allDoctorsData: docData));
    } catch (e) {
      print("======================$e==================");
      emit(AllDoctorsErrorState(errorMassage: e.toString()));
    }
  }
  //Search Doctors
  void searchDoctors(String query) {
    if( _debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 250), ()async{
      if(query.trim().isEmpty){
        if(_originalDoctors != null){
          emit(AllDoctorsSuccessState(allDoctorsData: _originalDoctors!));
        }
      }else{
        searchFromApi(query);
      }
    });
  }


}