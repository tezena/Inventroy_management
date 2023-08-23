import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference products =
      FirebaseFirestore.instance.collection("products");
}
