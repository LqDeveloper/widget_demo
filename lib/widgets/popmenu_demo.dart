import 'package:flutter/material.dart';

class PopMenuDemo extends StatelessWidget {
  final _title = ["选项1", "选项2", "选项3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹窗按钮"),
      ),
      body: Center(
        child: PopupMenuButton(
          offset: const Offset(50, 30),
          color: Colors.green,
          child: const Text("弹窗"),
          elevation: 1,
          itemBuilder: (cxt) {
            return _title
                .map((e) => PopupMenuItem(
                      child: Text(e),
                      value: e,
                    ))
                .toList();
          },
          onSelected: (e) {},
          onCanceled: () => print("onCanceled"),
        ),
      ),
    );
  }
}
