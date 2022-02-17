import 'package:flutter/material.dart';

class CustomScrollDemo extends StatefulWidget {
  const CustomScrollDemo({Key? key}) : super(key: key);

  @override
  _CustomScrollDemoState createState() => _CustomScrollDemoState();
}

class _CustomScrollDemoState extends State<CustomScrollDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomScrollView"),
      ),
      body: CustomScrollView(
        slivers: [],
      ),
    );
  }
}
