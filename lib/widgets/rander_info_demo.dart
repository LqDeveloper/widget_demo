import 'package:flutter/material.dart';

class RanderDemo extends StatelessWidget {
  const RanderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RanderObject"),
      ),
      body: _RanderContainer(),
    );
  }
}

class _RanderContainer extends StatelessWidget {
  const _RanderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Builder(builder: (context) {
          return TextButton(
            child: Text("点击获取高度"),
            onPressed: () {
              RenderBox? randerObject =
                  context.findRenderObject() as RenderBox?;
              double width = randerObject?.size.width ?? 0;
              double height = randerObject?.size.height ?? 0;
              double x = randerObject?.localToGlobal(Offset.zero).dx ?? 0;
              double y = randerObject?.localToGlobal(Offset.zero).dy ?? 0;
              print("x:$x y:$y width:$width height：$height");
            },
          );
        })
      ],
    );
  }
}
