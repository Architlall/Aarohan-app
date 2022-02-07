import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aarohan_app/models/event.dart';

class FirebaseService{
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getEvents() async{
    // gets all the events list
    QuerySnapshot doc =await _firestore.collection('Events').get();
    final List<DocumentSnapshot> documents = doc.docs;
    List events = [];
    documents.forEach((data) =>  events.add(data.id));
    events.forEach((element)=> print(element));

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

  Future getSponsors() async{
    // gets the sponsors list
    CollectionReference ref= _firestore.collection('Sponsors');
    QuerySnapshot doc =await ref.get();

  }


}