import 'package:flutter/material.dart';
import 'package:widget_demo/log_utils.dart';

class ClipDemo extends StatelessWidget {
  const ClipDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("剪切"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Text("BoxDecoration的image 圆角"),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/image.png"))),
                ),
                onTap: () {
                  LogUtils.d("点击了图片");
                },
              ),
              const Text("BoxDecoration 设置圆角"),
              Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/images/image.png",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Text("ClipRRect 设置圆角"),
              ClipRRect(
                child: Image.asset("assets/images/image.png",width: 100,height: 100,),
                borderRadius: BorderRadius.circular(10),
              ),
              const Text("ClipOval 设置圆"),
              ClipOval(
                child: Image.asset("assets/images/image.png",width: 100,height: 100,),
              ),
              const Text("ClipRect 默认剪裁掉子组件布局空间之外的绘制内容（溢出部分剪裁）"),
              ClipRect(
                child: Align(
                  alignment:  Alignment.topLeft,
                  widthFactor: 0.5,
                  child: Image.asset("assets/images/image.png",width: 100,height: 100,),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
