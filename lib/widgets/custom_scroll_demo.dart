import 'package:flutter/material.dart';

class CustomScrollDemo extends StatefulWidget {
  const CustomScrollDemo({Key? key}) : super(key: key);

  @override
  _CustomScrollDemoState createState() => _CustomScrollDemoState();
}

/*  const SliverAppBar({
    Key key,
    this.leading,//左侧的图标或文字，多为返回箭头
    this.automaticallyImplyLeading = true,//没有leading为true的时候，默认返回箭头，没有leading且为false，则显示title
    this.title,//标题
    this.actions,//标题右侧的操作
    this.flexibleSpace,//可以理解为SliverAppBar的背景内容区
    this.bottom,//SliverAppBar的底部区
    this.elevation,//阴影
    this.forceElevated = false,//是否显示阴影
    this.backgroundColor,//背景颜色
    this.brightness,//状态栏主题，默认Brightness.dark，可选参数light
    this.iconTheme,//SliverAppBar图标主题
    this.actionsIconTheme,//action图标主题
    this.textTheme,//文字主题
    this.primary = true,//是否显示在状态栏的下面,false就会占领状态栏的高度
    this.centerTitle,//标题是否居中显示
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,//标题横向间距
    this.expandedHeight,//合并的高度，默认是状态栏的高度加AppBar的高度
    this.floating = false,//滑动时是否悬浮
    this.pinned = false,//标题栏是否固定
    this.snap = false,//配合floating使用
  })
*/


class _CustomScrollDemoState extends State<CustomScrollDemo> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("SliverAppBar"),
            expandedHeight: 200,
            floating: false,
            snap: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.asset("assets/images/image.png",fit: BoxFit.cover,),
              // title: const Text("SliverAppBar"),
              collapseMode: CollapseMode.none,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate((cxt, index) {
                  return ListTile(
                    title: Text("这是第$index行"),
                  );
                }, childCount: 30),
                itemExtent: 60),
          )
        ],
      ),
    );
  }
}
