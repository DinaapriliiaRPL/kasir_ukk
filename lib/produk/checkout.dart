import 'package:flutter/material.dart';

class COpage extends StatefulWidget {
  const COpage({super.key});

  @override
  State<COpage> createState() => _COpageState();
}

class _COpageState extends State<COpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        centerTitle: true,
        title: Text('Checkout', style: TextStyle())
      ),
    );
  }
}