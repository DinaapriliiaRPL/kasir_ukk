import 'package:flutter/material.dart';
import 'package:lat_kasirflutter/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class updateproduk extends StatefulWidget {
  final int Produkid;
  const updateproduk({super.key, required this.Produkid});

  @override
  State<updateproduk> createState() => _updateprodukState();
}

class _updateprodukState extends State<updateproduk> {
  
  final _nmproduk = TextEditingController();
  final _harga = TextEditingController();
  final _stok = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  
  @override
  void initState() {
    super.initState();
    _loadProdukData();
  }

  // Fungsi untuk memuat data pelanggan berdasarkan ID
  Future<void> _loadProdukData() async {
    final data = await Supabase.instance.client
        .from('produk')
        .select()
        .eq('Produkid', widget.Produkid)
        .single();

    setState(() {
      _nmproduk.text = data['NamaProduk'] ?? '';
      _harga.text = data['Harga'] ?? '';
      _harga.text = data['Stok'] ?? '';
    });
  }

  // EditPelanggan.dart
  Future<void> updateProduk() async {
    if (_formKey.currentState!.validate()) {
      // Melakukan update data pelanggan ke database
      await Supabase.instance.client.from('produk').update({
        'NamaProduk': _nmproduk.text,
        'Harga': _harga.text,
        'Stok': _stok.text,
      }).eq('Produkid', widget.Produkid);

      // Navigasi ke PelangganTab setelah update, dengan menghapus semua halaman sebelumnya dari stack
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => homepage()),
        (route) => false, // Hapus semua halaman sebelumnya
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nmproduk,
                decoration: const InputDecoration(
                  labelText: 'Nama Produk',
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
                controller: _harga,
                decoration: const InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _stok,
                decoration: const InputDecoration(
                  labelText: 'Stok',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Stok telepon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: updateProduk,
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
