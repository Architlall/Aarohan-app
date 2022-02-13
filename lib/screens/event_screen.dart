import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/widgets/drawer.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/models/event.dart';
import 'package:readmore/readmore.dart';
import 'package:aarohan_app/services/googleapi_services.dart';
import 'package:aarohan_app/resources/firestore_provider.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter/gestures.dart';

class Event_Detail extends StatefulWidget {

  @override
  _Event_DetailState createState() => _Event_DetailState();
}
GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

 bool checkCalendar(String eventName){
    for(var i =0;i<Users.us.calendar.length;i++){
      if(Users.us.calendar[i].toString()==eventName)
        return false;
    }
    return true;
 }

class _Event_DetailState extends State<Event_Detail> {
  Map data ={};
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    EventItem eventItem = data['eventItem'];
    bool vis = checkCalendar(eventItem.title);
    return Sizer(
        builder: (context,orientation,deviceType){
          return  Scaffold(
            drawer: Drawer(
          child: DrawerWidget(
          Users.us.name,
              Users.us.photoURL
          ),
          ),
            key: _scaffold,
           body: SafeArea(
             child: ListView(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                   height: 36.h,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(7.sp),
                     image: DecorationImage(
                       fit: BoxFit.fill,
                       image: NetworkImage(eventItem.imageUrl),
                     ),
                   ),
               ),
                 ),
                 SizedBox(height: 3.h,),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                   child: Row(
                     children: [
                       Center(
                         child: Text(
                           "${eventItem.title}",
                           style: TextStyle(
                               letterSpacing: 0.8,
                               fontSize: 19.sp,
                               fontWeight: FontWeight.w800
                           ),
                         ),
                       ),
                       SizedBox(width: 10.w,),
                       InkWell(
                           onTap: ()async{
                             GoogleApi_Services addevent = GoogleApi_Services();
                             if(  await addevent.initEvent(eventItem.date)){
                               FirebaseService firebase = FirebaseService();
                               await firebase.addToCalendar(eventItem.title);
                               setState(() {
                                 vis = false;
                               });
                               Users.us.calendar.add(eventItem.title);
                               showDialog(
                                   context: context,
                                   builder: (context) {
                                     Future.delayed(Duration(milliseconds: 1500), () {
                                       Navigator.of(context).pop(true);
                                     });
                                     return AlertDialog(
                                       title: Center(child: Text('Successfully added to Calendar', style: TextStyle(
                                           letterSpacing: 0.8,
                                           fontSize: 12.sp,
                                           fontWeight: FontWeight.w500
                                       ),),

                                       ),
                                     );
                                   });
                             }
                             else{
                               showDialog(
                                   context: context,
                                   builder: (context) {
                                     Future.delayed(Duration(seconds: 2), () {
                                       Navigator.of(context).pop(true);
                                     });
                                     return AlertDialog(
                                       title: Center(child: Text('Failed to Add to Calendar', style: TextStyle(
                                           letterSpacing: 0.8,
                                           fontSize: 12.sp,
                                           fontWeight: FontWeight.w800
                                       ),),

                                       ),
                                     );
                                   });
                             }
                           },
                         child: Container(
                           decoration: BoxDecoration(
                               gradient: vis? LinearGradient( colors: <Color>[Colors.white,Colors.white
                               ],): LinearGradient(
                                 begin: Alignment.topLeft,
                                 end: Alignment.bottomRight,
                                 colors: <Color>[
                                   Colors.purple.shade50,
                                   Colors.purple.shade200
                                 ],
                               ),
                             shape: BoxShape.circle,
                             color: vis?Colors.white:Colors.red
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Icon(
                               Icons.calendar_today_outlined,
                               size: 20.sp,
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
                 SizedBox(height: 0.5.h,),

                    Container(
                      height: 10.h,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: ListView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount: eventItem.tag.length,
                           itemBuilder: (BuildContext context, int index){
                             return Padding(padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                             child: Container(
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                   begin: Alignment.topLeft,
                                   end: Alignment.bottomRight,
                                   colors: <Color>[
                                     Color(0xFFCE98FD),
                                     Color(0xFFFBA26D)
                                   ],
                                 ),
                                 borderRadius: BorderRadius.circular(25)
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                 child: Center(
                                   child: Text("${eventItem.tag[index]}", style: TextStyle(letterSpacing: 0.8, fontSize: 12.sp, fontWeight: FontWeight.w600,color: Colors.black),),
                                 ),
                               ),
                             ),);
                           },
                         ),
                      ),
                    ),


                 SizedBox(height: 3.5.h,),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                   child: Text(
                     "Description",style: TextStyle(
                       letterSpacing: 0.8, fontSize: 15.sp, fontWeight: FontWeight.w900),
                   ),
                 ),
                 SizedBox(height: 2.h,),

                       Padding(
                         padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                         child: Center(
                           child: ReadMoreText(
                     '${eventItem.body}',
                           style: TextStyle(
                               letterSpacing: 0.8, fontSize: 12.sp, fontWeight: FontWeight.w500),
                     trimLines: 3,
                     colorClickableText: Colors.purple.shade900, trimMode: TrimMode.Line, trimCollapsedText: 'READ MORE', trimExpandedText: 'READ LESS',
                      moreStyle: TextStyle( letterSpacing: 0.8, fontSize: 11.sp, fontWeight: FontWeight.w900,color: Colors.purple.shade900),
                      lessStyle: TextStyle( letterSpacing: 0.8, fontSize: 11.sp, fontWeight: FontWeight.w900,color: Colors.purple.shade900),
                     ),
                         ),
                       ),
                 SizedBox(height: 3.h,),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(
                         "Date: ",style: TextStyle(
                           letterSpacing: 0.8, fontSize: 15.sp, fontWeight: FontWeight.w900),
                       ),
                       Text(
                         "${eventItem.date}",style: TextStyle(
                           letterSpacing: 0.8, fontSize: 12.sp, fontWeight: FontWeight.w500),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 3.h,),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                   child: Row(
                     children: [
                       Link(
                           uri: Uri.parse('${eventItem.link}'),
                           //target: LinkTarget.self,
                           builder: (context, followLink) {
                             return RichText(
                               text: TextSpan(children: [
                                 TextSpan(
                                   text: 'Link:  ',style: TextStyle(
                                     letterSpacing: 0.8, fontSize: 15.sp, fontWeight: FontWeight.w900,color: Colors.black),
                                 ),
                                 TextSpan(
                                   text: '${eventItem.title}', style: TextStyle(color: Colors.blue, letterSpacing: 0.8, decoration: TextDecoration.underline,
                                     fontWeight: FontWeight.w500, fontSize: 13.sp,
                                   ),
                                   recognizer: TapGestureRecognizer()
                                     ..onTap = followLink,
                                 ),
                               ]),
                             );
                           }),
                     ],
                   ),
                 ),
                 SizedBox(height: 3.h,)
               ],
             ),
           ),
          );
        },
    );
  }
}
