import 'package:flutter/material.dart';
import 'package:flutter_study1/SignUpPage.dart';
import 'package:flutter_study1/FirebaseAuthService.dart';
import 'package:logger/logger.dart';
import 'ShoppingMallPage.dart';

//Print log messages to the console
final Logger logger = Logger();

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthService _authService = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('로그인'),
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
                obscureText: true,
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) { // 폼의 유효성을 검증
                    _authService.signInWithEmailAndPassword(
                        _emailController.text, _passwordController.text)
                        .then((user) {
                      if (user != null) {
                        logger.e('로그인 성공');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShoppingMallPage()));
                      } else {
                        logger.e('로그인 실패');
                      }
                    });
                  }
                },
                child: const Text('로그인'),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                child: const Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
