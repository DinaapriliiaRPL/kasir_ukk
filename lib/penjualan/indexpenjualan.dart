// import 'package:flutter/material.dart';

// class indexpenjualan extends StatefulWidget {
//   final cart;

//   const indexpenjualan({this.cart});

//   @override
//   State<indexpenjualan> createState() => _indexpenjualanState();
// }

// class _indexpenjualanState extends State<indexpenjualan> {
//   double get totalHarga {
//     return widget.cart.fold(
//       0,
//       (sum, item) => sum + double.parse(item['Harga'].toString()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:lat_kasirflutter/produk/checkout.dart';

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
    setState(() {
      isLoading = true;
    });
    try {
      final response = await Supabase.instance.client.from('penjualan').select();
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
      await Supabase.instance.client.from('penjualan').delete().eq('Penjualanid', id);
      fetchPenjualan();
    } catch (e) {
      print('Error deleting penjualan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: penjualan.length,
              itemBuilder: (context, index) {
                final item = penjualan[index];
                return ListTile(
                  title: Text(item['NamaPenjualan']),
                  subtitle: Text('Jumlah: ${item['jumlah']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deletePenjualan(item['Penjualanid']),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => COpage()),
          );
        },
        child: Icon(Icons.add, color: Colors.pink[300],),
      ),
    );
  }
}
