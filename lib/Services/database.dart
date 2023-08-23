import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:inventory/models/products.dart";

class DatabaseService {
  final CollectionReference products =
      FirebaseFirestore.instance.collection("products");
}

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('products').get();
      List<Product> products = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Product(
          name: data['name'],
          quantity: data['quantity'],
          price: data['price'],
          distributor: data['distributor'],
          category: data['category'],
          imageUrl: data['imageUrl'],
        );
      }).toList();

      return products;
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
}
