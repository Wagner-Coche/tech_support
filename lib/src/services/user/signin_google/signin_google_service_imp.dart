import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:e_support/src/services/user/signin_google/signin_google_service.dart';

class SignInGoogleServiceImp implements SignInGoogleService {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;  
  GoogleSignInAccount? get user => _user;

  @override
  Future<UserCredential?> loginUserWithGoogle() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;
    _user = googleUser;

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    UserCredential userCredential = await auth.signInWithCredential(googleCredential);
    return userCredential;
  }
  
}