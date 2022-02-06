import 'package:flutter/material.dart';
import 'package:aarohan_app/resources/firestore_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/services/auth_services.dart';


class Dashboard extends StatefulWidget {


  @override
  _DashboardState createState() => _DashboardState();
}
void getEvents()async{
  FirebaseService firebaseService = FirebaseService();
  await firebaseService.getEvents();
}
class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    getEvents();
    return Sizer(
      builder: (context,orientation,deviceType){
        return Scaffold(
          body: Container(
            child: Center(
              child: InkWell(
                onTap: (){
                  AuthService authService = AuthService();
                  authService.gSignOut();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1A459E),
                    borderRadius: BorderRadius.circular(5.sp)
                  ),
                  width: 50.w,
                  height: 6.h,
                  child: Center(child: Text(
                      "Sign Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp
                    ),
                  )),

                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
