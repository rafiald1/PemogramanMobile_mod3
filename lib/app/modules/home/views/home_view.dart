import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum_mod_1/app/routes/app_pages.dart';
import 'package:praktikum_mod_1/app/login/controllers/login_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang lokal menggunakan BoxDecoration
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cover2.jpg'),
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
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.LOGIN);
                          },
                          child: const Text('Masuk'),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Belum memiliki akun?'),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Daftar'),
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
