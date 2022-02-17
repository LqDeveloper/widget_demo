import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollDemo extends StatefulWidget {
  const ScrollDemo({Key? key}) : super(key: key);

  @override
  _ScrollDemoState createState() => _ScrollDemoState();
}

class _ScrollDemoState extends State<ScrollDemo> {
  final _titles = ["One", "Two"];
  final _icons = [Icons.access_time_outlined, Icons.build];

  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScrollView"),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [SingleScrollWidget(), ListViewDemo()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _createItems(),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.green,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _createItems() {
    List<BottomNavigationBarItem> list = [];
    for (int i = 0; i < _titles.length; i++) {
      list.add(
          BottomNavigationBarItem(icon: Icon(_icons[i]), label: _titles[i]));
    }
    return list;
  }
}

/*
* 通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，这是因为SingleChildScrollView不支持基于 Sliver 的延迟加载模型，
* 所以如果预计视口可能包含超出屏幕尺寸太多的内容时，那么使用SingleChildScrollView将会非常昂贵（性能差），
* 此时应该使用一些支持Sliver延迟加载的可滚动组件，如ListView。
* */
class SingleScrollWidget extends StatefulWidget {
  const SingleScrollWidget({Key? key}) : super(key: key);

  @override
  _SingleScrollWidgetState createState() => _SingleScrollWidgetState();
}

class _SingleScrollWidgetState extends State<SingleScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
        child: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        height: 1000,
        color: Colors.green,
      ),
    ));
  }
}

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
