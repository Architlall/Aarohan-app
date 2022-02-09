import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_page.dart';
import 'package:aarohan_app/screens/event_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: HomePage(),
    routes: {
      '/eventpage':(context)=> Event_Detail()
    },


  ));
}

