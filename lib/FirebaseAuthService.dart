import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

//Print log messages to the console
final Logger logger = Logger();

//로그인, 회원가입, 비밀번호 찾기 등의 기능을 제공하는 클래스
class FirebaseAuthService {
  //Firebase 인증 서비스를 사용하기 위한 인스턴스 생성
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //회원가입 함수
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        logger.e('비밀번호가 취약 합니다.');
      } else if (e.code == 'email-already-in-use') {
        logger.e('이미 사용중인 이메일 입니다.');
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  //로그인 함수
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger.e('사용자를 찾을 수 없습니다.');
      } else if (e.code == 'wrong-password') {
        logger.e('비밀번호가 틀렸습니다.');
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }
}
