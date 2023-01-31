

import 'package:mvvm_architecture/data/responce/status.dart';

class ApiResponce<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponce(this.status, this.message, this.data);

  ApiResponce.loading() : status = Status.LOADING;

  ApiResponce.completed() : status = Status.COMPLETED;

  ApiResponce.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}