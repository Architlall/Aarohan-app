import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/models/event.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:aarohan_app/widgets/custom_gesture_detector.dart';
import 'package:aarohan_app/widgets/menu_widget.dart';
import 'package:aarohan_app/sliver_components/SABT.dart';
import 'dart:ui';

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

class _Event_DetailState extends State<Event_Detail>  {
  Map data = {};   bool showBottomMenu = false;

  @override
  Widget build(BuildContext context) {
    Users users = Users.us;
    double height= MediaQuery.of(context).size.height;  double width= MediaQuery.of(context).size.width;
    double threshold = 100;
    data = ModalRoute.of(context).settings.arguments;
    EventItem eventItem = data['eventItem'];
    bool vis = checkCalendar(eventItem.title,users.calendar );
    List<String> textsplit = eventItem.contact.split('-');
    return Sizer(
      builder: (context, orientation, deviceType) {
        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Aarohan_bg.png"), fit: BoxFit.fill),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
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
                     Column(
                       children: [
                         Container(
                           height: 82.h,
                           // color: Colors.red,
                           child: CustomScrollView(
                             slivers: [
                               SliverAppBar(
                                 leading: Padding(
                                   padding: EdgeInsets.fromLTRB(5.w, 1.h, 0, 0),
                                   child: InkWell(
                                     onTap: (){
                                       Navigator.pop(context);
                                     },
                                     child: Container(
                                       child: CircleAvatar(
                                         // radius: 15,
                                         backgroundImage:
                                         AssetImage('assets/back.png'),
                                       ),
                                     ),
                                   ),
                                 ),
                                 flexibleSpace: Container(
                                   decoration: BoxDecoration(
                                       color: Colors.blueGrey.withOpacity(0.99),
                                     // color: Colors.red,
                                       border: Border(bottom: BorderSide(
                                           color: Colors.white70,
                                           width: 1,
                                           style: BorderStyle.solid
                                       ))
                                   ),
                                   child: FlexibleSpaceBar(
                                     collapseMode: CollapseMode.pin,
                                     title: SABT(
                                       child: Text("${eventItem.title}",style: TextStyle(
                                           color: Colors.white, letterSpacing: 1.1,
                                           fontFamily: 'Mons',
                                           fontSize: 19.sp,
                                           fontWeight: FontWeight.w500),),
                                     ),
                                     background:  Container(
                                         child:Image.network(eventItem.imageUrl,width: 100.w,fit: BoxFit.fill,height: 60.h,)),
                                   ),
                                 ),
                                 pinned: true,
                                 // floating: true,
                                 expandedHeight: 40.h,
                                 backgroundColor: Colors.transparent,
                                 collapsedHeight: 13.5.h,

                               ),
                               SliverList(delegate: SliverChildListDelegate([
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Padding(
                                       padding: EdgeInsets.only(top: 3.h),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           ClipRect(
                                             child: BackdropFilter(
                                               filter: ImageFilter.blur(sigmaX: 1.5,sigmaY: 1.5),
                                               child: Padding(
                                                 padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
                                                 child: Container(
                                                     height: 9.h,
                                                     width: 43.w,
                                                     decoration: BoxDecoration(
                                                         border: Border.all(
                                                             color: Colors.white, width: 1),
                                                         color: fromCssColor('#E2F5FF')
                                                             .withOpacity(0.2),
                                                         borderRadius: BorderRadius.circular(10.sp)),
                                                     child: GestureDetector(

                                                       child: Row(
                                                         children: [
                                                           Padding(
                                                             padding:  EdgeInsets.fromLTRB(
                                                                 4.w, 2.h, 2.w, 3.h),
                                                             child: Icon(Icons.calendar_today,
                                                                 size: 23.5.sp, color: Colors.white),
                                                           ),
                                                           Padding(
                                                             padding:  EdgeInsets.fromLTRB(
                                                                 2.w, 2.h, 2.w, 1.8.h),
                                                             child: Text(eventItem.date,
                                                                 style: TextStyle(
                                                                   fontSize: 11.5.sp, fontFamily: 'Staat',letterSpacing: 1.1,
                                                                     color: Colors.white,
                                                                     fontWeight: FontWeight.w400)),
                                                           )
                                                         ],
                                                       ),
                                                     )),
                                               ),
                                             ),
                                           ),
                                           ClipRect(
                                             child: BackdropFilter(
                                               filter: ImageFilter.blur(sigmaX: 1.5,sigmaY: 1.5),
                                               child: Padding(
                                                 padding: EdgeInsets.fromLTRB(0, 0, 4.w, 0),
                                                 child: Container(
                                                     height: 9.h,
                                                     width: 43.w,
                                                     decoration: BoxDecoration(
                                                         border: Border.all(
                                                             color: Colors.white, width: 1),
                                                         color: fromCssColor('#E2F5FF')
                                                             .withOpacity(0.2),
                                                         borderRadius: BorderRadius.circular(10.sp)),
                                                     child: Row(
                                                       children: [
                                                         Padding(

                                                           padding:  EdgeInsets.fromLTRB(
                                                               4.w, 2.h, 2.w, 3.h),
                                                           child: Icon(Icons.workspaces_filled,
                                                               size: 30, color: Colors.white),
                                                         ),
                                                         Padding(
                                                           padding:  EdgeInsets.fromLTRB(
                                                               2.w, 2.h, 2.w, 1.8.h),
                                                           child: Text(eventItem.category,
                                                               style: TextStyle(
                                                                   fontSize: 11.5.sp, fontFamily: 'Staat',letterSpacing: 1.1,
                                                                   color: Colors.white,
                                                                   fontWeight: FontWeight.w400)),
                                                         )
                                                       ],
                                                     )),
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                     Padding(
                                       padding: EdgeInsets.only(top: 1.7.h),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           ClipRect(
                                             child: BackdropFilter(
                                               filter: ImageFilter.blur(sigmaX: 1.5,sigmaY: 1.5),
                                               child: Padding(
                                                 padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
                                                 child: Container(
                                                     height: 9.h,
                                                     width: 43.w,
                                                     decoration: BoxDecoration(
                                                         border: Border.all(
                                                             color: Colors.white, width: 1),
                                                         color: fromCssColor('#E2F5FF')
                                                             .withOpacity(0.2),
                                                         borderRadius: BorderRadius.circular(10.sp)),
                                                     child: Row(
                                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                       children: [
                                                         Padding(
                                                           padding:  EdgeInsets.fromLTRB(
                                                               1.w, 2.5.h, 0, 3.h),
                                                           child: Icon(Icons.call,
                                                               size: 27, color: Colors.white),
                                                         ),
                                                         FittedBox(
                                                           fit: BoxFit.scaleDown,
                                                           child: Padding(
                                                             padding:  EdgeInsets.fromLTRB(
                                                                 0, 2.h, 2.w, 1.8.h),
                                                             child: Column(
                                                               crossAxisAlignment: CrossAxisAlignment.start,
                                                               children: [
                                                                 Text(textsplit[0],
                                                                     style: TextStyle(
                                                                         fontSize: 11.5.sp, fontFamily: 'Staat',letterSpacing: 1.1,
                                                                         color: Colors.white,
                                                                         fontWeight: FontWeight.w400)),
                                                                 Text(textsplit[1],
                                                                     style: TextStyle(
                                                                         fontSize: 11.5.sp, fontFamily: 'Staat',letterSpacing: 1.1,
                                                                         color: Colors.white,
                                                                         fontWeight: FontWeight.w400)),
                                                               ],
                                                             ),
                                                           ),
                                                         )
                                                       ],
                                                     )),
                                               ),
                                             ),
                                           ),
                                        ClipRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 1.5,sigmaY: 1.5),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(0, 0, 4.w, 0),
                                              child: Container(
                                                  height: 9.h,
                                                  width: 43.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white, width: 1),
                                                      color: fromCssColor('#E2F5FF')
                                                          .withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(10.sp)),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:  EdgeInsets.fromLTRB(
                                                            4.w, 2.h, 0, 3.h),
                                                        child: Icon(Icons.open_in_new,
                                                            size: 30, color: Colors.white),
                                                      ),
                                                      Padding(
                                                        padding:  EdgeInsets.fromLTRB(
                                                            3.w, 1.5.h, 2.w, 1.8.h),
                                                        child: Text('Go to Event',
                                                            style: TextStyle(
                                                                fontSize: 11.5.sp, fontFamily: 'Staat',letterSpacing: 1.1,
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w400)),
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        )
                                         ],
                                       ),
                                     ),
                                     Padding(
                                       padding:  EdgeInsets.fromLTRB(5.w, 3.h, 2.w, 0),
                                       child: Text(eventItem.title,
                                           style: TextStyle(
                                               fontSize: 21.5.sp, fontFamily: 'Poppins',letterSpacing: 1.1,
                                               color: Colors.white,
                                               fontWeight: FontWeight.w600)),
                                     ),
                                     Padding(
                                       padding:  EdgeInsets.fromLTRB(5.w, 3.h, 7.w, 2.h),
                                       child: Text(eventItem.body,
                                           style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 12.sp,fontFamily:'Poppins',letterSpacing: 1.1 ,
                                               fontWeight: FontWeight.w200)),
                                     )
                                   ],
                                 ),
                               ]))
                             ],
                           ),
                         ),
                       ],
                     ),

                    AnimatedPositioned(
                        curve: Curves.easeInOut,
                        width: width,
                        duration: Duration(milliseconds: 500),
                        bottom: (showBottomMenu)?height*0.125:-(height*0.65),
                        child: MenuWidget(showBottomMenu))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}