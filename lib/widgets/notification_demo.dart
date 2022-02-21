import 'package:flutter/material.dart';

class NotificationDemo extends StatefulWidget {
  const NotificationDemo({Key? key}) : super(key: key);

  @override
  _NotificationDemoState createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  String _desc = "没有收到通知";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: NotificationListener<MyNotification>(
        //返回了false，表示不阻止冒泡 允许向上传递
        onNotification: (noti) {
          setState(() {
            _desc = noti.title;
          });
          return false;
        },
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 200,
                height: 100,
                alignment: Alignment.center,
                color: Colors.red,
                child: Text(
                  _desc,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              //因为这个context是根Context，而NotificationListener是监听的子树，所以我们通过Builder来构建TextButton，来获得按钮位置的context。
              Builder(builder: (context) {
                return TextButton(
                    onPressed: () {
                      MyNotification("发送通知了").dispatch(context);
                    },
                    child: const Text("发送通知"));
              }),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  final String title;

  MyNotification(this.title);
}
