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
      children: const [PositionDemo1(), PositionDemo2()],
    );
    // return PositionDemo2();
  }
}

class PositionDemo2 extends StatelessWidget {
  const PositionDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (cxt, cons) {
      // print(cons);
      return Container(
        color: Colors.green,
        // height: 200,
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (cxt, co) {
                print(co);
                return Container(
                  color: Colors.blue,
                  height: 200,
                );
              },
            ),
            Container(
              color: Colors.blueGrey,
              width: 100,
              height: 200,
            ),
            Positioned(
              left: 0,
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            // Container(color:Colors.purple ,height: 100,)
          ],
        ),
      );
    });
  }
}

class PositionDemo1 extends StatelessWidget {
  const PositionDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
