import 'package:flutter/material.dart';

class ListViewHeightDemo extends StatelessWidget {
  const ListViewHeightDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("根据内容撑开"),
      ),
      body: Container(
        color: Colors.red,
        child: ListView.builder(
            itemExtent: 60,
            itemCount: 3,
            padding: EdgeInsets.zero,
            //这个属性设置为true 高度会根据内容变化
            shrinkWrap: true,
            itemBuilder: (cxt, index) {
              return InkWell(
                child: ListTile(
                  title: Text("这是第$index行"),
                ),
              );
            }),
      ),
    );
  }
}
