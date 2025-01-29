import 'package:flutter/material.dart';
import 'package:lat_kasirflutter/registrasi/sign.dart';

class userpage extends StatefulWidget {
  const userpage({super.key});

  @override
  State<userpage> createState() => _userpageState();
}

class _userpageState extends State<userpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text("User D'Qasir"),
        centerTitle: true,
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => signpage())
          );
        },
        child: Icon(Icons.add, color: Colors.pink[300],)
      )
    );
  }
}
