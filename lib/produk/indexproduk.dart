import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lat_kasirflutter/produk/insertproduk.dart';
import 'package:lat_kasirflutter/produk/updateproduk.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class dinaproduk extends StatefulWidget {
  const dinaproduk({super.key});

  @override
  State<dinaproduk> createState() => _dinaprodukState();
}

class _dinaprodukState extends State<dinaproduk> {
  List<Map<String, dynamic>> produk = [];
  List<Map<String, dynamic>> cart = []; //keranjang
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchProduk();
  }

  Future<void> fetchProduk() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await Supabase.instance.client.from('produk').select();
      setState(() {
        produk = List<Map<String, dynamic>>.from(response);
        isLoading = false;
      });
    } catch (e) {
      print('error fetching produk: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> deleteProduk(int id) async {
    try {
      await Supabase.instance.client.from('produk').delete().eq('Produkid', id);
      fetchProduk();
    } catch (e) {
      print('error deleting produk: $e');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: LoadingAnimationWidget.twoRotatingArc(
                    color: Colors.grey, size: 30),
              )
            : produk.isEmpty
                ? Center(
                    child: Text(
                      'tidak ada produk',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.8),
                    padding: EdgeInsets.all(8),
                    itemCount: produk.length,
                    itemBuilder: (context, index) {
                      final prd = produk[index];
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(prd['NamaProduk'] ?? 'Nama Tidak Tersedia',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              SizedBox(height: 4),
                              Text(
                                prd['Harga'] != null
                                    ? prd['Harga'].toString()
                                    : 'Harga Tidak Tersedia',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                prd['Stok'] != null
                                    ? prd['Stok'].toString()
                                    : 'Stok Tidak Tersedia',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                ),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blueAccent),
                                    onPressed: () {
                                      final Produkid = prd['Produkid'] ??
                                          0; // Pastikan ini sesuai dengan kolom di database
                                      if (Produkid != 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    updateproduk(
                                                        Produkid: Produkid)));
                                      } else {
                                        print('ID produk tidak valid');
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.redAccent),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Hapus Produk'),
                                            content: const Text(
                                                'Apakah Anda yakin ingin menghapus produk ini?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text('Batal'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  deleteProduk(prd['Produkid']);
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
                                  IconButton(
                                    icon: const Icon(
                                        Icons.add_shopping_cart_rounded,
                                        color: Colors.green),
                                    onPressed: () {},
                                  )
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
                  MaterialPageRoute(builder: (context) => addproduk()));
            },
            child: Icon(
              Icons.add,
              color: Colors.pink[300],
            )));
  }
}
