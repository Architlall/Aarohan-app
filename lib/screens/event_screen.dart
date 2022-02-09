import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/widgets/drawer.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/models/event.dart';
import 'package:readmore/readmore.dart';

class Event_Detail extends StatefulWidget {

  @override
  _Event_DetailState createState() => _Event_DetailState();
}
GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

class _Event_DetailState extends State<Event_Detail> {
  Map data ={};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    int x = data['index'];
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
                       image: NetworkImage(EventResponse.eventResponse.eventItem[x].imageUrl),
                     ),
                   ),
               ),
                 ),
                 SizedBox(height: 1.5.h,),
                 Center(
                   child: Text(
                     "${EventResponse.eventResponse.eventItem[x].title}",
                     style: TextStyle(
                         letterSpacing: 0.8,
                         fontSize: 14.sp,
                         fontWeight: FontWeight.w800
                     ),
                   ),
                 ),
                 SizedBox(height: 2.h,),

                       Padding(
                         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                         child: Center(
                           child: ReadMoreText(
                     '${EventResponse.eventResponse.eventItem[x].body}',
                           style: TextStyle(
                               letterSpacing: 0.8, fontSize: 10.sp, fontWeight: FontWeight.w500),
                     trimLines: 3,
                     colorClickableText: Colors.purple.shade900, trimMode: TrimMode.Line, trimCollapsedText: 'READ MORE', trimExpandedText: 'READ LESS',
                      moreStyle: TextStyle( letterSpacing: 0.8, fontSize: 11.sp, fontWeight: FontWeight.w900,color: Colors.purple.shade900),
                      lessStyle: TextStyle( letterSpacing: 0.8, fontSize: 11.sp, fontWeight: FontWeight.w900,color: Colors.purple.shade900),
                     ),
                         ),
                       ),
                 SizedBox(height: 2.h,),
                 


               ],
             ),
           ),
          );
        },
    );
  }
}
