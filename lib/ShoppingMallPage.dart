import 'package:flutter/cupertino.dart';

class ShoppingMallPage extends StatelessWidget {
  const ShoppingMallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('쇼핑몰 홈페이지'),
        const SizedBox(height: 20.0),
        CupertinoButton(
          child: const Text('상품 목록'),
          onPressed: () {
            // Navigate to the product list page
          },
        ),
        const SizedBox(height: 20.0),
        CupertinoButton(
          child: const Text('장바구니'),
          onPressed: () {
            // Navigate to the shopping cart page
          },
        ),
      ],
    );
  }
}
