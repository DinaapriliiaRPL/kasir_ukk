import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:lat_kasirflutter/penjualan/checkout.dart';

class indexpenjualan extends StatefulWidget {
  const indexpenjualan({super.key});

  @override
  State<indexpenjualan> createState() => _indexpenjualanState();
}

class _indexpenjualanState extends State<indexpenjualan> {
  List<Map<String, dynamic>> penjualan = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPenjualan();
  }

  Future<void> fetchPenjualan() async {
    // setState(() {
    //   isLoading = true;
    // });
    try {
      final response = await Supabase.instance.client
          .from('penjualan')
          .select('*, pelanggan(*)');
      setState(() {
        penjualan = List<Map<String, dynamic>>.from(response);
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching penjualan: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> deletePenjualan(int id) async {
    try {
      await Supabase.instance.client
          .from('penjualan')
          .delete()
          .eq('Penjualanid', id);
      fetchPenjualan();
    } catch (e) {
      print('Error deleting penjualan: $e');
    }

    // try {
    //   var cekdetail =
    // await Supabase.instance.client
    //       .from('detailpenjualan')
    //       .select('Detailid')
    //       .eq('Penjualaid', id);
    //   if (cekdetail.isEmpty) {
    //     await Supabase.instance.client
    //         .from('penjualan')
    //         .delete()
    //         .eq('Penjualanid', id);
    //     fetchPenjualan();
    //   } else {
    //     await Supabase.instance.client
    //         .from('detailpenjualan')
    //         .delete()
    //         .eq('Penjualaid', id);
    //     await Supabase.instance.client
    //         .from('penjualan')
    //         .delete()
    //         .eq('Penjualanid', id);
    //     fetchPenjualan();
    //   }
    // } catch (e) {
    //   print('Error deleting penjualan: $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // isLoading
          //     ? Center(child: CircularProgressIndicator())
          ListView.builder(
        itemCount: penjualan.length,
        itemBuilder: (context, index) {
          final item = penjualan[index];
          return ListTile(
            title: Text(item['pelanggan']['NamaPelanggan']),
            subtitle: Text('Total harga: ${item['TotalHarga']}'),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Hapus Pelanggan'),
                        content: const Text(
                            'Apakah anda yakin ingin menghapus data penjualan ini?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () {
                              deletePenjualan(item['Penjualanid']);
                              Navigator.pop(context);
                              setState(() {
                                penjualan.removeAt(index);
                              });
                            },
                            child: const Text('Hapus'),
                          )
                        ],
                      );
                    });
              },
              // onPressed: () => deletePenjualan(item['Penjualanid']
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var sales = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => COpage()),
          );

          if (sales == true) {
            fetchPenjualan();
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.pink[300],
        ),
      ),
    );
  }
}
