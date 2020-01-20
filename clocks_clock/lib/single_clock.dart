import 'dart:async';
import 'package:animated_rotation/animated_rotation.dart';
import 'package:flutter/material.dart';
import 'drawn_hand.dart';
import 'num_matrix.dart';
import 'num_radians.dart';
import 'event_bus.dart';

final radiansPerTick = 360 / 60; //radians(360 / 60);
final radiansPerHour = 360 / 12; //radians(360 / 24);

enum SingleClockType {
  doubleColumn,
  fourColumn,
  alphaBet,
  icons,
}

class SingleClock extends StatefulWidget {
  final int x;
  final int y;
  final int numVal;
  final SingleClockType type;
  final Function toHour;
  final Function toMinutes;
  final bool highlight;

  SingleClock(this.x, this.y, this.numVal,
      {Key key, this.type, this.toHour, this.toMinutes, this.highlight})
      : super(key: key);

  @override
  _SingleClockState createState() => _SingleClockState();
}

class _SingleClockState extends State<SingleClock>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  StreamSubscription _colorSubscription;
  Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = Colors.black;

    _colorSubscription = eventBus.on<ColorChangeEvent>().listen((event) {
      controller.forward();
    });

    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    animation =
        ColorTween(begin: _currentColor, end: Colors.blue).animate(controller);

    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentColor = animation.value;
        });
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _colorSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      setState(() {
        _currentColor = Colors.black;
        animation = ColorTween(begin: _currentColor, end: Colors.blue)
            .animate(controller);
      });
    } else {
      setState(() {
        _currentColor = Colors.white;
        animation = ColorTween(begin: _currentColor, end: Colors.blue)
            .animate(controller);
      });
    }

    final customTheme = Theme.of(context).brightness == Brightness.light
        ? Theme.of(context).copyWith(
            primaryColor: Color(0xFF000000),
            backgroundColor: Color(0xFFFFFFFF),
          )
        : Theme.of(context).copyWith(
            primaryColor: Color(0xFFFFFFFF),
            backgroundColor: Color(0xFF2F2F2F),
          );

    double hour, minute;
    if (widget.toHour == null) {
      int t = NumMatrix.m[widget.numVal][widget.y][widget.x];
      if (widget.type == SingleClockType.fourColumn) {
        t = NumMatrix.m[widget.numVal][widget.y][widget.x];
      } else if (widget.type == SingleClockType.doubleColumn) {
        t = NumMatrix.doubleColumn[widget.numVal][widget.y][widget.x];
      } else if (widget.type == SingleClockType.alphaBet) {
        t = NumMatrix.alphaBet[widget.numVal][widget.y][widget.x];
      } else if (widget.type == SingleClockType.icons) {
        t = NumMatrix.icons[widget.numVal][widget.y][widget.x];
      }
      NumRaidanType type = NumRadians.all[t];
      hour = NumRadians.hourValue(type).toDouble();
      minute = NumRadians.minuteValue(type).toDouble();
    } else {
      hour = widget.toHour();
      minute = widget.toMinutes();
    }
    return Container(
      padding: EdgeInsets.zero,
      width: 20,
      height: 20,
      color: customTheme.backgroundColor,
      child: Stack(
        children: [
          ConstrainedBox(
            child: CircleAvatar(
              backgroundColor: customTheme.backgroundColor,
              child: Image.asset(Theme.of(context).brightness == Brightness.dark
                  ? 'clock_dark.png'
                  : 'clock.png'),
            ),
            constraints: BoxConstraints.expand(),
          ),
          AnimatedRotation(
            angle: minute * radiansPerTick,
            duration: Duration(seconds: 5),
            child: DrawnHand(
                color: widget.highlight == true
                    ? animation.value
                    : customTheme.primaryColor,
                thickness: 4,
                size: 0.9,
                angleRadians: 0),
          ),
          AnimatedRotation(
            angle: hour * radiansPerHour,
            duration: Duration(seconds: 5),
            child: DrawnHand(
                color: widget.highlight == true
                    ? animation.value
                    : customTheme.primaryColor,
                thickness: 4,
                size: 0.7,
                angleRadians: 0),
          ),
        ],
      ),
    );
  }
}
