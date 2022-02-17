import 'package:flutter/material.dart';

class CustomNavigator extends StatelessWidget {
  const CustomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "home",
      onGenerateRoute: (settings) {
        if (settings.name == "home") {
          return MaterialPageRoute(
              builder: (cxt) {
                return Home();
              },
              settings: settings);
        } else if (settings.name == "new") {
          return MaterialPageRoute(
              builder: (cxt) {
                return NewPage();
              },
              settings: settings);
        }
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "new");
            },
            child: const Text("点击跳转")),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("跳转的页面"),
      ),
      body: const Center(
        child: Text("新页面"),
      ),
    );
  }
}
