import 'package:aarohan_app/widgets/custom_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:aarohan_app/widgets/menu_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_database/firebase_database.dart';

class User {
  User(this.rank, this.username, this.email, this.score);
  int rank;
  String username;
  String email;
  int score;
  set setRank(num value) => rank = value;
  set setUsername(String value) => username = value;
  set setEmail(String value) => email = value;
  set setScore(num value) => score = value;
}

List<dynamic> ctfUsers;
List<dynamic> digitalfortressUsers;
List<dynamic> freemexUsers;

List<DropdownMenuItem<String>> eventList = [
  DropdownMenuItem(
    child: Text(
      "Capture The Flag",
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    value: "CTF",
  ),
  DropdownMenuItem(
    child: Text("Digital Fortress",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    value: "Digitalfortress",
  ),
  DropdownMenuItem(
    child: Text("Freemex",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    value: "Freemex",
  ),
];

// Future<dynamic> getctfScoreData() async {
//   String apiUrl = "https://foobar.nitdgplug.org/api/scoreboard";
//   http.Response response = await http.get(apiUrl);
//   return json.decode(response.body);
// }

// Future<dynamic> getdigitalfortressScoreData() async {
//   String apiUrl = "https://df.nitdgplug.org/api/scoreboard";
//   http.Response response = await http.get(apiUrl);
//   return json.decode(response.body);
// }

// Future<dynamic> getfreemexScoreData() async {
//   String apiUrl = "https://freemex.nitdgplug.org/api/scoreboard";
//   http.Response response = await http.get(apiUrl);
//   return json.decode(response.body);
// }

class Scoreboard extends StatefulWidget {
  @override
  _ScoreboardState createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  bool showBottomMenu = false;
  var dts = DTS();
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  String Selected;
  String hinttext = "Select event";
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double threshold = 100;
    return Sizer(builder: (context, orientation, deviceType) {
      return SafeArea(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Aarohan_bg.png"),
                    fit: BoxFit.fill),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: CustomGestureDetector(
                  axis: CustomGestureDetector.AXIS_Y,
                  velocity: threshold,
                  onSwipeUp: () {
                    this.setState(() {
                      showBottomMenu = true;
                    });
                  },
                  onSwipeDown: () {
                    this.setState(() {
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
                                color: fromCssColor('#E2F5FF').withOpacity(0.4),
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white70,
                                        width: 1,
                                        style: BorderStyle.solid))),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5.w, 1.h, 0, 0),
                                      child: InkWell(
                                        onTap: () {
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
                                      padding:
                                          EdgeInsets.fromLTRB(19.w, 0, 0, 0),
                                      child: Text(
                                        "Scoreboard",
                                        style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1.1,
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
                          Container(
                            padding: EdgeInsets.only(top: 10.0, bottom: 20),
                            alignment: Alignment.topCenter,
                            child: Container(
                              child: DropdownButton(
                                dropdownColor: Colors.blueGrey,
                                value: Selected,
                                iconSize: 13.0,
                                hint: Text("$hinttext",
                                    style: TextStyle(color: Colors.white)),
                                items: eventList,
                                elevation: 20,
                                onChanged: ((value) {
                                  setState(() {
                                    Selected = value;
                                    // dataRecieved = false;
                                  });
                                  // createUserList(value);
                                }),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 65.h,
                              
                              child: Theme(
                                 data: Theme.of(context)
            .copyWith(cardColor: fromCssColor('#E2F5FF').withOpacity(0.4), dividerColor: Colors.blue[900]),
                                child: ListView(
                                  children: [
                                    PaginatedDataTable(
                                      header: Text('Header', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                                      columns: [
                                        DataColumn(label: Text('col1',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400))),
                                        DataColumn(label: Text('col2',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400))),
                                        DataColumn(label: Text('col3',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400))),
                                        DataColumn(label: Text('col4',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)))
                                      ],
                                      source: dts,
                                      onRowsPerPageChanged: (r) {
                                        setState(() {
                                          _rowPerPage = r;
                                        });
                                      },
                                      rowsPerPage: _rowPerPage,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      AnimatedPositioned(
                          curve: Curves.easeInOut,
                          width: width,
                          duration: Duration(milliseconds: 500),
                          bottom: (showBottomMenu)
                              ? height * 0.125
                              : -(height * 0.65),
                          child: MenuWidget(showBottomMenu))
                    ],
                  ),
                ),
              )));
    });
  }
}

 Future<dynamic> getctfScoreData() async {
    String apiUrl = "https://foobar.nitdgplug.org/api/scoreboard";
    http.Response response = await http.get(Uri.parse(apiUrl));
    return response.body;
  }

  Future<dynamic> getdigitalfortressScoreData() async {
    String apiUrl = "https://df.nitdgplug.org/api/scoreboard";
    http.Response response = await http.get(Uri.parse(apiUrl));
    return response.body;
  }

  Future<dynamic> getfreemexScoreData() async {
    String apiUrl = "https://freemex.nitdgplug.org/api/scoreboard";
    http.Response response = await http.get(Uri.parse(apiUrl));
    return response.body;
  }

class DTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text("#cel1$index",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300))),
      DataCell(Text("#cel2$index",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300))),
      DataCell(Text("#cel3$index",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300))),
      DataCell(Text("#cel4$index",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300))),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
