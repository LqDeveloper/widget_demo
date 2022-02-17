import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final _focusNode = FocusNode();
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: "这是默认的值");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("输入框"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  // icon: Icon(Icons.add_a_photo),
                  labelText: "输入框",
                  // labelStyle: TextStyle(color: Colors.red, fontSize: 20),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  // helperText: "描述",
                  // helperStyle: TextStyle(color: Colors.green),
                  // helperMaxLines: 1,
                  hintText: "内容为空",
                  // hintStyle: TextStyle(color: Colors.blue, fontSize: 30),
                  hintMaxLines: 1,
                  // counterText: "100/100",
                  // fillColor: Colors.blueGrey,
                  // filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.green,
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.green,
                      )),
                ),
                onChanged: (value) {
                  print("输入：$value");
                },
                onSubmitted: (value) {
                  print("点击了done");
                },
                cursorColor: Colors.red,
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp("[a-zA-Z]"), allow: true),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                child: const Text("点击获取焦点")),
            ElevatedButton(
                onPressed: () {
                  _focusNode.unfocus();
                },
                child: const Text("取消交掉获取焦点")),
            CupertinoTextField(
              controller: _controller,
              placeholder: "placeholder",
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:  Colors.red, width: 2)),
            ),
            ElevatedButton(
                onPressed: () {
                  SystemChannels.textInput.invokeListMethod("TextInput.show");
                },
                child: const Text("弹窗键盘")),
            ElevatedButton(
                onPressed: () {
                  SystemChannels.textInput.invokeListMethod("TextInput.hide");
                },
                child: const Text("关闭键盘")),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }
}
