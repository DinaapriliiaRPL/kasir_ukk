import 'package:flutter/material.dart';
import '../home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class insertpage extends StatefulWidget {
  const insertpage({super.key});

  @override
  State<insertpage> createState() => _insertpageState();
}

class _insertpageState extends State<insertpage> {
  final _formKey = GlobalKey<FormState>();
  final _namapelanggan = TextEditingController();
  final _alamat = TextEditingController();
  final _notlp = TextEditingController();

  Future<void> AddPelanggan() async {
    if (_formKey.currentState!.validate()) {
      final String NamaPelanggan = _namapelanggan.text;
      final String Alamat = _alamat.text;
      final String NomorTelepon = _notlp.text;

      final response = await Supabase.instance.client.from('pelanggan').insert([
        {
          'NamaPelanggan': NamaPelanggan,
          'Alamat': Alamat,
          'NomorTelepon': NomorTelepon,
        }
      ]);

      // Cek jika ada error pada response
      if (response != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => homepage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => homepage()),
        );
      }
    }
  }

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _namapelanggan,
                decoration: const InputDecoration(
                  labelText: 'Nama Pelanggan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(  
                controller: _alamat,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notlp,
                decoration: const InputDecoration(
                  labelText: 'Nomer Telepon',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomer tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: AddPelanggan,
                child: const Text('Tambah'),
              ),  
            ],
          ),
        )
      ),
    );
  }
}
