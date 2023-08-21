import 'package:flutter/material.dart';
import "package:inventory/ItemsCard.dart";
import 'package:go_router/go_router.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ItemsList(),
      ),
    );
  }
}

class ItemModel {
  ItemModel({
    required this.image,
    required this.name,
    required this.quantity,
  });

  String image;
  String name;
  String quantity;
}

class ItemsList extends StatefulWidget {
  const ItemsList({Key? key}) : super(key: key);

  @override
  State<ItemsList> createState() => ItemsListState();
}

class ItemsListState extends State<ItemsList> {
  // List<CategoryModel> categoriesList = [];
  // List<ProductModel> productModelList = [];
  List productModelList = [
    ItemModel(
        image: 'assets/images/shoe1.jpg', name: "lorem", quantity: "1234"),
    ItemModel(
        image: 'assets/images/shoe1.jpg', name: "lorem", quantity: "1234"),
    ItemModel(
        image: 'assets/images/shoe1.jpg', name: "lorem", quantity: "1234"),
    ItemModel(
        image: 'assets/images/shoe1.jpg', name: "lorem", quantity: "1234"),
    ItemModel(
        image: 'assets/images/shoe1.jpg', name: "lorem", quantity: "1234"),
    ItemModel(
        image: 'assets/images/shoe1.jpg', name: "lorem", quantity: "1234"),
    ItemModel(
        image: 'assets/images/shoe1.jpg', name: "lorem", quantity: "1234"),
    ItemModel(
        image: 'assets/images/shoe1.jpg', name: "lorem", quantity: "1234"),
    ItemModel(image: 'assets/images/shoe1.jpg', name: "lorem", quantity: "1234")
  ];

  bool isLoading = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(107, 59, 225, 1),
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .35,
            ),
            Text(
              "All Items",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  productModelList.isEmpty
                      ? const Center(
                          child: Text(" product is Empty"),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(
                            12,
                          ),
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              primary: false,
                              itemCount: productModelList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                      childAspectRatio: 0.9),
                              itemBuilder: (ctx, index) {
                                ItemModel singleProduct =
                                    productModelList[index];
                                return ItmeCard(
                                    imagePath: singleProduct.image,
                                    name: singleProduct.name,
                                    price: singleProduct.quantity,
                                    quntity: singleProduct.quantity);
                              }),
                        ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
    );
  }
}
