import 'package:flutter/material.dart';
import 'package:aarohan_app/resources/firestore_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/widgets/drawer.dart';
import 'package:aarohan_app/models/event.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  List<EventItem> arr = [];
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  List<EventItem> eventItems;
  @override
  void initState() {
    super.initState();
    setState(() {
      eventItems = Provider.of<List<EventItem>>(context, listen: false);
      arr = eventItems;
    });
    ctrl.addListener(() {
      int next = ctrl.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  
  }

  int currentPage = 0;
  final PageController ctrl = PageController(viewportFraction: 0.85);

  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

    return Sizer(builder: (context, orientation, deviceType) {
      return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Aarohan_bg.png"), fit: BoxFit.fill),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            drawer: Drawer(
              child: DrawerWidget(Users.us.name, Users.us.photoURL),
            ),
            key: _scaffold,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 11.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xFF21305C).withOpacity(0.7),
                          Color(0xFF284863).withOpacity(0.8)
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/aarohan-logo 1.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            "Aarohan",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Mons',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 8.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[Color(0xD5343548), Color(0xE43E4E7C)],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              arr = eventItems;
                            });
                          },
                          child: Container(
                            child: Text(
                              "All",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Mons',
                                  fontSize: 3.9.w,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              arr = eventItems.where(
                                  (element) => element.category == "Workshop");
                              // arr = [];
                              // for (int i = 0; i < eventItems.length; i++) {
                              //   if (eventItems[i].category == "Workshop") {
                              //     arr.add(eventItems[i]);
                              //   }
                              // }
                              print(arr[0].category);
                            });
                          },
                          child: Container(
                            child: Text(
                              "Workshops",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Mons',
                                  fontSize: 3.9.w,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              arr = [];
                              for (int i = 0; i < eventItems.length; i++) {
                                if (eventItems[i].category == "Event") {
                                  arr.add(eventItems[i]);
                                }
                              }
                            });
                          },
                          child: Container(
                            child: Text(
                              "Events",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Mons',
                                  fontSize: 3.9.w,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              arr = [];
                              for (int i = 0; i < eventItems.length; i++) {
                                if (eventItems[i].category == "Talk") {
                                  arr.add(eventItems[i]);
                                }
                              }
                            });
                          },
                          child: Container(
                            child: Text(
                              "Talks",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Mons',
                                  fontSize: 3.9.w,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 53.h,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        PageView.builder(
                          controller: ctrl,
                          scrollDirection: Axis.horizontal,
                          itemCount: arr.length,
                          itemBuilder: (context, index) {
                            bool active = index == currentPage;
                            final double top = active ? 15 : 35;
                            final double opacity = active ? 0.5 : 0;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  AnimatedContainer(
                                    curve: Curves.easeOutQuint,
                                    duration: Duration(milliseconds: 800),
                                    margin: EdgeInsets.only(
                                        top: top, bottom: 0, right: 8, left: 8),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.greenAccent
                                              .withOpacity(opacity),
                                          spreadRadius: 0.2,
                                          blurRadius: 25.sp,
                                          offset: Offset(0,
                                              5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      child: Image.network(
                                        '${arr[index].imageUrl}',
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(18.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Center(
                                      child: Text(
                                        "${arr[index].title}",
                                        style: TextStyle(
                                            fontFamily: 'Mons',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.sp,
                                            letterSpacing: 1.1),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        Text("LATER"),
                        Text("LATER"),
                        Text("LATER"),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      "Fest Dates",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Mons',
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                spreadRadius: 0.2,
                                blurRadius: 22.sp,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                            color: Colors.grey.shade600.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("3",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mons',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text("THU",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mons',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.28),
                                spreadRadius: 0.2,
                                blurRadius: 22.sp,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                            color: Colors.grey.shade600.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("3",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mons',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text("THU",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mons',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.28),
                                spreadRadius: 0.2,
                                blurRadius: 22.sp,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                            color: Colors.grey.shade600.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("3",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mons',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text("THU",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mons',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                spreadRadius: 0.2,
                                blurRadius: 22.sp,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                            color: Colors.grey.shade600.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("3",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mons',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text("THU",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mons',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
