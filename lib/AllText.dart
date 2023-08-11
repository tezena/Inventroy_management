import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 15),
      child: (Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            "200",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Total",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          )
        ],
      )),
    );
  }
}

class Vdivider extends StatelessWidget {
  const Vdivider({super.key});
  @override
  Widget build(context) {
    return const SizedBox(
        width: 5,
        height: 65,
        child: VerticalDivider(
            width: 1,
            thickness: 1,
            indent: 15,
            endIndent: 5,
            color: Colors.white));
  }
}

class HeroSec extends StatelessWidget {
  const HeroSec({super.key});
  @override
  Widget build(context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Today",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w200),
              ),
              SizedBox(
                width: 15,
              ),
              Text("Aug 10",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w200))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Info(),
              Vdivider(),
              Info(),
              Vdivider(),
              Info()
            ],
          )
        ],
      ),
    ));
  }
}
