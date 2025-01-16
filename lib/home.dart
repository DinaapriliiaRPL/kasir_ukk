import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lat_kasirflutter/login.dart';
import 'package:lat_kasirflutter/pelanggan/indexpelanggan.dart';
import 'package:lat_kasirflutter/pelanggan/insertpelanggan.dart';
import 'package:lat_kasirflutter/produk/indexproduk.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                    icon: Icon(Icons.people, color: Colors.white),
                    child: Text('Customer')),
                Tab(
                    icon: Icon(Icons.inventory, color: Colors.white),
                    child: Text('Produk')),
                Tab(
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    child: Text('Penjualan'))
              ],
            ),
            backgroundColor: Colors.pink[300],
            title: const Text('Informasi Kasirku'),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                  Icons.chevron_left), // Ganti ikon panah menjadi '<'
              onPressed: () {
                Navigator.pop(context,
                    true); // Fungsi untuk kembali ke halaman sebelumnya
              },
            ),
          ),
          // drawer: Drawer(
          //   child: ListView(
          //     padding: EdgeInsets.zero,
          //     children: <Widget>[
          //       DrawerHeader(
          //         decoration: BoxDecoration(
          //           color: Colors.black,
          //         ),
          //         child: Text(
          //           'Menu',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 24,
          //           ),
          //         ),
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.home),
          //         title: Text('Beranda'),
          //         onTap: () {
          //           Navigator.pop(context);
          //         },
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.arrow_back),
          //         title: Text('Logout'),
          //         onTap: () {
          //           Navigator.pop(context, MaterialPageRoute(builder: (context )=> loginpage()));
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          body: TabBarView(
            children: [
              indexpage(),
              dinaproduk(),
              Center(child: Text('Penjualan')),
            ],
          ),
        ));
  }
}
