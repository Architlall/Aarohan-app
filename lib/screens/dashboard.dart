import 'package:flutter/material.dart';
import 'package:aarohan_app/resources/firestore_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/widgets/drawer.dart';


class Dashboard extends StatefulWidget {


  @override
  _DashboardState createState() => _DashboardState();
}
GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
void getEvents()async{
  FirebaseService firebaseService = FirebaseService();
  await firebaseService.getEvents();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,orientation,deviceType){
        return Scaffold(
          drawer: Drawer(
            child: DrawerWidget(
              Users.us.name,
              Users.us.photoURL
            ),
          ),
          key:  _scaffold,
          body:SafeArea(
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:5.h,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            _scaffold.currentState.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 23.sp,
                          ),
                        ),
                        SizedBox(width: 20.w,),
                        Text(
                          "Aarohan",
                          style: TextStyle(
                            letterSpacing: 1.2,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:20.h,),


                ],
              ),
          ),
        );
      },
    );
  }
}
