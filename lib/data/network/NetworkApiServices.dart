

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_architecture/data/app_excaption.dart';
import 'package:mvvm_architecture/data/network/BaseApiServices.dart';

class NetworkApiService extends BaseApiServices{
  @override
  Future getGetApiResponce(String url) async {
    dynamic responceJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responceJson = returnResponce(response);
    }on SocketException{
      throw FetchDataExcption('No Internet Connection');
    }

    return responceJson;
  }

  @override
  Future getpostApiResponce(String url , dynamic data) async {
    dynamic responceJson;
    try{
      Response response = await post(
        Uri.parse(url),
        body: data
      ).timeout(const Duration(seconds: 10));
      responceJson = returnResponce(response);
    }on SocketException{
      throw FetchDataExcption('No Internet Connection');
    }
    return responceJson;
  }


  dynamic returnResponce(http.Response response) {
    switch(response.statusCode){
      case 200:
        dynamic responceJson = jsonDecode(response.body);
        return responceJson;
      case 400:
        throw BadRequestExcption(response.body.toString());
      case 404:
        throw UnauthorizedExcption(response.body.toString());
      default:
        throw FetchDataExcption('Erroe accurd while cummunating with server' + response.statusCode.toString());
    }
  }

  
}