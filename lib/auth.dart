import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> get getUser => _firebaseAuth.currentUser();

  Future<FirebaseUser> googleSignin() async {
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      FirebaseUser user =
          (await _firebaseAuth.signInWithCredential(credential)).user;

      return user;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<FirebaseUser> anonSignIn() async {
    FirebaseUser user = (await _firebaseAuth.signInAnonymously()).user;
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
