// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'insertpenjualan.dart';
// import 'updatepenjualan.dart';

// class indexpenjualan extends StatefulWidget {
//   const indexpenjualan({super.key});

//   @override
//   State<indexpenjualan> createState() => _indexpenjualanState();
// }

// class _indexpenjualanState extends State<indexpenjualan> {

//  List<Map<String, dynamic>> penjualan = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchPenjualan();
//   }

//   //fungsi untuk mengambil data penjualan dari supabase
//   Future<void> fetchPenjualan() async {
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       final response =
//           await Supabase.instance.client.from('penjualan').select();
//       setState(() {
//         penjualan = List<Map<String, dynamic>>.from(response);
//         isLoading = false;
//       });
//     } catch (e) {
//       print('Error fetching penjualan: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   Future<void> deletePenjualan(int id) async {
//     try {
//       await Supabase.instance.client
//         .from('penjualan')
//         .delete()
//         .eq('Penjualanid', id);
//       fetchPenjualan();
//     } catch (e) {
//       print('Error deleting penjualan: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: isLoading
//       ? Center(
//         child: LoadingAnimationWidget.twoRotatingArc(color: const Color.fromARGB(255, 240, 194, 209), size: 30),
//       )
//       : penjualan.isEmpty
//       ? Center(
//         child: Text(
//           'Tidak ada penjualan',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       )
//       : GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 12,
//           childAspectRatio: 0.8
//         ),
//         padding: EdgeInsets.all(8),
//         itemCount: penjualan.length,
//         itemBuilder: (context, index) {
//           final jual = penjualan[index];
//           return Card(
//             elevation: 4,
//             margin: EdgeInsets.symmetric(vertical: 8),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12)
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     jual['TanggalPenjualan'] ??'Penjualan tidak tersedia',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     jual['Alamat'] ?? 'Alamat Tidak tersedia',
//                     style: TextStyle(
//                       fontStyle: FontStyle.italic,
//                       fontSize: 16,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     jual['NomorTelepon'] ?? 'Tidak tersedia',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                     textAlign: TextAlign.justify,
//                   ),
//                   const Divider(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.edit,color: Colors.blueAccent),
//                         onPressed: () {
//                           final Penjualanid = jual['Penjualanid'] ??0; // Pastikan ini sesuai dengan kolom di database
//                             if (Penjualanid != 0) {
//                               Navigator.push(
//                                 context,MaterialPageRoute(
//                                   builder: (context) => updatepenjualan(Penjualanid: Penjualanid)
//                                 )
//                               );
//                             } else {
//                               print('ID penjualan tidak valid');
//                             }
//                         },
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.redAccent),
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: const Text('Hapus Penjualan'),
//                                 content: const Text('Apakah Anda yakin ingin menghapus penjualan ini?'),
//                                 actions: [
//                                   TextButton(onPressed: () => Navigator.pop(context),
//                                   child: const Text('Batal')
//                                   ),
//                                   TextButton(onPressed: () {
//                                     deletePenjualan(jual['Penjualanid']);
//                                     Navigator.pop(context);
//                                   },
//                                   child: const Text('Hapus'),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => insertpenjualan())
//           );
//         },
//         child: Icon(Icons.add, color: Colors.pink[300],)
//       )
//     );
//   }
// }
