import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/widgets/menu_widget.dart';
import 'package:aarohan_app/widgets/custom_gesture_detector.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/resources/eurekoin.dart';
import 'package:aarohan_app/widgets/redeem.dart';
import 'dart:ui';

class Leaderboard extends StatefulWidget {


  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  TextEditingController editingController = TextEditingController();
  bool showBottomMenu = false; bool showdialog = false; int _coins; String _referralCode;

  @override
  void initState() {
    // TODO: implement initState
    Eurekoin.getAllUsers("s");
     Eurekoin.getUserEurekoin().then((value){
       setState(() {
         _coins = value;
       });
     });
     Eurekoin.getReferralCode().then((value){
       setState(() {
         _referralCode = value;
       });
     });
    super.initState();

  }


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
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: CustomGestureDetector(
                  axis: CustomGestureDetector.AXIS_Y,
                  velocity: threshold,
                  onSwipeUp: (){
                    // if(!showdialog)
                      this.setState((){
                        showBottomMenu = true;
                      });
                  },
                  onSwipeDown: (){
                    // if(!showdialog)
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
                            height: 16.h,
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
                                          showDialog(context: context, builder: (context)=> BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                                            child: Dialog(

                                              insetPadding: EdgeInsets.all(5.w),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                                 side: BorderSide(
                                                   style: BorderStyle.solid,
                                                   width: 1.sp,color: Colors.white
                                                 )
                                              ),
                                              backgroundColor:fromCssColor('#E2F5FF')
                                                  .withOpacity(0.2),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 2.h),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Text("Redeem Eurekoins",
                                                        style: TextStyle(
                                                            color: Colors.white, letterSpacing: 0.5,
                                                            fontFamily: 'Staat',
                                                            fontSize: 20.sp,
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                      SizedBox(height: 4.h,),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(

                                                              decoration: BoxDecoration(
                                                                // color: Colors.red,
                                                                  border: Border.all(color: Colors.white,width: 0.5.sp),
                                                                  borderRadius: BorderRadius.circular(10.sp)
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(1.sp),
                                                                child: TextField(
                                                                  style:TextStyle(
                                                                      color: Colors.white,
                                                                      fontFamily: 'Poppins',
                                                                      fontSize: 14.sp,letterSpacing: 1

                                                                  ) ,
                                                                  controller: editingController,
                                                                  decoration: InputDecoration(
                                                                      contentPadding: EdgeInsets.fromLTRB(4.w, 1.h, 3.w, 1.h),
                                                                      border: InputBorder.none,
                                                                      labelText: 'Redeem Code',
                                                                      labelStyle: TextStyle(
                                                                          color: Colors.white.withOpacity(0.5),
                                                                          fontFamily: 'Poppins',
                                                                          fontSize: 13.sp,
                                                                          fontWeight: FontWeight.w500
                                                                      )
                                                                  ),
                                                                  //
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 4.h,),
                                                      InkWell(
                                                        onTap: ()async{
                                                        await  Eurekoin.couponEurekoin(editingController.text);
                                                        Navigator.pop(context);
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 1.5.h),
                                                          decoration: BoxDecoration(
                                                              color: Colors.white.withOpacity(0.4),
                                                              border: Border.all(color: Colors.white,width: 0.5.sp),
                                                              borderRadius: BorderRadius.circular(10.sp)
                                                          ),
                                                          child: Text("REDEEM",style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily: 'Poppins',
                                                              fontSize: 15.sp,
                                                              fontWeight: FontWeight.w500
                                                          ),),

                                                        ),
                                                      ),
                                                      SizedBox(height: 2.h,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Image.asset('assets/horline.png',width: 20.w,),
                                                           Text("OR",style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily: 'Staat',
                                                              fontSize: 15.sp,
                                                              fontWeight: FontWeight.w500
                                                          ),),
                                                          Image.asset('assets/horline.png',width: 20.w,),
                                                        ],
                                                      ),
                                                      SizedBox(height: 2.h,),
                                                      Text("Scan a QR Code",style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15.sp,
                                                          fontWeight: FontWeight.w500
                                                      ),),
                                                      SizedBox(height: 2.h,),
                                                      Image.asset('assets/Scanner.png'),
                                                      SizedBox(height: 1.h,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                          );
                                        },
                                        child: Container(
                                          child: Center(
                                        //     child: CircleAvatar(
                                        //     radius: 10.sp,
                                        //     // backgroundColor: Colors.transparent,
                                        //     backgroundImage:
                                        //     AssetImage('assets/coupon.png'),
                                        // ),
                                            child:Icon(Icons.card_giftcard,color: Colors.white,size: 25.sp,)
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
                                height: 17.h,
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
                                      padding:  EdgeInsets.fromLTRB(5.w, 0.7.h, 5.w, 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Balance",
                                            style: TextStyle(
                                                color: Colors.white, letterSpacing: 1.1,
                                                fontFamily: 'Poppins',
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          // SizedBox(width: 3.w,),
                                          Row(
                                            children: [
                                              Icon(Icons.share,color: Colors.white, size: 15,),
                                              SizedBox(width: 1.w,),
                                              Text(
                                                (_referralCode!=null)?"$_referralCode":"",style: TextStyle(
                                                  color: Colors.white, letterSpacing: 1.1,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(5.w, 1.h, 0, 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(child:
                                              Image.asset('assets/eurekoin.png'),
                                                height: height*0.04,width: width*0.09,),
                                              SizedBox(width: 2.w,),
                                              Text(
                                                (_coins!=null)?"$_coins":"",
                                                style: TextStyle(
                                                    color: Colors.white, letterSpacing: 1.1,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 5.w),
                                            child:
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
                            height: 44.5.h,
                            // color: Colors.blue,
                            child: FutureBuilder(
                              future:  Eurekoin.fetchLeaderboard(),
                              builder: (context,snapshot){
                                if(snapshot.hasData)return ListView.builder(
                                  itemCount: snapshot.data.length,
                                itemBuilder: (context,index){
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 1.h),
                                    child: ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 1.5,sigmaY: 1.5),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(5.w, 1.h, 2.w, 1.h) ,

                                          height: 9.h,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.white,width: 0.2.w),
                                              borderRadius: BorderRadius.circular(15.sp),
                                              color: fromCssColor('#E2F5FF')
                                                  .withOpacity(0.25)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 63.w,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "${index +1}.",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13.sp,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                    SizedBox(width: 2.w,),
                                                    CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                        '${snapshot.data[index]['imageURL']}',
                                                      ),
                                                      radius: 12.sp,
                                                    ),
                                                    SizedBox(width: 2.w,),
                                                    Text(
                                                      "${snapshot.data[index]['username']}",
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 11.sp,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),


                                              // SizedBox(width: 8.w,),
                                              Container(

                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/eurekoin.png',height: height*0.04,width: width*0.09),
                                                    SizedBox(width: 1.w),
                                                    Text(
                                                      "${snapshot.data[index]['coins']}",
                                                      style: TextStyle(
                                                          color: Colors.white, letterSpacing: 0.5,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13.sp,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                                else
                                  return Center(child: CircularProgressIndicator(),);
                                  },
                            ),
                          )

                        ],
                      ),
                      Visibility(
                        visible: !showdialog,
                        child: AnimatedPositioned(
                            curve: Curves.easeInOut,
                            width: width,
                            duration: Duration(milliseconds: 500),
                            bottom: (showBottomMenu)?height*0.125:-(height*0.65),
                            child: MenuWidget(showBottomMenu)),
                      ),

                      // Visibility(
                      //   visible: showdialog,
                      //   child:      AnimatedPositioned(
                      //     duration: Duration(milliseconds: 500),
                      //     top: height*0.03,
                      //     left: width*0.05,
                      //     child: InkWell(
                      //       onTap: (){
                      //        setState(() {
                      //          showdialog=false;
                      //        });
                      //       },
                      //       child: Container(
                      //         child: CircleAvatar(
                      //           radius: 18,
                      //           backgroundImage:
                      //           AssetImage('assets/back.png'),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      //
                      // Visibility(
                      //   visible: showdialog,
                      //   child: AnimatedPositioned(
                      //       curve: Curves.easeInOut,
                      //       width: width,
                      //       duration: Duration(milliseconds: 500),
                      //       bottom: height*0.125,
                      //       child: Redeem(showdialog)),
                      // )
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
