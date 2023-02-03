


import 'package:mvvm_architecture/data/network/NetworkApiServices.dart';
import 'package:mvvm_architecture/res/app_url.dart';

import '../data/network/BaseApiServices.dart';
import '../model/user_list_api_model.dart';

class HomeRepository {

  BaseApiServices _apiServices = NetworkApiService();

  Future<UserListApiModel> getUserListData() async {
    try{
      dynamic respone = await _apiServices.getGetApiResponce(AppUrl.userListUril);
      return respone = UserListApiModel.fromJson(respone);
    }catch(e){
      throw e;
    }
  }

}