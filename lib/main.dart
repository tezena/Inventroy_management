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

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> carouselItems = [
      Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(107, 59, 225,1)
        ),
        child:const Column(
          children: [
            Text("Lorem ipsum dolor sit amet." ,
            style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
            Text("Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style:TextStyle(fontSize: 12)),
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(107, 59, 225,1),
        ),
        child:const Center(child: Text("Widget 2")),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color:  Color.fromRGBO(107, 59, 225,1),
        ),
        child:const  Center(child: Text("Widget 3")),
      ),
      // Add more widgets here
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                    height: 180,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentSlide = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: 12.0,
                  right: 40.0,
                  child: CarouselStatus(
                    itemCount: carouselItems.length,
                    currentSlide: _currentSlide,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselStatus extends StatelessWidget {
  final int itemCount;
  final int currentSlide;

  CarouselStatus({required this.itemCount, required this.currentSlide});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < itemCount; index++)
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentSlide == index ? Color.fromARGB(255, 30, 69, 224) : Colors.white,
            ),
          ),
      ],
    );
  }
}