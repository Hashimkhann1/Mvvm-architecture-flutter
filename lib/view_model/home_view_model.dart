import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture/data/responce/api_responce.dart';
import 'package:mvvm_architecture/model/user_list_api_model.dart';
import '../respository/home_repository.dart';


class HomeViewModel with ChangeNotifier {

  final _myRepo = HomeRepository();

  ApiResponce<UserListApiModel> userList = ApiResponce.loading();

  setUserList(ApiResponce<UserListApiModel> responce) {
    userList = responce;
    notifyListeners();
  }

  Future<void> fetcUserListData() async {
    setUserList(ApiResponce.loading());
    _myRepo.getUserListData().then((value) {
      setUserList(ApiResponce.completed(value));
    }).onError((error, stackTrace) {
      setUserList(ApiResponce.error(error.toString()));
      if(kDebugMode){
        print(error);
      }
    });
  }

}