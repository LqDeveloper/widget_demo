import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ScrollDemo extends StatefulWidget {
  const ScrollDemo({Key? key}) : super(key: key);

  @override
  _ScrollDemoState createState() => _ScrollDemoState();
}

class _ScrollDemoState extends State<ScrollDemo> {
  final _titles = ["One", "Two", "Three"];
  final _icons = [Icons.access_time_outlined, Icons.build, Icons.settings];

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
        children: const [SingleScrollWidget(), ListViewDemo(), GridViewDemo()],
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
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
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
  // late ScrollController _scrollController;
  late AutoScrollController _autoScrollController;
  int _offset = 0;

  @override
  void initState() {
    // _scrollController = ScrollController(initialScrollOffset: 0);
    // _scrollController.addListener(() {
    //   print(_scrollController.offset);
    //   setState(() {
    //     _offset = _scrollController.offset.toInt();
    //   });
    // });

    _autoScrollController = AutoScrollController(axis: Axis.vertical);
    _autoScrollController.addListener(() {
      print(_autoScrollController.offset);
      setState(() {
        _offset = _autoScrollController.offset.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          child: Text(
            "滚动位置:$_offset",
            style: const TextStyle(color: Colors.red),
          ),
          alignment: Alignment.center,
        ),
        Expanded(
          child: NotificationListener(
            onNotification: (notification) {
              String notify = "";
              if (notification is ScrollEndNotification) {
                notify = "ScrollEnd";
              } else if (notification is ScrollStartNotification) {
                notify = "ScrollStart";
              } else if (notification is UserScrollNotification) {
                notify = " UserScroll";
              } else if (notification is ScrollUpdateNotification) {
                notify = "ScrollUpdate";
              }
              /*pixels：当前滚动位置。
                maxScrollExtent：最大可滚动长度。
                extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
                extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
                extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
                atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）。*/
              if (notification is ScrollNotification) {
                print("$notify ${notification.metrics.pixels}");
              }
              return false;
            },
            child: ListView.builder(
                itemCount: 100,
                itemExtent: 60,
                controller: _autoScrollController,
                itemBuilder: (cxt, index) {
                  return _wrapScrollTag(
                      index: index,
                      child: InkWell(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text("这是第$index行"),
                            const Align(
                                alignment: Alignment.bottomCenter,
                                child: Divider(
                                  height: 1,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ));
                }),
          ),
        ),
        TextButton(
            onPressed: () {
              // _scrollController.jumpTo(1300);
            },
            child: const Text("滚动到300")),
        TextButton(
            onPressed: () {
              if (_autoScrollController.hasClients) {
                _scrollToCounter(30);
              }
            },
            child: const Text("滚动第30个"))
      ],
    );
  }

  Future _scrollToCounter(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  //**************************这个是关键**************************
  Widget _wrapScrollTag({required int index, required Widget child}) =>
      AutoScrollTag(
        key: ValueKey(index),
        controller: _autoScrollController,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );
}

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120.0,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.0 //宽高比为2
            ),
        // const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     mainAxisSpacing: 10,
        //     crossAxisSpacing: 10,
        //     childAspectRatio: 1.0
        // ),
        itemBuilder: (cxt, index) {
          return InkWell(
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: Text("$index"),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
