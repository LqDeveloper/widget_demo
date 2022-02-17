import 'package:flutter/material.dart';
import 'package:widget_demo/widgets/bottom_nav.dart';
import 'package:widget_demo/widgets/clip_demo.dart';
import 'package:widget_demo/widgets/container_demo.dart';
import 'package:widget_demo/widgets/popmenu_demo.dart';
import 'package:widget_demo/widgets/scroll_demo.dart';
import 'package:widget_demo/widgets/stack_demo.dart';
import 'package:widget_demo/widgets/text_demo.dart';
import 'package:widget_demo/widgets/textfield_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData(primaryColor: Colors.blue),
      routes: {
        "/textfield": (cxt) => const TextFieldDemo(),
        "/text": (cxt) => const TextDemo(),
        "/bottomNav": (cxt) => const BottomNav(),
        "/popmenu": (cxt) => PopMenuDemo(),
        "/clip": (cxt) => const ClipDemo(),
        "/stack": (cxt) => const StackDemo(),
        "/scrollView": (cxt) => const ScrollDemo(),
        "/container": (cxt) => const ContainerDemo(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final items = <String>[
    "输入框",
    "Text Button Image",
    "BottomNavigationBar",
    "PopMenu",
    "剪切",
    "Stack",
    "ScrollView",
    "Container"
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("组件练习"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemExtent: 60,
          itemBuilder: (cxt, index) {
            return InkWell(
              onTap: () {
                if (index == 0) {
                  Navigator.of(context).pushNamed("/textfield");
                } else if (index == 1) {
                  Navigator.of(context).pushNamed("/text");
                } else if (index == 2) {
                  Navigator.of(context).pushNamed("/bottomNav");
                } else if (index == 3) {
                  Navigator.of(context).pushNamed("/popmenu");
                } else if (index == 4) {
                  Navigator.of(context).pushNamed("/clip");
                } else if (index == 5) {
                  Navigator.of(context).pushNamed("/stack");
                } else if (index == 6) {
                  Navigator.of(context).pushNamed("/scrollView");
                } else if (index == 7) {
                  Navigator.of(context).pushNamed("/container");
                }
              },
              child: Container(
                color: Colors.yellow,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Align(
                      child: Text(
                        items[index],
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      alignment: Alignment.center,
                    ),
                    const Align(
                      child: Divider(
                        height: 3,
                        color: Colors.red,
                      ),
                      alignment: Alignment.bottomCenter,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: ListView());
  }
}
