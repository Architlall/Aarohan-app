import 'package:flutter/material.dart';
import 'package:aarohan_app/resources/eurekoin.dart';


class Eurekoin_Home extends StatefulWidget {


  @override
  _Eurekoin_HomeState createState() => _Eurekoin_HomeState();
}

class _Eurekoin_HomeState extends State<Eurekoin_Home> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: editingController,
              decoration: InputDecoration(
                hintText: "REFERRAL CODE"
              ),
            ),
            TextButton(
              child: Text("REGISTER"),
              onPressed:  ()async{
                await Eurekoin.registerEurekoinUser(editingController.text);
                Navigator.popAndPushNamed(context, '/leaderboard');
              },
            )
          ],
        ),
      ),
    );
  }
}
