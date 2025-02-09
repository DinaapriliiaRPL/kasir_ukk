import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lat_kasirflutter/detailpenjualan/indexdetail.dart';
import 'package:lat_kasirflutter/login.dart';
import 'package:lat_kasirflutter/main.dart';
import 'package:lat_kasirflutter/pelanggan/indexpelanggan.dart';
import 'package:lat_kasirflutter/pelanggan/insertpelanggan.dart';
import 'package:lat_kasirflutter/penjualan/indexpenjualan.dart';
import 'package:lat_kasirflutter/produk/indexproduk.dart';
import 'package:lat_kasirflutter/registrasi/indexuser.dart';
import 'package:lat_kasirflutter/registrasi/sign.dart';

class homepage extends StatefulWidget {
  final cart;
  const homepage({super.key, this.cart});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // GlobalKey untuk Scaffold agar dapat membuka drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey, // Set key untuk Scaffold
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.inventory, color: Colors.white),
                child: Text('Produk',
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
              Tab(
                icon: Icon(Icons.people, color: Colors.white),
                child: Text('Pelanggan',
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
              Tab(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                child: Text('Penjualan',
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
              Tab(
                icon: Icon(Icons.account_balance_wallet, color: Colors.white),
                child: Text('Detail Penjualan',
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
            ],
            // labelColor: Colors.red,
          ),
          backgroundColor: Colors.pink[300],
          foregroundColor: Colors.white,
          title: const Text("D'Qasir"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu), // Ikon menu untuk membuka drawer
            onPressed: () {
              _scaffoldKey.currentState
                  ?.openDrawer(); // Membuka drawer menggunakan key
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pink[300],
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Beranda'),
                onTap: () {
                  Navigator.pop(context); // Menutup drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.app_registration),
                title: Text('Registrasi'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => userpage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  ); // Navigasi ke halaman awal
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [dinaproduk(), indexpage(), indexpenjualan(), detailpage()],
        ),
      ),
    );
  }
}
