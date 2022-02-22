import 'package:aarohan_app/widgets/custom_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:aarohan_app/widgets/menu_widget.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool showBottomMenu = false;
  
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;  double width= MediaQuery.of(context).size.width;double threshold = 100;
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
                           height: 13.5.h,
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
                                       "About Aarohan",
                                       style: TextStyle(
                                           color: Colors.white, letterSpacing: 1.1,
                                           fontFamily: 'Mons',
                                           fontSize: 20.sp,
                                           fontWeight: FontWeight.w500),
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                         SizedBox(
                           height: 3.h,
                         ),
                         Padding(
                           padding: EdgeInsets.fromLTRB(5.w, 0 , 4.w, 0),
                           child: Container(
                             height: 69.h,
                             // color: Colors.red,
                             child: ListView(
                               children: [
                                 Text(
                                   "Aarohan is the Annual Techno-Management fest of NIT Durgapur, the 2nd Largest of its kind in the whole of eastern India. Started in the year 2003, it has been leading the light of instilling a culture of science, technology and innovation among the youth of the nation. With more than 40 events covering all genres of technology and management, Aarohan brings some of the best solutions for mankind to the fore. Numerous workshops and lectures are organised, thus introducing the students to new vistas in the field of technologyMany great personalities, the likes of Dr. Sunil Handa, Professor at IIM-A and Founder of The Eklavya Foundation, Mr. Irfan Alam, founder of The Samman Foundation, Mr. R. Sriram, founder of CROSSWORD and Sramana Mitra, entrepreneur and strategy consultant at MIT have graced Aarohan with their enlightening presence.Under the patronage of CEE, SAYEN and Digital India, the upcoming 19th edition of Aarohan is going to be held virtually from 1-4th April 2021.",
                                   style: TextStyle(
                                       color: Colors.white, letterSpacing: 1.1,
                                       fontFamily: 'Poppins',
                                       fontSize: 13.sp,
                                       fontWeight: FontWeight.w400),
                                 ),
                               ],
                             ),
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
           ),
         );
       },
     );
  }
}