import 'package:flutter/material.dart';
import 'package:lat_kasirflutter/home.dart';
import 'package:lat_kasirflutter/pelanggan/insertpelanggan.dart';
import 'package:lat_kasirflutter/produk/insertproduk.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'updatepelanggan.dart';

class indexpage extends StatefulWidget {
  const indexpage({super.key});

  @override
  State<indexpage> createState() => _indexpageState();
}

class _indexpageState extends State<indexpage> {
  //buat variabel untuk menyimpan daftar pelanggan
  List<Map<String, dynamic>> pelanggan = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPelanggan();
  }

  //fungsi untuk mengambil data pelanggan dari supabase
  Future<void> fetchPelanggan() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response =
          await Supabase.instance.client.from('pelanggan').select();
      setState(() {
        pelanggan = List<Map<String, dynamic>>.from(response);
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching pelanggan: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> deletePelanggan(int id) async {
    try {
      await Supabase.instance.client
          .from('pelanggan')
          .delete()
          .eq('Pelangganid', id);
      fetchPelanggan();
    } catch (e) {
      print('Error deleting pelanggan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
      ? Center(
              child: LoadingAnimationWidget.twoRotatingArc(
                  color: const Color.fromARGB(255, 240, 194, 209), size: 30),
            )
          : pelanggan.isEmpty
          ? Center(
              child: Text(
                'Tidak ada pelanggan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8
                ),
                padding: EdgeInsets.all(8),
                itemCount: pelanggan.length,
                itemBuilder: (context, index) {
                  final langgan = pelanggan[index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              langgan['NamaPelanggan'] ??'Pelanggan tidak tersedia',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              langgan['Alamat'] ?? 'Alamat Tidak tersedia',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              langgan['NomorTelepon'] ?? 'Tidak tersedia',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blueAccent
                                  ),
                                  onPressed: () {
                                    final Pelangganid = langgan['Pelangganid'] ??0; // Pastikan ini sesuai dengan kolom di database
                                    if (Pelangganid != 0) {
                                      Navigator.push(
                                        context,MaterialPageRoute(
                                          builder: (context) => updatepage(
                                          Pelangganid: Pelangganid)
                                        )
                                      );
                                    } else {
                                      print('ID pelanggan tidak valid');
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.redAccent
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Hapus Pelanggan'),
                                          content: const Text(
                                              'Apakah Anda yakin ingin menghapus pelanggan ini?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Batal'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                deletePelanggan(
                                                    langgan['Pelangganid']);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Hapus'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => insertpage()
                  )
                );
            },
            child: Icon(Icons.add, color: Colors.pink[300],)));
    
  }
}
