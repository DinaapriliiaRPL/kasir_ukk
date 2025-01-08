import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text('Informasi Kasirku'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left), // Ganti ikon panah menjadi '<'
          onPressed: () {
            Navigator.pop(
              context, true
            ); // Fungsi untuk kembali ke halaman sebelumnya
          },
        ),
      ),
    );
  }
}