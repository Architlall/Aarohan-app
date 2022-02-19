import 'package:aarohan_app/models/event.dart';
import 'package:aarohan_app/resources/firestore_provider.dart';
import 'package:aarohan_app/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'package:aarohan_app/screens/event_screen.dart';
import 'package:aarohan_app/models/schedule.dart';
import 'package:aarohan_app/screens/timeline.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/services/auth_services.dart';



Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      StreamProvider<List<EventItem>>(
          create: (_) => FirebaseService().eventListStream(), initialData: []),
      StreamProvider<List<DayItem>>(
          create: (_) => FirebaseService().scheduleListStream(), initialData: []),
    ],
    child: MaterialApp(
      home: HomePage(),
      routes: {'/eventpage': (context) => Event_Detail(),
               '/timeline': (context)=> Timeline(),
               '/home':(context)=> Dashboard()
      },
    ),
  ));
}