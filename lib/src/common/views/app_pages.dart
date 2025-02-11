import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/home/home_view.dart';
import '../../pages/settings/settings_view.dart';
import '../view_models/app_view_model.dart';
import '../widgets/animated_indexed_stack.dart';

class AppPages extends StatelessWidget {
  const AppPages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return AnimatedIndexedStack(
          index: appViewModel.index,
          children: const <Widget>[
            HomeView(),
            SecondPage(),
            ThirdPage(),
            FourthPage(),
            SettingsView(),
          ],
        );
      },
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: const Center(child: Text('Second Page')),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(child: Text('Third Page')),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: const Center(child: Text('Fourth Page')),
      ),
    );
  }
}

class FifthPage extends StatelessWidget {
  const FifthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: const Center(child: Text('Fifth Page')),
      ),
    );
  }
}
