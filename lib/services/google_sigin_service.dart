import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  static Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount account = await _googleSignIn.signIn();
      print(account);
      return account;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
