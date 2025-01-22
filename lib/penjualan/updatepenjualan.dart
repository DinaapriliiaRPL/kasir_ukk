// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class updatepenjualan extends StatefulWidget {
//   const updatepenjualan({super.key});

//   @override
//   State<updatepenjualan> createState() => _updatepenjualanState();
// }

// class _updatepenjualanState extends State<updatepenjualan> {
//     final _tglpenjualan = TextEditingController();
//   final _totalhrg = TextEditingController();
//   final _pelangganid = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     _loadPenjualanData();
//   }

//   // Fungsi untuk memuat data pelanggan berdasarkan ID
//   Future<void> _loadPenjualanData() async {
//     final data = await Supabase.instance.client
//       .from('penjualan')
//       .select()
//       .eq('Penjualanid', widget.Penjualanid)
//       .single();

//     setState(() {
//       _tglpenjualan.text = data['TanggalPenjualan'] ?? '';
//       _totalhrg.text = data['TotalHarga'] ?? '';
//       _pelangganid.text = data['Pelangganid'] ?? '';
//     });
//   }

// // EditPenjualan.dart
//   Future<void> updatePenjualan() async {
//     if (_formKey.currentState!.validate()) {
//       // Melakukan update data pelanggan ke database
//       await Supabase.instance.client.from('penjualan').update({
//         'TanggalPenjualan': _tglpenjualan.text,
//         'TotalHarga': _totalhrg.text,
//         'Pelangganid': _pelangganid.text,
//       }).eq('Penjualanid', widget.Penjualanid);

//       // Navigasi ke PelangganTab setelah update, dengan menghapus semua halaman sebelumnya dari stack
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => homepage()),
//         (route) => false, // Hapus semua halaman sebelumnya
//       );
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }