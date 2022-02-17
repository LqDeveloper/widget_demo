import 'package:flutter/material.dart';
import 'package:widget_demo/widgets/custom_navigator.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  var _position = 0;
  final _icons = [
    Icons.home,
    Icons.toys,
    Icons.factory,
    Icons.class__outlined,
    Icons.account_circle
  ];

  final _titles = [
    "图鉴",
    "动态",
    "喜欢",
    "手册",
    "我的",
  ];

  final _colors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.purple
  ];
  late PageController _pageController;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _titles.length, vsync: this);
    _pageController = PageController(initialPage: _position);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("底部导航"),
        elevation: 0,
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.yellow,
          tabs: _titles
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          onTap: (index) {
            setState(() {
              _position = index;
            });
            _pageController.jumpToPage(index);
          },
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _createPageItem(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _position = index;
          });
        },
        currentIndex: _position,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        unselectedItemColor: Colors.green,
        selectedItemColor: Colors.red,
        selectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 12),
        unselectedLabelStyle:
            const TextStyle(color: Colors.green, fontSize: 12),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: _createItems(),
      ),
    );
  }

  List<Widget> _createPageItem() {
    List<Widget> list = [];
    for (int i = 0; i < _colors.length; i++) {
      list.add(
          PageItem(color: _colors[i], title: _titles[i])
      );
    }
    return list;
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

class PageItem extends StatefulWidget {
  Color color;
  String title;

  PageItem({Key? key, required this.color, required this.title})
      : super(key: key);

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print(" ${widget.title}");
    return Container(color: widget.color);
  }
  @override
  bool get wantKeepAlive => true;
}

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
