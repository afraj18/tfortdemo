import 'package:cloud_firestore/cloud_firestore.dart';

class checkOut {
  getUserData() async {
    var collection = FirebaseFirestore.instance.collection('');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      var name = data['name'];
      var address = data['address'];
      var phoneNo = data['phoneNo'];
    }
  }
}
