import 'package:flutter/material.dart';
import 'package:flutter_study1/LoginWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Henry Store'),
      ),
      body: const LoginWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '비즈니스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '학교',
          ),
        ],
      ),
    );
  }
}
