import 'package:flutter/material.dart';

class ShoppingMallPage extends StatelessWidget {
  const ShoppingMallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('쇼핑몰 A'),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // 쇼핑몰 A의 상품 목록 페이지로 이동
            },
            child: const Text('상품 목록'),
          ),
        ],
    );
  }
}
