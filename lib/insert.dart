import 'package:flutter/material.dart';
import 'home.dart';

class insertpage extends StatefulWidget {
  const insertpage({super.key});

  @override
  State<insertpage> createState() => _insertpageState();
}

class _insertpageState extends State<insertpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController stokController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text('Tambah Data'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left), // Ganti ikon panah menjadi '<'
          onPressed: () {
            Navigator.pop(
                context, true); // Fungsi untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: Column(children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: hargaController,
              decoration: const InputDecoration(labelText: 'Penulis'),
            ),
            TextField(
              controller: stokController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
          ]
          
        )
      )
      
      ),
    );
  }
}
