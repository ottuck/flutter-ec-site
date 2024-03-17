import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:32.0),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '이메일',
                    hintText: '이메일을 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '이메일',
                    hintText: '이메일을 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '이메일',
                    hintText: '이메일을 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '이메일',
                    hintText: '이메일을 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ElevatedButton(onPressed: null, child: Text('회원가입'))
          ],
        )),
      ),
    );
  }
}