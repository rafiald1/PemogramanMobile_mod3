import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    if (!email.contains('@')) {
      Get.snackbar('Error', 'Email tidak valid');
      return;
    }

    if (password.length < 8) {
      Get.snackbar('Error', 'Password harus minimal 8 karakter');
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('Success', 'Akun berhasil dibuat');
      Get.toNamed('/home'); // Arahkan ke halaman home saat registrasi berhasil
    } catch (e) {
      Get.snackbar('Error', 'akun sudah terdaftar');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Success', 'Login berhasil');
      Get.toNamed('/home'); // Arahkan ke halaman home saat login berhasil
    } catch (e) {
      Get.snackbar('Error', 'Email atau Password salah!');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.snackbar('Success', 'Logout berhasil');
  }
}
