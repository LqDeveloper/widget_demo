import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text"),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text.rich(TextSpan(children: [
                  WidgetSpan(child: Icon(Icons.star)),
                  TextSpan(
                      text: "haha",
                      style: TextStyle(fontSize: 18, color: Colors.green)),
                  TextSpan(
                      text: "测试",
                      style: TextStyle(fontSize: 15, color: Colors.red))
                ])),
                TextButton(
                    onPressed: () {},
                    child: const Text("TextButton"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(CircleBorder()),
                        foregroundColor:
                            MaterialStateProperty.all(const Color(0xffff0000)),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff00ff00)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)))),
                OutlinedButton(
                    onPressed: () {}, child: const Text("TextButton")),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("TextButton"),
                  style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
                ),
                Image.asset("assets/images/image.png"),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation(Colors.blue),
                    value: .7,
                  ),
                ),
                Switch(
                  value: true, //当前状态
                  onChanged: (value) {
                    //重新构建页面
                  },
                ),
                Checkbox(
                  value: true,
                  activeColor: Colors.red, //选中时的颜色
                  onChanged: (value) {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
