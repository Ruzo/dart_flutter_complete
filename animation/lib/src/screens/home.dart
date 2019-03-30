import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  @override
  void initState() {
    super.initState();
    catController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    catAnimation = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
  }

  handleTap() {
    catAnimation.status == AnimationStatus.completed
        ? catController.reverse()
        : catController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pussycat in a box'),
      ),
      body: GestureDetector(
        child: buildAnimation(),
        onTap: handleTap,
      ),
    );
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
        animation: catAnimation,
        child: Cat(),
        builder: (context, child) {
          return Container(
            margin: EdgeInsets.only(top: catAnimation.value),
            child: child,
          );
        });
  }
}
