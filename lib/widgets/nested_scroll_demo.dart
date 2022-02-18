import 'package:flutter/material.dart';

class NestedScrollDemo extends StatelessWidget {
  const NestedScrollDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(headerSliverBuilder: (cxt, innerBoxIsScrolled) {
      return [
        SliverAppBar(
          //隐藏返回按钮
          // automaticallyImplyLeading: false,
          floating: false,
          snap: false,
          expandedHeight: 300,
          pinned: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(0),
            child: PageView(
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
        SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
                child: Container(color: Colors.yellow),
                minHeight:
                    MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                            .padding
                            .top +
                        40,
                maxHeight: 200))
      ];
    }, body: Material(
      child: ListView.builder(itemBuilder: (cxt, index) {
        return ListTile(
          title: Text("这是第$index行"),
        );
      }),
    ));
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  StickyTabBarDelegate(
      {required this.child, required this.maxHeight, required this.minHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(StickyTabBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }
}
