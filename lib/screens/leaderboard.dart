import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/widgets/menu_widget.dart';
import 'package:aarohan_app/widgets/custom_gesture_detector.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/resources/eurekoin.dart';
import 'dart:ui';

class Leaderboard extends StatefulWidget {


  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  TextEditingController editingController = TextEditingController();
  bool showBottomMenu = false;
  @override
  Widget build(BuildContext context) {

    double height= MediaQuery.of(context).size.height;  double width= MediaQuery.of(context).size.width;double threshold = 100;
    Users users = Users.us;
    return Sizer(
      builder: (context,orientation,deviceType){
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
                            alignment: Alignment.bottomCenter,
                            height: 14.5.h,
                            decoration: BoxDecoration(
                                color: fromCssColor('#E2F5FF')
                                    .withOpacity(0.4),
                                border: Border(bottom: BorderSide(
                                    color: Colors.white70,
                                    width: 1,
                                    style: BorderStyle.solid
                                ))
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5.w, 1.h, 0, 0),
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundImage:
                                            AssetImage('assets/back.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(19.w, 0, 0, 0),
                                      child: Text(
                                        "Eurekoins",
                                        style: TextStyle(
                                            color: Colors.white, letterSpacing: 1.1,
                                            fontFamily: 'Mons',
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 3.w, 0),
                                      child:InkWell(
                                        onTap: (){
                                          showDialog(context: context, builder: (context)=> AlertDialog(
                                            title: Text("Hello"),
                                            content: Column(
                                              children: [
                                                TextField(
                                                  controller: editingController,
                                                  decoration: InputDecoration(
                                                      hintText: "REFERRAL CODE"
                                                  ),
                                                ),
                                                TextButton(
                                                  child: Text("REGISTER"),
                                                  onPressed:  ()async{
                                                    await Eurekoin.couponEurekoin(editingController.text);
                                                    // Navigator.popAndPushNamed(context, '/leaderboard');
                                                  },
                                                )
                                              ],
                                            ),
                                          ));
                                        },
                                        child: Container(
                                          child: Center(
                                            child: CircleAvatar(
                                            radius: 8.sp,
                                            // backgroundColor: Colors.transparent,
                                            backgroundImage:
                                            AssetImage('assets/Vector.png'),
                                        ),
                                          ),),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h,),
                          ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 1.5,sigmaY: 1.5),
                              child: Container(
                                height: 16.h,
                                width: 85.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white,width: 0.2.w),
                                  borderRadius: BorderRadius.circular(15.sp),
                                    color: fromCssColor('#E2F5FF')
                                        .withOpacity(0.25)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(5.w, 1.7.h, 0, 0),
                                      child: Text(
                                        "${users.name}",
                                        style: TextStyle(
                                            color: Colors.white, letterSpacing: 1.1,
                                            fontFamily: 'Staat',
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(5.w, 0.7.h, 0, 0),
                                      child: Text(
                                        "Balance",
                                        style: TextStyle(
                                            color: Colors.white, letterSpacing: 1.1,
                                            fontFamily: 'Poppins',
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(5.w, 0.7.h, 0, 0),
                                      child: Row(
                                        children: [
                                          Container(child:
                                          Image.asset('assets/eurekoin.png'),
                                            height: height*0.04,width: width*0.09,),
                                          SizedBox(width: 2.w,),
                                          Text(
                                            "22.1",
                                            style: TextStyle(
                                                color: Colors.white, letterSpacing: 1.1,
                                                fontFamily: 'Poppins',
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(width: 45.w,),
                                          Container(child:
                                          Image.asset('assets/Pay icon.png'),
                                            height: height*0.04,width: width*0.09,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(9.w, 2.h, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  "Top Eurekoin Owners",
                                  style: TextStyle(
                                      color: Colors.white, letterSpacing: 1.1,
                                      fontFamily: 'Staat',
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Container(
                            height: 46.h,
                            // color: Colors.blue,
                            child: ListView.builder(
                              itemCount: 15,
                              itemBuilder: (context,index){
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 1.h),
                                  child: ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 1.5,sigmaY: 1.5),
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 1.h) ,

                                        height: 9.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white,width: 0.2.w),
                                            borderRadius: BorderRadius.circular(15.sp),
                                            color: fromCssColor('#E2F5FF')
                                                .withOpacity(0.25)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 5.w,),
                                            Text(
                                              "${index +1}.  ${users.name}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(width: 8.w,),
                                            Container(child:
                                            Image.asset('assets/eurekoin.png'),
                                              height: height*0.04,width: width*0.09,),
                                            SizedBox(width: 1.w,),
                                            Padding(
                                              padding: EdgeInsets.only(right: 3.w),
                                              child: Text(
                                                "500",
                                                style: TextStyle(
                                                    color: Colors.white, letterSpacing: 0.5,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )

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
            )
        );
      },
    );
  }
}
