



class AppExcaption implements Exception{
  final _message;
  final prefix;

  AppExcaption([this._message , this.prefix]);

  String toString() {
    return '$prefix$_message';
  }
}


class FetchDataExcption extends AppExcaption {
  FetchDataExcption([String? message]) : super(message,'Error During Communication');
}


class BabRequestExcption extends AppExcaption {
  BabRequestExcption([String? message]) : super(message,'Invaid Request');
}

class UnauthorizedExcption extends AppExcaption {
  UnauthorizedExcption([String? message]) : super(message,'Unauthorizad Request');
}

class InvalidInputExcaption extends AppExcaption {
  InvalidInputExcaption([String? message]) : super(message,'Invalid Input');
}