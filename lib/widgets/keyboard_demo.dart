import 'package:flutter/material.dart';

class KeyboardDemo extends StatefulWidget {
  const KeyboardDemo({Key? key}) : super(key: key);

  @override
  State<KeyboardDemo> createState() => _KeyboardDemoState();
}

class _KeyboardDemoState extends State<KeyboardDemo> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("键盘遮挡"),
      ),
      //防止键盘遮挡
      resizeToAvoidBottomInset: true,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "请输入内容",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.green, width: 3)),
          ),
          style: TextStyle(fontSize: 15, color: Colors.red),
        ),
      ),
    );
  }
}
