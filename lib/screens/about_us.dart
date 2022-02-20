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
                                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur turpis libero, faucibus a ultrices et, consequat ut risus. Sed pretium sapien ut ante bibendum, sit amet suscipit mauris dictum. Vestibulum laoreet lacus commodo accumsan finibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras id nisi a sem lobortis suscipit a eu ipsum. Nam lobortis ipsum vel efficitur malesuada. Mauris ornare diam nec interdum elementum. Quisque id dolor velit. Ut iaculis, erat vitae efficitur aliquet, purus felis viverra mauris, non egestas diam felis eu ligula. Maecenas finibus convallis porta. Fusce luctus dictum pretium. Phasellus tempor nunc in dui consequat maximus. Mauris dapibus, ligula id varius pretium, augue libero elementum quam, sit amet tempor lectus nunc vitae arcu. Nulla ex nisl, semper et hendrerit vel, interdum mollis ipsum. Maecenas sit amet diam imperdiet, pretium quam in, dignissim mauris. Donec tempor sapien tempus, efficitur nibh ac, gravida lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec ultrices ultrices aliquam. Etiam ut efficitur risus. Mauris sit amet imperdiet ante.Duis pharetra purus sit amet nulla mattis dictum. Fusce auctor a elit molestie placerat. Curabitur malesuada dolor est, quis dictum dui hendrerit pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec vehicula, mauris quis efficitur vestibulum, sapien lectus porta lectus, sed congue leo sem sed ipsum. Integer eleifend dapibus dui, vitae tempor ante lobortis non. Integer bibendum ut nisi a consectetur. Sed rutrum ut lacus et feugiat. Nulla facilisi. Donec urna erat, viverra non ligula sed, lacinia posuere quam. Nullam a neque nulla.Praesent vel augue iaculis, lobortis lectus in, finibus augue. Aenean vel lobortis diam, a molestie augue. Morbi lacus tellus, malesuada at metus ullamcorper, porttitor lacinia justo. Aliquam erat volutpat. Phasellus at ex sollicitudin, efficitur ligula sit amet, vulputate leo. Proin quis velit sed urna imperdiet tempus vel nec mi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam cursus arcu nisl, ac mattis massa ornare at. Nunc sed blandit orci, non congue velit. Phasellus iaculis diam non risus pharetra blandit id id nunc. Aliquam erat volutpat. Curabitur dictum tortor sit amet est auctor tincidunt.Phasellus aliquam ut erat quis condimentum. Morbi ornare urna eget risus tristique egestas. Aenean bibendum urna id hendrerit vehicula. Suspendisse elit augue, pellentesque eget molestie dignissim, varius eget lorem. Pellentesque enim mi, finibus ut tincidunt eu, vehicula nec leo. Ut interdum turpis vel nisi commodo, at tempus risus semper. Sed aliquet nisi elit, sit amet imperdiet diam accumsan sit amet. Nam quis condimentum elit, in congue velit. Nulla pretium velit vel ipsum suscipit finibus. Phasellus pretium, magna quis interdum placerat, erat dui interdum orci, quis imperdiet urna nunc id nisi. Ut vel enim ut diam interdum pharetra. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aliquam erat volutpat.",
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