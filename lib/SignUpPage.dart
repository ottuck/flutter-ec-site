import 'package:flutter/material.dart';
import 'package:flutter_study1/FirebaseAuthService.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('회원가입'),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '이메일',
                    hintText: '이메일을 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return '유효한 이메일을 입력하세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '비밀번호',
                    hintText: '비밀번호를 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return '비밀번호는 6자 이상이어야 합니다.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final signUpData = await _authService.signUpWithEmailAndPassword(
                          _emailController.text, _passwordController.text);
                      if(signUpData != null && context.mounted) {
                        logger.e('회원가입 성공');
                        Navigator.pop(context);
                      } else {
                        logger.e('회원가입 실패');
                      }
                    } catch (e) {
                      logger.e('회원가입 데이터가 들어 오지 않음: $e');
                    }
                  },
                  child: const Text('회원가입'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
