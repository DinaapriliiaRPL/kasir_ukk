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
    return DefaultTabController(length: 4, child: 
     Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.people, color: Colors.white), child: Text('Customer')),
          Tab(icon: Icon(Icons.inventory, color: Colors.white), child: Text('Produk')),
          Tab(icon: Icon(Icons.shopping_cart, color: Colors.white), child: Text('Penjualan'))
        ],),
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
      body: TabBarView(
        children: [
          Center(child: Text ('Customer')),
          Center(child: Text('Produk')),
          Center(child: Text('Penjualan')),
        ],
      ),
    ));
  }
}