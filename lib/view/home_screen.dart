import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/view_model/home_view_model.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';


class HomeScrren extends StatefulWidget {
  const HomeScrren({Key? key}) : super(key: key);

  @override
  State<HomeScrren> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScrren> {
  @override

  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.fetcUserListData();
  }

  Widget build(BuildContext context) {

    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: [
          InkWell(
              onTap: (){
                userPreference.remove();
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: Center(child: Text('Logout'))),
        ],
      ),
      body: Column(
        children: [
          Center(

          )
        ],
      ),
    );
  }
}
