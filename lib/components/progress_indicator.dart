import 'package:flutter/material.dart';

class ProgressIndicatorCustom extends StatefulWidget {
  final double begin;
  final double end;
  const ProgressIndicatorCustom({@required this.begin, @required this.end});
  @override
  _ProgressIndicatorCustomState createState() =>
      _ProgressIndicatorCustomState();
}

class _ProgressIndicatorCustomState extends State<ProgressIndicatorCustom>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: widget.begin, end: widget.end).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      height: 8,
      child: LinearProgressIndicator(
        backgroundColor: Colors.black12,
        value: animation.value,
      ),
    );
  }
}
