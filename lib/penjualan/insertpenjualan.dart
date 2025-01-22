import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:lat_kasirflutter/home.dart';

class insertpenjualan extends StatefulWidget {
  const insertpenjualan({super.key});

  @override
  State<insertpenjualan> createState() => _insertpenjualanState();
}

class _insertpenjualanState extends State<insertpenjualan> {

  final _formKey = GlobalKey<FormState>();
  final _tglpenjualan = TextEditingController();
  final _totalhrg = TextEditingController();
  final _pelangganid = TextEditingController();

  Future<void> AddPenjualan() async {
    if (_formKey.currentState!.validate()) {
      final String TanggalPenjualan = _tglpenjualan.text;
      final String TotalHarga = _totalhrg.text;
      final String Pelangganid = _pelangganid.text;

      final response = await Supabase.instance.client.from('pelanggan').insert([
        {
          'TanggalPenjualan': TanggalPenjualan,
          'TotalHarga': TotalHarga,
          'Pelangganid': Pelangganid,
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
                controller: _tglpenjualan,
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
                controller: _totalhrg,
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
                controller: _pelangganid,
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
                onPressed: AddPenjualan,
                child: const Text('Tambah'),
              ),  
            ],
          ),
        )
      ),
    );
  }
}