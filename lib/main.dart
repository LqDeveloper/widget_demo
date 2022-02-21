import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_demo/widgets/WillPopScopeDemo.dart';
import 'package:widget_demo/widgets/animate_demo.dart';
import 'package:widget_demo/widgets/bottom_nav.dart';
import 'package:widget_demo/widgets/clip_demo.dart';
import 'package:widget_demo/widgets/container_demo.dart';
import 'package:widget_demo/widgets/custom_scroll_demo.dart';
import 'package:widget_demo/widgets/key_demo.dart';
import 'package:widget_demo/widgets/listview_demo.dart';
import 'package:widget_demo/widgets/nested_scroll_demo.dart';
import 'package:widget_demo/widgets/popmenu_demo.dart';
import 'package:widget_demo/widgets/rander_info_demo.dart';
import 'package:widget_demo/widgets/scroll_demo.dart';
import 'package:widget_demo/widgets/stack_demo.dart';
import 'package:widget_demo/widgets/text_demo.dart';
import 'package:widget_demo/widgets/textfield_demo.dart';
import 'package:widget_demo/widgets/use_key_demo.dart';

void main() {
  runApp(AnnotatedRegion<SystemUiOverlayStyle>(
    child: MyApp(),
    value: const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.dark,
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
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
        "/customScroll": (cxt) => const CustomScrollDemo(),
        "/nestedScrollView": (cxt) => const NestedScrollDemo(),
        "/keydemo": (cxt) => const KeyDemo(),
        "/usekey": (cxt) => const UseKeyDemo(),
        "/randerdemo": (cxt) => const RanderDemo(),
        "/animatedemo": (cxt) => const AnimateDemo(),
        "/willPopScope": (cxt) => const WillPopScopeDemo(),
        "/listViewDemo": (cxt) => const ListViewHeightDemo(),
      },
      navigatorObservers: [MyNavigatorObserver()],
      home: HomePage(),
    );
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didPush");
  }

  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didPop");
  }

  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didRemove");
  }

  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print("didReplace");
  }

  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didStartUserGesture");
  }

  void didStopUserGesture() {
    print("didStopUserGesture");
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
    "Container",
    "CustomScrollView",
    "NestedScrollView",
    "Flutter中常见的Key",
    "Key的使用实例",
    "获取RanderObject的位置大小信息",
    "动画",
    "WillPopScope的使用",
    "ListView根据内容撑开"
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
                } else if (index == 8) {
                  Navigator.of(context).pushNamed("/customScroll");
                } else if (index == 9) {
                  Navigator.of(context).pushNamed("/nestedScrollView");
                } else if (index == 10) {
                  Navigator.of(context).pushNamed("/keydemo");
                } else if (index == 11) {
                  Navigator.of(context).pushNamed("/usekey");
                } else if (index == 12) {
                  Navigator.of(context).pushNamed("/randerdemo");
                } else if (index == 13) {
                  Navigator.of(context).pushNamed("/animatedemo");
                } else if (index == 14) {
                  Navigator.of(context).pushNamed("/willPopScope");
                } else if (index == 15) {
                  Navigator.of(context).pushNamed("/listViewDemo");
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
