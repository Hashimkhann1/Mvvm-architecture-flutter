

// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/model/user_model.dart';
import 'package:mvvm_architecture/respository/auth_repositoiry.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepositiory();

  bool _loading = false;
  bool get loading => _loading;

  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignupLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data , BuildContext context) async {
    setLoading(true);
    final userPreference = Provider.of<UserViewModel>(context,listen: false);
    _myRepo.loginApi(data).then((value) {
      userPreference.saveUser(UserModel(token: value['token'].toString()));
      setLoading(false);
      if(kDebugMode){
        print(value.toString());
        Utils.flutterFlashBarMessage("Lognin Successfully", Colors.black26 , context);
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        Utils.flutterFlashBarMessage(error.toString(), Colors.redAccent , context);
        print(error.toString());
      }
    });
  }
  Future<void> signUpApi(dynamic data , BuildContext context) async {
    setSignupLoading(true);
    _myRepo.RegisterApi(data).then((value) {
      setSignupLoading(false);
      if(kDebugMode){
        print(value.toString());
      }
      Utils.flutterFlashBarMessage("Sign up Successfully", Colors.black26 , context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      if(kDebugMode){
        print(error.toString());
      }
      Utils.flutterFlashBarMessage(error.toString(), Colors.redAccent , context);
    });
  }

}