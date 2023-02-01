import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/route.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

