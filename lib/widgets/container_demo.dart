import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/home",
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case "/home":
            return MaterialPageRoute(
                builder: (cxt) {
                  return const NavigatorWidget();
                },
                settings: setting);
          case "/scene1":
            return MaterialPageRoute(builder: (cxt) {
              return SceneOne(
                title: (setting.arguments as String?) ?? "",
              );
            });
          case "/scene2":
            return MaterialPageRoute(builder: (cxt) {
              return const SceneTwo();
            });
          case "/scene3":
            return MaterialPageRoute(builder: (cxt) {
              return const SceneThree();
            });
          case "/scene4":
            return MaterialPageRoute(builder: (cxt) {
              return const SceneFour();
            });
          case "/scene5":
            return MaterialPageRoute(builder: (cxt) {
              return const SceneFive();
            });
          case "/scene6":
            return MaterialPageRoute(builder: (cxt) {
              return const SceneSix();
            });
          default:
            return null;
        }
      },
    );
  }
}

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container 的特殊情况"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context,rootNavigator: true).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: _ContainerBody(),
    );
  }
}

class _ContainerBody extends StatelessWidget {
  final _titles = ["场景1", "场景2", "场景3", "场景4", "场景5", "场景6"];
  final _desc = [
    "If the widget has no child, no height, no width, "
        "no constraints, and the parent provides unbounded constraints, "
        "then Container tries to size as small as possible.",
    "If the widget has no child and no alignment,"
        " but a height, width, or constraints are provided, "
        "then the Container tries to be as small as possible given the combination"
        " of those constraints and the parent's constraints.",
    "If the widget has no child, no height, "
        "no width, no constraints, and no alignment, but the parent provides bounded constraints, "
        "then Container expands to fit the constraints provided by the parent.",
    "If the widget has an alignment, and the parent provides unbounded constraints, "
        "then the Container tries to size itself around the child.",
    "If the widget has an alignment, and the parent provides bounded constraints, then the Container tries to expand to fit the parent, "
        "and then positions the child within itself as per the alignment.",
    "If the widget has a child but no height, no width, no constraints, and no alignment,"
        " and the Container passes the constraints from the parent to the child and sizes itself to match the child."
  ];

  _ContainerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 60,
        itemCount: _titles.length,
        itemBuilder: (cxt, index) {
          return InkWell(
            child: Stack(alignment: Alignment.centerLeft, children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(_titles[index]),
              ),
              Positioned(
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.info),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (cxt) {
                            return Align(
                              alignment: Alignment.center,
                              child: CupertinoActionSheet(
                                title: const Text("描述"),
                                message: Text(
                                  _desc[index],
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.green),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      child: const Text("确定"))
                                ],
                              ),
                            );
                          });
                    },
                  ))
            ]),
            onTap: () {
              if (index == 0) {
                Navigator.of(context)
                    .pushNamed("/scene1", arguments: _titles[index]);
              } else if (index == 1) {
                Navigator.of(context)
                    .pushNamed("/scene2", arguments: _titles[index]);
              } else if (index == 2) {
                Navigator.of(context)
                    .pushNamed("/scene3", arguments: _titles[index]);
              } else if (index == 3) {
                Navigator.of(context)
                    .pushNamed("/scene4", arguments: _titles[index]);
              } else if (index == 4) {
                Navigator.of(context)
                    .pushNamed("/scene5", arguments: _titles[index]);
              } else if (index == 5) {
                Navigator.of(context)
                    .pushNamed("/scene6", arguments: _titles[index]);
              }
            },
          );
        });
  }
}

class SceneOne extends StatelessWidget {
  final String title;

  const SceneOne({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: UnconstrainedBox(
          //通过LayoutBuilder 打印父组件的约束
          child: LayoutBuilder(
            builder: (cxt, constraints) {
              //constraints: BoxConstraints(unconstrained)
              print("constraints: $constraints");
              //无法看到红色的Container
              return Container(
                color: Colors.red,
              );
            },
          ),
        ),
      ),
    );
  }
}

class SceneTwo extends StatelessWidget {
  const SceneTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("场景2"),
      ),
      body: LayoutBuilder(
        builder: (cxt, constraints) {
          print("constraints: $constraints");
          //红色背景和Text大小一样
          return Container(
            color: Colors.red,
            child: const Text("这是Text"),
          );
        },
      ),
    );
  }
}

class SceneThree extends StatelessWidget {
  const SceneThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("场景3"),
      ),
      body: LayoutBuilder(
        builder: (cxt, constraints) {
          print("constraints: $constraints");
          //红色沾满全屏
          return Container(
            color: Colors.deepOrange,
          );
        },
      ),
    );
  }
}

class SceneFour extends StatelessWidget {
  const SceneFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("场景4"),
      ),
      body: Container(
        child: UnconstrainedBox(
          child: LayoutBuilder(
            builder: (cxt, constraints) {
              print("constraints: $constraints");
              //红色背景和Text大小一样
              return Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text("这是Text"),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SceneFive extends StatelessWidget {
  const SceneFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("场景5"),
      ),
      body: Container(child: LayoutBuilder(
        builder: (cxt, constraints) {
          print("constraints: $constraints");
          //红色背景占满全屏
          return Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text("这是Text"),
          );
        },
      )),
    );
  }
}

class SceneSix extends StatelessWidget {
  const SceneSix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("场景6"),
      ),
      body: LayoutBuilder(
        builder: (cxt, constraints) {
          print("constraints: $constraints");
          //红色背景和Text大小一样
          return Container(
            color: Colors.red,
            child: const Text("这是Text"),
          );
        },
      ),
    );
  }
}
