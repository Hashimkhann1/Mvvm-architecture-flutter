import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';


import 'package:fluttertoast/fluttertoast.dart';

class Utils {


  static void fieldFocusChage(BuildContext context , FocusNode current , FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: Colors.red,

    );
  }

  static void flutterFlashBarMessage(String messgae , BuildContext context) {
    showFlushbar(context: context, flushbar: Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 12),
      padding: const EdgeInsets.all(10),
      message: messgae,
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(20),
      // title: "SAD",
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      icon: Icon(Icons.error,color: Colors.white,size: 28,),
    )..show(context)
    );
  }

  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      )
    );
  }

}