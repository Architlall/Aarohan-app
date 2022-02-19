import 'package:aarohan_app/models/contributor.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:from_css_color/from_css_color.dart';

import 'package:provider/provider.dart';

class Contributor_Detail extends StatefulWidget {
  @override
  _Contributor_DetailState createState() => _Contributor_DetailState();
}

class _Contributor_DetailState extends State<Contributor_Detail> {
  Map data = {};
  bool showBottomMenu = false;

  @override
  Widget build(BuildContext context) {
    List<ContributorItem> contributorItems =
        Provider.of<List<ContributorItem>>(context);
    int l = contributorItems.length;

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
                                "Contributors",
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
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, index) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(7.sp),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                    child: Image(
                                        image: AssetImage(
                                            'assets/baby_enderman.png'),
                                        fit: BoxFit.fitWidth)),
                              ),
                              Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color:
                                      fromCssColor('#E2F5FF').withOpacity(0.4),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(10, 3, 0, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'NAME',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Staat',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                'assets/phone 1.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/linkedin.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/github.png')),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
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
