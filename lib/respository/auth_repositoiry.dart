

import 'package:mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:mvvm_architecture/data/network/NetworkApiServices.dart';
import 'package:mvvm_architecture/res/app_url.dart';

class AuthRepositiory {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try{

      dynamic responce = await _apiServices.getpostApiResponce(AppUrl.loginUrl, data);
      return responce;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> RegisterApi(dynamic data) async {
    try{
      dynamic responce = await _apiServices.getpostApiResponce(AppUrl.registerUrl, data);
      return responce;
    }catch(e){
      throw e;
    }
  }

}