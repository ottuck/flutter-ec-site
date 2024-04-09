import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  final _images = [
    "assets/images/1.jpg",
  ];

 @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text('첫 번째 페이지'),
      ],
    );
  }
}
