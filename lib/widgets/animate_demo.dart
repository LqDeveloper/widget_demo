import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimateDemo extends StatelessWidget {
  const AnimateDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Navigator(
        initialRoute: "/main",
        onGenerateRoute: (setting) {
          switch (setting.name) {
            case "/main":
              return MaterialPageRoute(builder: (cxt) {
                return const ListWidget();
              });
            case "/animateOne":
              return MaterialPageRoute(builder: (_) {
                return const AnimateOne();
              });
            case "/AnimateTwo":
              return MaterialPageRoute(builder: (_) {
                return const AnimateTwo();
              });
            case "/AnimatedContainerDemo":
              return MaterialPageRoute(builder: (cxt) {
                return const AnimatedContainerDemo();
              });
            case "/AnimatedSwitherDemo":
              return MaterialPageRoute(builder: (cxt) {
                return const AnimatedSwitherDemo();
              });
            case "/TweenAnimationBuilder":
              return MaterialPageRoute(builder: (cxt) {
                return const TweenAnimationBuilderDemo();
              });
            case "/RotationTransitionDemo":
              return MaterialPageRoute(builder: (cxt) {
                return const RotationTransitionDemo();
              });
            case "/SliderDemo":
              return MaterialPageRoute(builder: (cxt) {
                return const SliderDemo();
              });
            case "/AnimatedBuilderDemo":
              return MaterialPageRoute(builder: (cxt) {
                return const AnimatedBuilderDemo();
              });
            case "/OtherAnimatedDemo":
              return MaterialPageRoute(builder: (cxt) {
                return const OtherAnimatedDemo();
              });
          }
        },
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final _title = ["隐式动画（全自动）动画", "显示(手动控制的)动画", "其他动画"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (cxt, index) {
          return InkWell(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.of(context).pushNamed("/animateOne");
                  break;
                case 1:
                  Navigator.of(context).pushNamed("/AnimateTwo");
                  break;
                case 2:
                  Navigator.of(context).pushNamed("/OtherAnimatedDemo");
                  break;
              }
            },
            child: ListTile(
              title: Text(_title[index]),
            ),
          );
        },
        itemCount: _title.length,
        itemExtent: 60,
      ),
    );
  }
}

class AnimateOne extends StatelessWidget {
  const AnimateOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimateOnePages();
  }
}

class AnimateOnePages extends StatefulWidget {
  const AnimateOnePages({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimateOnePages> createState() => _AnimateOnePagesState();
}

class _AnimateOnePagesState extends State<AnimateOnePages> {
  final _titles = [
    "AnimatedContainer",
    "AnimatedSwitcher",
    "TweenAnimationBuilder",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("隐式动画"),
      ),
      body: ListView.builder(
        itemBuilder: (cxt, index) {
          return InkWell(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.of(context).pushNamed("/AnimatedContainerDemo");
                  break;
                case 1:
                  Navigator.of(context).pushNamed("/AnimatedSwitherDemo");
                  break;
                case 2:
                  Navigator.of(context).pushNamed("/TweenAnimationBuilder");
              }
            },
            child: ListTile(
              title: Text(_titles[index]),
            ),
          );
        },
        itemCount: _titles.length,
        itemExtent: 60,
      ),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({Key? key}) : super(key: key);

  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

/*
* AnimatedContainer 修改出了child之外的属性，会默认添加动画
* */

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double _width = 200;
  Color _color = Colors.red;
  double _radius = 10;
  Alignment _alignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedContainer"),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 500,
              ),
              width: _width,
              height: _width,
              alignment: _alignment,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_radius),
              ),
              child: Container(
                width: 30,
                height: 30,
                color: Colors.amber,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _width += 10;
                  });
                },
                child: const Text("改变高度")),
            TextButton(
                onPressed: () {
                  setState(() {
                    _color =
                        Colors.blue[Random().nextInt(4) * 100] ?? Colors.red;
                  });
                },
                child: const Text("改变颜色")),
            TextButton(
                onPressed: () {
                  setState(() {
                    _radius += 10;
                  });
                },
                child: const Text("改变圆角")),
            TextButton(
                onPressed: () {
                  setState(() {
                    _alignment = Alignment.topCenter;
                  });
                },
                child: const Text("改变Aliment")),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

/*
* 当不同类型组件之间切换
* */
class AnimatedSwitherDemo extends StatefulWidget {
  const AnimatedSwitherDemo({Key? key}) : super(key: key);

  @override
  _AnimatedSwitherDemoState createState() => _AnimatedSwitherDemoState();
}

