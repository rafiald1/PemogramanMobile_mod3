import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum_mod_1/app/modules/login/controllers/auth_controller.dart';

class RegisterView extends StatelessWidget {
  final AuthController controller = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/cover2.jpg'), // Ganti dengan nama gambar latar belakang yang Anda miliki
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten utama
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height:
                        80.0), // Spasi untuk memberi jarak antara atas dan konten

                // Kotak input dengan judul
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.8), // Transparansi pada kotak input
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul Halaman
                      Text(
                        'Daftar Akun',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800], // Warna teks judul
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0), // Spasi setelah judul

                      // Input Email
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Input Password
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(height: 24.0),
                      // Tombol Daftar
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0), // Padding tombol
                            backgroundColor: Colors.green[600], // Warna tombol
                          ),
                          onPressed: () async {
                            // Panggil fungsi register dan tunggu hasilnya
                            await controller.register(
                                emailController.text, passwordController.text);
                          },
                          child: Text(
                            'Daftar',
                            style: TextStyle(
                                color: Colors.white), // Warna teks tombol
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Tombol Kembali
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sudah punya akun?'),
                          TextButton(
                            onPressed: () {
                              Get.back(); // Kembali ke halaman login
                            },
                            child: Text('Masuk'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
