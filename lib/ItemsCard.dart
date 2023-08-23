import "package:flutter/material.dart";
import 'package:inventory/EditScreen.dart';
import 'package:inventory/productDetail.dart';

class ItmeCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final num price;
  final num quntity;
  final bool isTrue;

  const ItmeCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.quntity,
    this.isTrue = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .40,
        width: MediaQuery.of(context).size.width * .45,
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    productName: 'Nike shoe',
                    productImageUrl: 'assets/images/shoe1.jpg',
                    stockInAmount: 100.0,
                    stockOutAmount: 50.0,
                    runningOutAmount: 50.0,
                    productPrice: 19.99,
                    expiryDate: '2023-12-31',
                    supplier: 'Example Supplier',
                    availableUnits: 30,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(7),
              color:
                  isTrue ? Colors.white : const Color.fromRGBO(107, 59, 225, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  side: isTrue
                      ? const BorderSide(
                          width: 2, color: Color.fromRGBO(107, 59, 225, 1))
                      : BorderSide.none),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 110,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 8, right: 20),
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 8, right: 20),
                    child: Text(
                      "price:$price",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 8, right: 20),
                    child: Text(
                      "Quantity:$quntity",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            )));
  }
}
