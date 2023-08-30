import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:inventory/models/products.dart";
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import "package:flutter/material.dart";
import 'package:inventory/models/usermodel.dart';

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

  Future<void> updateProduct(
      String pid, Map<String, dynamic> updatedData) async {
    try {
      QuerySnapshot querySnapshot =
          await productsCollection.where('pid', isEqualTo: pid).get();
      if (querySnapshot.docs.isNotEmpty) {
        await querySnapshot.docs.first.reference.update(updatedData);
      }
    } catch (error) {
      print("not update");
      throw error;
    }
  }

  Future<void> deleteProduct(String pid) async {
    try {
      final productsCollection =
          FirebaseFirestore.instance.collection('products');
      final snapshot =
          await productsCollection.where('pid', isEqualTo: pid).get();

      if (snapshot.docs.isNotEmpty) {
        final productDoc = snapshot.docs.first;
        await productDoc.reference.delete();
        print("Product deleted successfully");
      } else {
        print("Product not found");
      }
    } catch (e) {
      print("Error deleting product: $e");
      throw Exception("Error deleting product");
    }
  }

  Future<Product> getProductByPid(String pid) async {
    try {
      print("searching ****************** $pid");
      final productsCollection =
          FirebaseFirestore.instance.collection('products');
      final querySnapshot =
          await productsCollection.where('pid', isEqualTo: pid).get();

      if (querySnapshot.docs.isNotEmpty) {
        final documentSnapshot = querySnapshot.docs[0];
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return Product(
          pid: data['pid'] as String,
          name: data['name'] as String,
          quantity: data['quantity'] as int,
          price: data['price'] as double,
          distributor: data['distributor'] as String,
          category: data['category'] as String,
          imageUrl: data['imageUrl'] as String,
          expiredate: data['expiredate'] as String,
        );
      } else {
        throw Exception("Product with PID $pid not found");
      }
    } catch (e) {
      throw Exception("Error fetching product: $e");
    }
  }
}
