import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Color boxColor = Color(0xFFCB922E);

  @override
  void initState() {
    super.initState();
    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    catAnimation = Tween(
      begin: -35.0,
      end: -82.0,
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
        child: stackedWidgets(),
        onTap: handleTap,
      ),
    );
  }

  Widget boxBody() {
    return Container(
      width: 200.0,
      height: 200.0,
      color: boxColor,
    );
  }

  Widget boxFlapLeft() {
    return Positioned(
      left: -8,
      top: 0,
      child: Transform.rotate(
        angle: 0.2,
        alignment: Alignment.topRight,
        child: Container(
          width: 10,
          height: 100,
          color: boxColor,
        ),
      ),
    );
  }

  Widget boxFlapRight() {
    return Positioned(
      left: 198,
      top: 0,
      child: Transform.rotate(
        angle: 6.0,
        alignment: Alignment.topLeft,
        child: Container(
          width: 10,
          height: 100,
          color: boxColor,
        ),
      ),
    );
  }

  Widget box() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        boxBody(),
        boxFlapLeft(),
        boxFlapRight(),
      ],
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
        animation: catAnimation,
        child: Cat(),
        builder: (context, child) {
          return Positioned(
            left: 0.0,
            right: 0.0,
            top: catAnimation.value,
            child: child,
          );
        });
  }

  Widget stackedWidgets() {
    return Center(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          buildCatAnimation(),
          box(),
        ],
      ),
    );
  }
}
