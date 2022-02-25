import 'package:flutter/material.dart';
import 'package:aarohan_app/widgets/custom_gesture_detector.dart';
import 'package:aarohan_app/widgets/menu_widget.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/models/prelim.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class Prelims extends StatefulWidget {

  @override
  _PrelimsState createState() => _PrelimsState();
}

class _PrelimsState extends State<Prelims> {
  bool showBottomMenu = false; double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    List<PrelimItem> prelimItems = Provider.of<List<PrelimItem>>(context);
    double height= MediaQuery.of(context).size.height;  double width= MediaQuery.of(context).size.width;
    double threshold = 100;
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
                                       "Prelims",
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
                         SizedBox(height: 3.h,),
                         Container(
                           height: 65.h,
                           child: ListView.builder(
                             itemCount: prelimItems.length,
                             itemBuilder: (context,index){
                              return    ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 1.5,sigmaY: 1.5),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                                    child: InkWell(
                                      onTap: (){
                                        FocusManager.instance.primaryFocus.unfocus();
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>
                                            SafeArea(
                                              child: Scaffold(
                                                body: InAppWebView(
                                                  initialUrlRequest: URLRequest(url: Uri.parse("${prelimItems[index].url}")),
                                                  androidOnPermissionRequest: (controller, origin, resources) async {
                                                    return PermissionRequestResponse(
                                                        resources: resources,
                                                        action: PermissionRequestResponseAction.GRANT);
                                                  },
                                                  onProgressChanged: (controller, progress) {
                                                    setState(() {
                                                      this.progress = progress / 100;
                                                    });
                                                  },
                                                ),
                                              ),
                                            )
                                        ));
                                      },
                                      child: Container(

                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white,width: 0.2.w),
                                            borderRadius: BorderRadius.circular(15.sp),
                                            color: fromCssColor('#E2F5FF')
                                                .withOpacity(0.3)
                                        ),
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                                prelimItems[index].title.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Mons',letterSpacing: 1.1,
                                                  fontSize:13.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          height: 8.h,
                                        ),
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
           ),
         );
       },
     );
  }
}

