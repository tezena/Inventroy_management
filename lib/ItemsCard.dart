import "package:flutter/material.dart";

class ItmeCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final String quntity;
  final bool isTrue;

  ItmeCard({
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
      child: Card(
        margin: EdgeInsets.all(7),
        color: isTrue ? Colors.white : Color.fromRGBO(107, 59, 225, 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
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
              child:ClipRRect( 
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                child:Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ) ,
              ) ,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 8, right: 20),
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
                   "price:" + price,
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
                   "Quantity:" + quntity,
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
      ),
    );
  }
}



