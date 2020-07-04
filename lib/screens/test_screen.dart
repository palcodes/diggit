import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 150, left: 10),
        height: 180,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [for (int i = 0; i < 15; i++) Component()],
        ),
      ),
    );
  }
}

class Component extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      width: 270,
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(blurRadius: 12, color: Colors.grey[50], spreadRadius: 12)
          ]),
    );
  }
}
