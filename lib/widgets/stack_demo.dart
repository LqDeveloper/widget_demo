import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
      ),
      body: const StackBody(),
    );
  }
}

class StackBody extends StatelessWidget {
  const StackBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 300,
          color: Colors.yellow,
          child: Stack(
            //用来设置默认的对齐方式
            alignment: Alignment.center,
            children: [
              Positioned(
                  left: 10,
                  child: Container(
                    color: Colors.red,
                    width: 100,
                    height: 40,
                  )),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 40,
                ),
              ),
              Positioned(
                right: 10,
                  child: Container(
                color: Colors.blue,
                width: 100,
                height: 40,
              ))
            ],
          ),
        )
      ],
    );
  }
}
