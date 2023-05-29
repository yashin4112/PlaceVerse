import 'package:cloud_firestore/cloud_firestore.dart';

class PlacementData{
  static Future<Map> retriveData()async {
    var data={};
    await FirebaseFirestore.instance.collection('Placement').get().then(
      (QuerySnapshot) async {
        data.clear();
        for (var e in QuerySnapshot.docs) {
          data[e.id] = e.data();
        }
      }
    );
    return data;
  }


}
    