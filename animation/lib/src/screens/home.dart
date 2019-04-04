import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> _catAnimation;
  Animation<double> _flapAnimation;
  Animation<double> _boxAnimation;
  AnimationController _catController;
  AnimationController _boxController;
  int _direction = 1;

  Color boxColor = Color(0xFFCB922E);

  @override
  void initState() {
    super.initState();
    _catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _catAnimation = Tween(
      begin: -33.0,
      end: -80.0,
    ).animate(
      CurvedAnimation(
        parent: _catController,
        curve: Curves.easeIn,
      ),
    );

    _boxController = AnimationController(
      duration: Duration(milliseconds: 80),
      vsync: this,
    );

    _flapAnimation = Tween(
      begin: 0.0,
      end: 0.2,
    ).animate(
      CurvedAnimation(
        parent: _boxController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceOut,
      ),
    );

    _boxAnimation = Tween(
      begin: 0.0,
      end: 0.05,
    ).animate(
      CurvedAnimation(
        parent: _boxController,
        curve: Curves.linear,
      ),
    );
  }

  Future<void> handleTap() async {
    _catAnimation.status == AnimationStatus.completed
        ? _catController.reverse()
        : _catController.forward();

    try {
      for (var i = 0; i < 4; i++) {
        await _boxController.forward().orCancel;
        await _boxController.reverse().orCancel;
        _direction = -_direction;
      }
      _direction = -_direction;
    } on TickerCanceled {}
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

  Widget boxFlap(double left, double right, double angle, Alignment alignment,
      int direction) {
    return AnimatedBuilder(
      animation: _boxController,
      builder: (context, builder) {
        return Positioned(
          left: left,
          right: right,
          top: 0,
          child: Transform.rotate(
            angle: angle + (_direction * _flapAnimation.value),
            alignment: alignment,
            child: Container(
              width: 10,
              height: 100,
              color: boxColor,
            ),
          ),
        );
      },
    );
  }

  Widget box() {
    return AnimatedBuilder(
      animation: _boxController,
      builder: (context, builder) {
        return Transform.rotate(
          angle: (_direction * _boxAnimation.value),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              boxBody(),
              boxFlap(-8, 200, 0.2, Alignment.topRight, 1),
              boxFlap(200, -8, 6.0, Alignment.topLeft, -1)
            ],
          ),
        );
      },
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
        animation: _catController,
        child: Cat(),
        builder: (context, child) {
          return Positioned(
            left: 0.0,
            right: 0.0,
            top: _catAnimation.value,
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
