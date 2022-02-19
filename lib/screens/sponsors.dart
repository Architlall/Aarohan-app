import 'package:aarohan_app/models/sponsor.dart';
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

class Sponsor_Detail extends StatefulWidget {
  @override
  _Sponsor_DetailState createState() => _Sponsor_DetailState();
}

class _Sponsor_DetailState extends State<Sponsor_Detail> {
  Map data = {};
  bool showBottomMenu = false;

  @override
  Widget build(BuildContext context) {
    List<SponsorItem> sponsorItems = Provider.of<List<SponsorItem>>(context);
    int l = sponsorItems.length;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Aarohan_bg.png"), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 13.h,
                      decoration: BoxDecoration(
                          color: fromCssColor('#E2F5FF').withOpacity(0.4),
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.white70,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                "Sponsors",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Mons',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 28.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              color: fromCssColor('#E2F5FF').withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20.sp)),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back,
                                  color: Colors.white, size: 30))),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, index) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                         
                          decoration: BoxDecoration(
                            color: fromCssColor('#E2F5FF').withOpacity(0.4),
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(7.sp),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(sponsorItems[index].imageUrl),
                            ),
                          ),
                        ),
                      ),
                      itemCount: l,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
