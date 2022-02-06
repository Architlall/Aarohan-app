import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/services/auth_services.dart';


class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,orientation,deviceType){
        return Scaffold(
          body: Container(
            child: Center(
              child: Container(
                width: 50.w,
                height: 6.h,
                child: Center(
                  child: SignInButton(
                    Buttons.GoogleDark,
                    onPressed: (){
                      AuthService authService = AuthService();
                      authService.gSignIn();
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
