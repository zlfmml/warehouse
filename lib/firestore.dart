import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference items =
      FirebaseFirestore.instance.collection('items');
  Future<void> addItem(String item, String description, int jumlah) {
    return items.add({
      'item': item,
      'jumlah': jumlah,
      'description': description,
      'timestamp': Timestamp.now()
    });
  }

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
}
