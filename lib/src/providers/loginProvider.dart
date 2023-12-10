import 'package:firebase_auth/firebase_auth.dart';

class LoginProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Función para iniciar sesión con correo y contraseña y obtener el token
  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        String token = await user.getIdToken().toString();
        return {'ok': true, 'token': token};
      } else {
        return {'ok': false, 'error': 'Usuario nulo después del inicio de sesión'};
      }
    } on FirebaseAuthException catch (e) {
      return {'ok': false, 'error': e.message};
    }
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
