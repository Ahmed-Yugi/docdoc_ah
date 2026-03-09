import '../data/all_doctors_data_model.dart';

class AllDoctorsStates{}

class AllDoctorsInitialState extends AllDoctorsStates{}

class AllDoctorsLoadingState extends AllDoctorsStates{}

class AllDoctorsSuccessState extends AllDoctorsStates{
  AllDoctorsDataModel allDoctorsData;
  AllDoctorsSuccessState({required this.allDoctorsData});
}

class AllDoctorsErrorState extends AllDoctorsStates{

  String errorMassage;
  AllDoctorsErrorState({required this.errorMassage});

}