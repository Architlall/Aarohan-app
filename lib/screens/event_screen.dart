import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/models/event.dart';
import 'package:readmore/readmore.dart';
import 'package:aarohan_app/services/googleapi_services.dart';
import 'package:aarohan_app/resources/firestore_provider.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter/gestures.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:aarohan_app/widgets/custom_gesture_detector.dart';
import 'package:aarohan_app/widgets/menu_widget.dart';
import 'package:provider/provider.dart';

class Event_Detail extends StatefulWidget {
  @override
  _Event_DetailState createState() => _Event_DetailState();
}

GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

bool checkCalendar(String eventName, List calendar) {
  for (var i = 0; i < calendar.length; i++) {
    if (calendar[i].toString() == eventName) return false;
  }
  return true;
}

class _Event_DetailState extends State<Event_Detail> {
  Map data = {};   bool showBottomMenu = false;

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<Users>(context);
    double height= MediaQuery.of(context).size.height;  double width= MediaQuery.of(context).size.width;
    double threshold = 100;
    data = ModalRoute.of(context).settings.arguments;
    EventItem eventItem = data['eventItem'];
    bool vis = checkCalendar(eventItem.title,users.calendar );
    List<String> textsplit = eventItem.contact.split('-');
    return Sizer(
      builder: (context, orientation, deviceType) {
        return SafeArea(
          child: Scaffold(
            body: CustomGestureDetector(
              axis: CustomGestureDetector.AXIS_Y,
              velocity: threshold,
              onSwipeUp: (){
                this.setState((){
                  showBottomMenu = true;
                });
              },
              onSwipeDown: (){
                this.setState((){
                  showBottomMenu = false;
                });
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Aarohan_bg.png"),
                          fit: BoxFit.fill),
                    ),
                    child: ListView(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 36.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.sp),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(eventItem.imageUrl),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.white, width: 1),
                                      color: fromCssColor('#E2F5FF').withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(20.sp)),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.arrow_back,
                                          color: Colors.white, size: 30))),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width * 0.43,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          color: fromCssColor('#E2F5FF')
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10.sp)),
                                      child: GestureDetector(
                                        onTap: () async {
                                          GoogleApi_Services addevent =
                                          GoogleApi_Services();
                                          if (await addevent
                                              .initEvent(eventItem.date)) {
                                            FirebaseService firebase =
                                            FirebaseService();
                                            await firebase
                                                .addToCalendar(eventItem.title,users.id);
                                            setState(() {
                                              vis = false;
                                            });
                                            users.calendar.add(eventItem.title);
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  Future.delayed(
                                                      Duration(milliseconds: 1500),
                                                          () {
                                                        Navigator.of(context).pop(true);
                                                      });
                                                  return AlertDialog(
                                                    title: Center(
                                                      child: Text(
                                                        'Successfully added to Calendar',
                                                        style: TextStyle(
                                                            letterSpacing: 0.8,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                            FontWeight.w500),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  Future.delayed(Duration(seconds: 2),
                                                          () {
                                                        Navigator.of(context).pop(true);
                                                      });
                                                  return AlertDialog(
                                                    title: Center(
                                                      child: Text(
                                                        'Failed to Add to Calendar',
                                                        style: TextStyle(
                                                            letterSpacing: 0.8,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                            FontWeight.w800),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  15, 12, 12, 15),
                                              child: Icon(Icons.calendar_today,
                                                  size: 30, color: Colors.white),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 12, 12, 12),
                                              child: Text(eventItem.date,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w400)),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width * 0.43,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          color: fromCssColor('#E2F5FF')
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10.sp)),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 12, 12, 15),
                                            child: Icon(Icons.workspaces_filled,
                                                size: 30, color: Colors.white),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 12, 12, 12),
                                            child: Text(eventItem.category,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400)),
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Container(
                                        height: 60,
                                        width:
                                        MediaQuery.of(context).size.width * 0.43,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 1),
                                            color: fromCssColor('#E2F5FF')
                                                .withOpacity(0.2),
                                            borderRadius:
                                            BorderRadius.circular(10.sp)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 12, 6, 15),
                                              child: Icon(Icons.call,
                                                  size: 27, color: Colors.white),
                                            ),
                                            FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(
                                                    10, 12, 12, 12),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(textsplit[0],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                            fontWeight:
                                                            FontWeight.w400)),
                                                    Text(textsplit[1],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                            fontWeight:
                                                            FontWeight.w400)),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Container(
                                        height: 60,
                                        width:
                                        MediaQuery.of(context).size.width * 0.43,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 1),
                                            color: fromCssColor('#E2F5FF')
                                                .withOpacity(0.2),
                                            borderRadius:
                                            BorderRadius.circular(10.sp)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  15, 12, 12, 15),
                                              child: Icon(Icons.open_in_new,
                                                  size: 30, color: Colors.white),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 12, 12, 12),
                                              child: Text('Go to Event',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w400)),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Row(
                                children: [
                                  Text(eventItem.title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Text(eventItem.body,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w200)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.5.h,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}