import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_support/src/services/user/sign_out/sign_out_service.dart';

class SignOutServiceImp implements SignOutService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> signOut() async {
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}