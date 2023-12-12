import 'dart:async';
import 'package:flutter/material.dart';
import 'constant/constant.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool _visible = true; // Declare _visible here

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();

    // Using Future.delayed to wait for the animation to finish before navigation
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _visible = !_visible;
      });
      navigationPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 243, 250),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 251, 243, 250),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Kue & Hidangan Penutup'),
                const Padding(padding: EdgeInsets.all(8)),
                Hero(
                  tag: 'logoTag',
                  child: Image.asset(
                    'assets/logocake.png',
                    width: animation.value * 300,
                    height: animation.value * 400,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8)),
                const Text('Liceria & Co.'),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
