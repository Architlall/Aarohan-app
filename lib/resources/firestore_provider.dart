import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aarohan_app/models/event.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // getEvents() async {
  //   List events = [];
  //   // gets all the events list
  //   QuerySnapshot doc = await _firestore.collection('Events').get();
  //   final List<DocumentSnapshot> documents = doc.docs;

  //   for (var element in documents) {
  //     var data = await getEventDetail(element.id);

  //     Map<String, String> event_data = {
  //       'title': data['title'],
  //       'body': data['body'],
  //       'imageUrl': data['imageUrl'],
  //       'date': data['date'],
  //       'category': data['category'],
  //       'tag': data['tag'],
  //       'link': data['link'],
  //       'location': data['location'],
  //       'contact': data['contact']
  //     };

  //     events.add(event_data);
  //   }
  //   Map<String, dynamic> Event_Details = {"EventItem": events};
  //   EventResponse.eventResponse = EventResponse.fromJson(Event_Details);
  //   // print(Event_Details);
  // }

  Stream<List<EventItem>> eventListStream() {
    CollectionReference<Map<String, dynamic>> ref =
        _firestore.collection('Events');
    return ref.snapshots().map((events) =>
        events.docs.map((doc) => EventItem.fromFirestore(doc)).toList());
  }

  getEventDetail(String eventName) async {
    // gets all the details of a particular event
    DocumentReference ref = _firestore.collection('Events').doc(eventName);
    DocumentSnapshot doc = await ref.get();
    return doc.data();
    // return the data
  }

  Future getSchedule(String day) async {
    // gets the schedule for a particular day
    DocumentReference ref = _firestore.collection('Schedule').doc(day);
    DocumentSnapshot doc = await ref.get();
    // return the data
  }

  Future getSponsors() async {
    // gets the sponsors list
    CollectionReference ref = _firestore.collection('Sponsors');
    QuerySnapshot doc = await ref.get();
  }
}
