import 'package:flutter/material.dart';

import 'FirstPage.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  //Navigation Bar Index
  int _bottomNavigationBarIndex = 0;

  AppBar _buildAppBar() {
    switch (_bottomNavigationBarIndex) {
      case 0:
        return AppBar(
          title: const Text('홈'),
          backgroundColor: Colors.blueAccent,
        );
      case 1:
        return AppBar(
          title: const Text('상품'),
          backgroundColor: Colors.greenAccent,
        );
      case 2:
        return AppBar(
          title: const Text('장바구니'),
          backgroundColor: Colors.redAccent,
        );
      default:
        return AppBar(
          title: const Text('홈'),
          backgroundColor: Colors.blueAccent,
        );
    }
  }

  Widget _buildBody() {
    switch (_bottomNavigationBarIndex) {
      case 0:
        return const FirstPage();
      case 1:
        return const Center(child: Text('상품 목록'));
      case 2:
        return const Center(child: Text('장바구니 목록'));
      default:
        return const Center(child: Text('홈 화면'));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _bottomNavigationBarIndex = index;
            print('bottomNavi: $_bottomNavigationBarIndex');
          });
        },

        items: const [
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
