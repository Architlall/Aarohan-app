import 'package:flutter/material.dart';
import 'package:aarohan_app/resources/firestore_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/widgets/drawer.dart';
import 'package:aarohan_app/models/event.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

// Future getEvents()async{
//   FirebaseService firebaseService = FirebaseService();
//   try{
//     await firebaseService.getEvents();
//     return 1;
//   }
//   catch(e){
//     return 0;
//   }

// }

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    List<EventItem> eventItems = Provider.of<List<EventItem>>(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        drawer: Drawer(
          child: DrawerWidget(Users.us.name, Users.us.photoURL),
        ),
        key: _scaffold,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _scaffold.currentState.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 23.sp,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Aarohan",
                      style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: ListView.builder(
                      itemCount: eventItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(25, 3, 25, 3),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/eventpage',
                                  arguments: {'eventItem': eventItems[index]});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Colors.purple.shade50,
                                    Colors.purple.shade200
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10.sp),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: const Offset(
                                      4.0,
                                      4.0,
                                    ),
                                    blurRadius: 8.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              height: 9.h,
                              child: Center(
                                child: Text(
                                  "${eventItems[index].title}",
                                  style: TextStyle(
                                      letterSpacing: 0.8,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}