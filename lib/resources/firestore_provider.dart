import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aarohan_app/models/event.dart';
import 'package:aarohan_app/models/user.dart';
import 'package:aarohan_app/models/schedule.dart';

class FirebaseService{
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Stream<List<EventItem>> eventListStream() {
    CollectionReference<Map<String, dynamic>> ref =
    _firestore.collection('Events');
    return ref.snapshots().map((events) =>
        events.docs.map((doc) => EventItem.fromFirestore(doc)).toList());
  }



  // getEventDetail(String eventName) async{
  //   // gets all the details of a particular event
  //   DocumentReference ref= _firestore.collection('Events').doc(eventName);
  //   DocumentSnapshot doc =await ref.get();
  //   return doc;
  //   // return the data
  // }

  Stream<List<DayItem>> scheduleListStream() {
    CollectionReference<Map<String, dynamic>> ref =
    _firestore.collection('Schedule');
    return ref.snapshots().map((events) =>
        events.docs.map((doc) => DayItem.fromFirestore(doc)).toList());
  }

  Future getSponsors() async{
    // gets the sponsors list
    CollectionReference ref= _firestore.collection('Sponsors');
    QuerySnapshot doc =await ref.get();

  }

   addToCalendar(String name, uid)async{
    await _firestore.collection("Users").doc(uid).update(
      {
        'calendar': FieldValue.arrayUnion([name])
      }
    );
     
  }



}