import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aarohan_app/services/auth_services.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatefulWidget {
  bool showBottomMenu;
  MenuWidget(this.showBottomMenu);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    // print(Users.us.photoURL);
    Users users = Provider.of<Users>(context);
    // print(users.name);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BackdropFilter(
      filter: (widget.showBottomMenu)
          ? ImageFilter.blur(sigmaX: 10, sigmaY: 10)
          : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: fromCssColor('#E2F5FF').withOpacity(0.2),
        ),
        width: width,
        height: height * 0.65 + 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Visibility(
                visible: !widget.showBottomMenu,
                child: Center(
                  child: Text(
                    "MENU",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Mons',
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                child: (widget.showBottomMenu)
                    ? Image.asset('assets/down.png')
                    : Image.asset('assets/up.png'),
                height: 40,
                width: 40,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Visibility(
                visible: widget.showBottomMenu,
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 27.0,
                              backgroundImage: (users != null)
                                  ? NetworkImage(users.photoURL)
                                  : AssetImage('assets/profile1.png'),
                            ),
                            SizedBox(
                              width: width * 0.06,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (users != null) ? "${users.name}" : "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Staat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  (users != null) ? "${users.email}" : "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.2,
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/sponsors');
                              },
                              child: Image.asset('assets/msg.png')),
                          height: height * 0.06,
                          width: width * 0.11,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/about');
                          },
                          child: Container(
                            child: Image.asset('assets/profile.png'),
                            height: height * 0.06,
                            width: width * 0.11,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            AuthService authService = AuthService();
                            authService.gSignOut();
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: Image.asset('assets/logout.png'),
                            height: height * 0.06,
                            width: width * 0.11,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Center(
                      child: Text(
                        "UTILITIES",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                            fontFamily: 'Bebas',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/contributors');
                              },
                              child: Image.asset('assets/tile.png')),
                          height: height * 0.06,
                          width: width * 0.11,
                        ),
                        Container(
                          child: Image.asset('assets/eurekoin.png'),
                          height: height * 0.06,
                          width: width * 0.11,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/timeline');
                          },
                          child: Container(
                            child: Image.asset('assets/timer.png'),
                            height: height * 0.06,
                            width: width * 0.11,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Image.asset('assets/leaderboard.png'),
                          height: height * 0.06,
                          width: width * 0.11,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        "ATTRACTIONS",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                            fontFamily: 'Bebas',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Image.asset('assets/game.png'),
                          height: height * 0.06,
                          width: width * 0.11,
                        ),
                        Container(
                          child: Image.asset('assets/list.png'),
                          height: height * 0.06,
                          width: width * 0.11,
                        ),
                        Container(
                          child: Image.asset('assets/journo.png'),
                          height: height * 0.06,
                          width: width * 0.11,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
