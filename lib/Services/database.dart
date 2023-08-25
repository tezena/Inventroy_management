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
            pid: data['pid'],
            expiredate: data['expiredate']);
      }).toList();
      return products;
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
      
      final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> updateProduct(String pid, Map<String, dynamic> updatedData) async {
    try {
      QuerySnapshot querySnapshot = await productsCollection.where('pid', isEqualTo: pid).get();
      if (querySnapshot.docs.isNotEmpty) {
        await querySnapshot.docs.first.reference.update(updatedData);
      }
    } catch (error) {
      print("not update");
      throw error;
    }
  }
  }

//  Future<Product?> getProductByProduct(String pid) async {
//   try {
//     DocumentSnapshot doc =
//         await _firestore.collection('products').doc(pid).get();
//     if (doc.exists) {
//       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//       return Product(
//         pid: doc.id,
//         name: data['name'],
//         quantity: data['quantity'],
//         price: data['price'],
//         distributor: data['distributor'],
//         category: data['category'],
//         imageUrl: data['imageUrl'],
//         expiredate: data['expiredate'],
//       );
//     } else {
//       return null; // Return null if the product doesn't exist.
//     }
//   } catch (e) {
//     throw e;
//   }
// }


// }
