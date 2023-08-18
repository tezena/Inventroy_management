import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        backgroundColor: Color.fromRGBO(107, 59, 225, 1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  color: Color(0xffbD9D9D9),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Icon(Icons.add_a_photo, size: 65, color: Colors.black),
              ),
            ),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      onChanged: (String value) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: 'Quantity',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      onChanged: (String value) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Distributer',
                        hintText: 'Distributer',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      onChanged: (String value) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Category',
                        hintText: 'Category',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      onChanged: (String value) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        hintText: 'Price',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      onChanged: (String value) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 55.0,
                      onPressed: () {},
                      child: Text(
                        'Update',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Color(0xffb6B3BE1),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
