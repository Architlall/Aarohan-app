import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:aarohan_app/services/auth_services.dart';

class DrawerWidget extends StatelessWidget {
   final String name; final String url;
  DrawerWidget(this.name, this.url);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,orientation,deviceType){
        return Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: ListView(
              children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
                    Center(
                      child: CircleAvatar(
                        radius: 35.0,
                        backgroundImage: NetworkImage(url),
                      ),
                    ),
                    SizedBox(height: 3.h,),
                    Center(
                      child: Text(
                        "$name",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Text(
                      "Utilities",
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Card(

                      child: ListTile(
                        title:Text(
                          "Dashboard",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title:Text(
                          "Timeline",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title:Text(
                          "Eurekoin Wallet",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      "Team Aavishkar",
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Card(

                      child: ListTile(
                        title:Text(
                          "Sponsors",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title:Text(
                          "Contact Us",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title:Text(
                          "Contributors",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: Center(
                        child: InkWell(
                          onTap: (){
                            AuthService authService = AuthService();
                            authService.gSignOut();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.sp)
                            ),
                            width: 55.w,
                            height: 7.h,
                            child: Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 2.w,),
                                Text(
                                  "Sign Out",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w800
                                  ),
                                ),
                              ],
                            )),

                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ] ,
            ),
          ),
        );
      },
    );
  }
}
