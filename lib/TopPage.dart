import 'package:flutter/material.dart';
import 'FirstPage.dart';
import 'LoginWidget.dart';

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
          title: const Text('Home'),
          backgroundColor: Colors.blueAccent,
        );
      case 1:
        return AppBar(
          title: const Text('Product'),
          backgroundColor: Colors.blueAccent,
        );
      case 2:
        return AppBar(
          title: const Text('LogIn'),
          backgroundColor: Colors.blueAccent,
        );
      default:
        return AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.blueAccent,
        );
    }
  }

  //바텀 네비게이션바 인덱스에 따라 화면을 변경
  Widget _buildBody() {
    switch (_bottomNavigationBarIndex) {
      case 0:
        return const FirstPage();
      case 1:
        return const Center(child: Text('Product page'));
      case 2:
        return const LoginWidget();
      default:
        return const FirstPage();
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'LogIn',
          ),
    ],
    ),
    );
  }
}