class _AnimatedSwitherDemoState extends State<AnimatedSwitherDemo> {
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedSwither"),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              alignment: Alignment.center,
              //AnimatedCrossFade
              child: AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  // FadeTransition
                  // ScaleTransition
                  //RotationTransition
                  //.....
                  return RotationTransition(
                    turns: animation,
                    child: ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  );
                },
                duration: const Duration(milliseconds: 500),
                child: isTrue
                    ? const Text(
                        "真真真真真真",
                        key: ValueKey(1),
                        style: TextStyle(fontSize: 20),
                      )
                    : const Text(
                        "假假假假假假",
                        key: ValueKey(2),
                        style: TextStyle(fontSize: 20),
                      ),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isTrue = !isTrue;
                  });
                },
                child: const Text("执行切换动画")),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class TweenAnimationBuilderDemo extends StatefulWidget {
  const TweenAnimationBuilderDemo({Key? key}) : super(key: key);

  @override
  _TweenAnimationBuilderDemoState createState() =>
      _TweenAnimationBuilderDemoState();
}

class _TweenAnimationBuilderDemoState extends State<TweenAnimationBuilderDemo> {
  double begin = 1.0;
  double end = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TweenAnimationBuilder"),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: begin, end: end),
                duration: const Duration(seconds: 3),
                builder: (cxt, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: Container(
                      color: Colors.red,
                      width: 200,
                      height: 200,
                    ),
                  );
                }),
            TextButton(
                onPressed: () {
                  setState(() {
                    begin = begin == 1.0 ? 0 : 1;
                    end = end == 1.0 ? 0 : 1;
                  });
                },
                child: const Text("执行动画")),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class AnimateTwo extends StatelessWidget {
  const AnimateTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("显示动画"),
      ),
      body: AnimateTwoPages(),
    );
  }
}

class AnimateTwoPages extends StatelessWidget {
  final _titles = ["RotationTransition", "交错动画(组合动画)", "AnimatedBuilder"];

  AnimateTwoPages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return InkWell(
          child: ListTile(
            title: Text(_titles[index]),
          ),
          onTap: () {
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed("/RotationTransitionDemo");
                break;
              case 1:
                Navigator.of(context).pushNamed("/SliderDemo");
                break;
              case 2:
                Navigator.of(context).pushNamed("/AnimatedBuilderDemo");
            }
          },
        );
      },
      itemCount: _titles.length,
      itemExtent: 60,
    );
  }
}

class RotationTransitionDemo extends StatefulWidget {
  const RotationTransitionDemo({Key? key}) : super(key: key);

  @override
  _RotationTransitionDemoState createState() => _RotationTransitionDemoState();
}

class _RotationTransitionDemoState extends State<RotationTransitionDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var isRepeat = true;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RotationTransition"),
      ),
      body: Center(
        child: RotationTransition(
          // turns: _controller.drive(Tween(begin: 0.0, end: 1.0)),
          turns: Tween(begin: 0.0, end: 1.0)
              .chain(CurveTween(curve: Curves.bounceInOut))
              .animate(_controller),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if (isRepeat) {
            isRepeat = false;
            _controller.repeat();
          } else {
            isRepeat = true;
            // _controller.reset();
            _controller.stop();
          }
        },
      ),
    );
  }
}

class SliderDemo extends StatefulWidget {
  const SliderDemo({Key? key}) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("交错动画"),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            SlideWIdget(
              controller: _controller,
              index: 1,
            ),
            SlideWIdget(controller: _controller, index: 2),
            SlideWIdget(controller: _controller, index: 3),
            SlideWIdget(controller: _controller, index: 4),
            SlideWIdget(controller: _controller, index: 5),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class SlideWIdget extends StatelessWidget {
  final int index;
  final AnimationController _controller;

  const SlideWIdget(
      {Key? key, required AnimationController controller, required this.index})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween(begin: Offset.zero, end: Offset(0.1, 0))
          .chain(CurveTween(curve: Interval(0.2 * (index - 1), 0.2 * index)))
          .animate(_controller),
      child: Container(
        width: 300,
        height: 100,
        color: Colors.red[100 * index],
      ),
    );
  }
}

class AnimatedBuilderDemo extends StatefulWidget {
  const AnimatedBuilderDemo({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 1.0, end: 0.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedBuilder"),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (cxt, child) {
          return Opacity(
            opacity: _animation.value,
            // opacity: Tween(begin: 1.0, end: 0.1).evaluate(_controller),
            child: child,
          );
        },
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              TextButton(
                  onPressed: () {
                    _controller.repeat(reverse: true);
                  },
                  child: const Text("点击开始动画")),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherAnimatedDemo extends StatelessWidget {
  const OtherAnimatedDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("其他动画"),
      ),
      body: const Center(
        // child: RiveAnimation.network(
        //   'https://cdn.rive.app/animations/vehicles.riv',
        // ),
        child: RiveAnimation.asset('assets/images/birb.riv'),
      ),
    );
  }
}


class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({Key? key}) : super(key: key);

  @override
  _PlayPauseAnimationState createState() => _PlayPauseAnimationState();
}

class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.network(
          'https://cdn.rive.app/animations/vehicles.riv',
          controllers: [_controller],
          // Update the play state when the widget's initialized
          onInit: (_) => setState(() {}),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}