import 'package:flutter/material.dart';

class KeyDemo extends StatelessWidget {
  const KeyDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(builder: (cxt) {
            return _HomePage();
          })
        ];
      },
      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //      return null;
      // }
      // },
    );
  }
}

class _HomePage extends StatelessWidget {
  _HomePage({Key? key}) : super(key: key);
  final _titles = [
    "LocalKey",
    "ValueKey",
    "ObjectKey",
    "UniqueKey",
    "GlobalKey",
    "PageStorageKey"
  ];

  final _desc = [
    "LocalKey(抽象类) 键在具有相同父级的 [Element] 中必须是唯一的。LocalKey子类包含ValueKey/ObjectKey/UniqueKey",
    """ValueKey 顾名思义是比较的是值 
    关键代码
    @override
    bool operator ==(Object other) {
      if (other.runtimeType != runtimeType)
        return false;
      return other is ValueKey<T>
          && other.value == value;
    }
    """,
    """
    ObjectKey 顾名思义是比较对象的key 当类型不一致，判定为不是通过一个对象，如果另外一个也是ObjectKey,
    则判断地址是否相同，只有地址相同才判定为同一个对象。
    关键代码
      @override
     bool operator ==(Object other) {
       if (other.runtimeType != runtimeType)
         return false;
       return other is ObjectKey
         && identical(other.value, value);
      }
    """,
    """
    每次生成不同的值，当我们每次刷新都需要一个新的值，那么正是这个存在的意义。一个只等于自己的键,
    这不能用 const 构造函数创建，因为这意味着所有实例化的键都是同一个实例，因此不是唯一的。
    """,
    """
    GlobalKey & GlobalObjectKey
    作为全局使用的key,当跨小部件我们通常可以使用GlobalKey来刷新其他小部件。
    GlobalObjectKey和ObjectKey是否相等的判定条件是一致的，
    GlobalObjectKey继承GlobalKey,通过GlobalKey<T extends State<StatefulWidget>>来指定继承state， 
    并实现StatefulWidget接口的类，然后可以通过GlobalKey.currentState来获取当前state,
    然后调用state.setState((){})完成当前小部件标记为dirty，在下一帧刷新当前小部件。
    在整个应用程序中唯一的键。子类有LabeledGlobalKey，GlobalObjectKey
    """,
    "将一个组件的状态保存在storage中，在销毁并重新创建是恢复状态"
        "每个键及需要在widget最近的祖先 [PageStorage] 中是唯一的。 "
        "key的值在销毁创建前后是不变的"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Key的使用"),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                showInfoDialog(
                    context,
                    "Key的介绍",
                    "Key(抽象类) 是 Widget、Element 和 SemanticsNode 的标识符。"
                        "一个新的widget如果和element关联的widget的key相同的话，那么这个widget将"
                        "只是用来更新element，而不是创建一个新的element。"
                        "键在具有相同父级的 [Element] 中必须是唯一的。"
                        "Key 的子类应该是 LocalKey 或 GlobalKey 的子类。"
                        " 使用构造函数默认创建的是ValueKey const factory Key(String value) = ValueKey<String>;");
              },
              icon: const Icon(Icons.info)),
        ],
      ),
      body: ListView.builder(
          itemCount: _titles.length,
          itemExtent: 60,
          itemBuilder: (cxt, index) {
            return ListTile(
              title: Text(_titles[index]),
              trailing: IconButton(
                onPressed: () {
                  showInfoDialog(context, _titles[index], _desc[index]);
                },
                icon: const Icon(Icons.info),
              ),
            );
          }),
    );
  }

  void showInfoDialog(BuildContext context, String title, String desc) {
    showDialog(
        context: context,
        builder: (cxt) {
          return AlertDialog(
            title: Text(
              "${title}的介绍",
              style: const TextStyle(fontSize: 20),
            ),
            content: Text(
              desc,
              style: const TextStyle(color: Colors.red),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: const Text("确认"),
              )
            ],
          );
        });
  }
}
