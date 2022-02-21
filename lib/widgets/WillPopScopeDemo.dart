import 'package:flutter/material.dart';

class WillPopScopeDemo extends StatefulWidget {
  const WillPopScopeDemo({Key? key}) : super(key: key);

  @override
  State<WillPopScopeDemo> createState() => _WillPopScopeDemoState();
}

class _WillPopScopeDemoState extends State<WillPopScopeDemo> {
  bool _canBack = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WillPopScope的使用"),
      ),
      body: WillPopScope(
        //如果设置了onWillPop，iOS的侧滑返回手势失效
        onWillPop: _canBack ? null : callBack,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: TextButton(
              child: Text(_canBack ? "允许返回" : "不允许返回"),
              onPressed: () {
                setState(() {
                  _canBack = !_canBack;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> callBack() async {
    if (_canBack) return _canBack;
    final result = await showDialog(
        context: context,
        builder: (cxt) {
          return AlertDialog(
            title: const Text(
              "是否允许返回",
              style: TextStyle(fontSize: 20),
            ),
            content: const Text(
              "点击确认允许，取消则不允许",
              style: TextStyle(fontSize: 15),
            ),
            actions: [
              TextButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text('确认'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
    return result ?? false;
  }
}
