import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aarohan_app/repository/user_respository.dart';
import 'package:aarohan_app/screens/dashboard.dart';
import 'package:aarohan_app/screens/login.dart';


class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserRepository>(
      create: (context) => UserRepository.instance(),
      child: Consumer(
          builder: (context, UserRepository user,child){
            switch (user.status){
              case Status.Uninitialized:
                return Login();
              case Status.Unauthenticated:
                return Login();
              case Status.Authenticating:
                return CircularProgressIndicator();
              case Status.Authenticated:
                return Dashboard();
            }
            return null;
          }
      ),
    );
  }
}
