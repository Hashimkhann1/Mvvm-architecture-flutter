import 'package:flutter/material.dart';
import 'package:mvvm_architecture/data/responce/status.dart';
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
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
            builder: (context , value , _) {
              switch(value.userList.status){
                case Status.ERROR:
                  return Text(value.userList.message.toString());
                case Status.LOADING:
                  return CircularProgressIndicator();
                case Status.COMPLETED:
                  print(value.userList.data?.data?.length);
                  return ListView.builder(
                    itemCount: value.userList.data?.data?.length,
                      itemBuilder: (context , index){
                      var res = value.userList.data!.data![index];
                      return Card(
                        elevation: 10,
                        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 75,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(res.avatar.toString())
                                  )
                              ),
                            ),
                            Row(
                              children: [
                                Text(res.firstName.toString()),
                                const SizedBox(width: 3,),
                                Text(res.lastName.toString()),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Align(alignment: Alignment.topLeft, child: Text(res.email.toString())),
                          ],
                        )
                      );
                  });
                default:
                  return Text('default');
              }
          return Container();
        })
      )
    );
  }
}
