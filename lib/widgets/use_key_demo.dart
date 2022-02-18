import 'dart:math';

import 'package:flutter/material.dart';

class UseKeyDemo extends StatelessWidget {
  const UseKeyDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PositionedTiles(),
    );
  }
}

class UniqueColorGenerator {
  static List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
  static Random random = Random();

  static Color getColor() => colors[random.nextInt(colors.length)];
}

class StateColorfulTile extends StatelessWidget {
  final Color color = UniqueColorGenerator.getColor();

  StateColorfulTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Container(width: 100, height: 100, color: color);
  }
}

// class StateColorfulTile extends StatefulWidget {
//   const StateColorfulTile({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _StatefulColorfulTileState();
// }
//
// class _StatefulColorfulTileState extends State<StateColorfulTile> {
//   final Color color = UniqueColorGenerator.getColor();
//
//   @override
//   Widget build(BuildContext context) {
//     print("build");
//     return Container(width: 100, height: 100, color: color);
//   }
// }

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  late List<Widget> _tiles;

  @override
  void initState() {
    super.initState();
    _tiles = [
      StateColorfulTile(
          // key: ValueKey(1),
          ),
      StateColorfulTile(
          // key: ValueKey(2),
          )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Key Demo")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swap_horiz),
        onPressed: swapTiles,
      ),
    );
  }

  void swapTiles() {
    setState(() {
      _tiles.insert(1, _tiles.removeAt(0));
    });
  }
}
