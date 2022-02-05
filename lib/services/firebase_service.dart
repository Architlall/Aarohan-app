import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getEvents() async{
    // gets all the events list
    CollectionReference ref= _firestore.collection('Events');
    QuerySnapshot doc =await ref.get();
    // return the data
  }

  Future getEventDetail(String eventName) async{
    // gets all the details of a particular event
    DocumentReference ref= _firestore.collection('Events').doc(eventName);
    DocumentSnapshot doc =await ref.get();
    // return the data
  }

  Future getSchedule(String day) async{
    // gets the schedule for a particular day
    DocumentReference ref= _firestore.collection('Schedule').doc(day);
    DocumentSnapshot doc =await ref.get();
    // return the data
  }


}