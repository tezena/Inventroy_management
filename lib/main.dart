import 'dart:js';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: MySlider(),
      ),
    );
  }
}

class MySlider extends StatelessWidget {
     const MySlider({super.key});

@override
  Widget build(context){
     return CarouselSlider(
    items: [1, 2, 3, 4, 5]
        .map((i) => Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child:  Center(child:Text("number $i")),
            ))
        .toList(),
    options: CarouselOptions(height: 24),
  );

  }
 
}
