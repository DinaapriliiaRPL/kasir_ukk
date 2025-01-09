import 'package:flutter/material.dart';
import 'home.dart';

class signpage extends StatefulWidget {
  const signpage({super.key});

  @override
  State<signpage> createState() => signpageState();
}

class signpageState extends State<signpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text("D'Qasir"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left), // Ganti ikon panah menjadi '<'
          onPressed: () {
            Navigator.pop(context, true); // Fungsi untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Masukkan Nama Anda',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Nomor Whatshapp',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true, //agar pasword titik titik
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Masukkan kata sandi ',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
