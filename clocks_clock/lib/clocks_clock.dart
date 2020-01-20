// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' show radians;
import 'event_bus.dart';
import 'flutter_logo_radians.dart';
import 'num_matrix.dart';
import 'single_clock.dart';

enum DisplayType { time, weather, temperature, flutter }

class ClocksClock extends StatefulWidget {
  const ClocksClock(this.model);

  final ClockModel model;

  @override
  _ClocksClockState createState() => _ClocksClockState();
}

class _ClocksClockState extends State<ClocksClock> {
  var _now = DateTime.now();
  var _reportTime = DateTime.now();
  double _temperature;
  TemperatureUnit _unit;
  Timer _timer;
  DisplayType _displayType = DisplayType.time;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(ClocksClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      _temperature = widget.model.temperature;
      _unit = widget.model.unit;
    });
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      if (_now.second == 55 || _now.second == 25) {
        _reportTime = _now.add(Duration(seconds: 5));
        _displayType = DisplayType.time;
        eventBus.fire(ColorChangeEvent(Colors.blue));
      }
      if (_now.second == 5 || _now.second == 35) {
        _reportTime = _now.add(Duration(seconds: 5));
        _displayType = DisplayType.temperature;
        eventBus.fire(ColorChangeEvent(Colors.blue));
      }
      if (_now.second == 15 || _now.second == 45) {
        _reportTime = _now.add(Duration(seconds: 5));
        _displayType = DisplayType.flutter;
        eventBus.fire(ColorChangeEvent(Colors.blue));
      }

      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.Hms().format(DateTime.now());
    final h1 = _reportTime.hour ~/ 10;
    final h2 = _reportTime.hour % 10;
    final m1 = _reportTime.minute ~/ 10;
    final m2 = _reportTime.minute % 10;
    final timeList = [h1, h2, m1, m2];

    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Analog clock with time $time',
        value: time,
      ),
      child: Container(
        child: Stack(
          children: [
            GridView.builder(
                itemCount: 240,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 20,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {
                  final x = index % 20;
                  final y = index ~/ 20;
                  var numPos;

                  if (_displayType == DisplayType.time) {
                    int sx, sy, d;
                    if (y >= 2 && y <= 9) {
                      if (x >= 0 && x <= 3) {
                        numPos = 0;
                        d = 0;
                        sx = x - d;
                        sy = y - 2;
                      } else if (x >= 5 && x <= 8) {
                        numPos = 1;
                        d = 5;
                        sx = x - d;
                        sy = y - 2;
                      } else if (x >= 11 && x <= 14) {
                        numPos = 2;
                        d = 11;
                        sx = x - d;
                        sy = y - 2;
                      } else if (x >= 16 && x <= 19) {
                        numPos = 3;
                        d = 16;
                        sx = x - d;
                        sy = y - 2;
                      } else if (x >= 9 && x <= 10) {
                        d = 9;
                        sx = x - d;
                        sy = y - 2;
                        final n = 1;
                        return SingleClock(sx, sy, n,
                            type: SingleClockType.doubleColumn,
                            highlight:
                                NumMatrix.colon[sy][sx] == 10 ? false : true);
                      } else {
                        return SingleClock(0, 0, 10,
                            type: SingleClockType.fourColumn);
                      }
                      return SingleClock(sx, sy, timeList[numPos],
                          highlight: NumMatrix.m[timeList[numPos]][sy][sx] == 10
                              ? false
                              : true);
                    }
                    return SingleClock(0, 0, 10,
                        type: SingleClockType.fourColumn);
                  } else if (_displayType == DisplayType.temperature) {
                    int sx, sy, d;
                    if (y >= 2 && y <= 9) {
                      if (_unit == TemperatureUnit.fahrenheit) {
                        final temp = _temperature.toInt();
                        if (x >= 1 && x <= 4) {
                          numPos = 0;
                          d = 1;
                          sx = x - d;
                          sy = y - 2;
                          int n;
                          if (temp <= -10) {
                            n = 11;
                          } else if (temp >= 100) {
                            n = 1;
                          } else {
                            n = 10;
                          }
                          return SingleClock(sx, sy, n,
                              highlight:
                                  NumMatrix.m[n][sy][sx] == 10 ? false : true);
                        } else if (x >= 5 && x <= 8) {
                          numPos = 1;
                          d = 5;
                          sx = x - d;
                          sy = y - 2;
                          int n = (temp.abs() % 100) ~/ 10;
                          if (temp < 0 && temp > -10) {
                            n = 11;
                          } else if (temp < 10 && temp >= 0) {
                            n = 10;
                          }
                          return SingleClock(sx, sy, n,
                              highlight:
                                  NumMatrix.m[n][sy][sx] == 10 ? false : true);
                        } else if (x >= 9 && x <= 12) {
                          numPos = 2;
                          d = 9;
                          sx = x - d;
                          sy = y - 2;
                          final n = temp.abs() % 10;
                          return SingleClock(sx, sy, n,
                              highlight:
                                  NumMatrix.m[n][sy][sx] == 10 ? false : true);
                        } else if (x >= 13 && x <= 14) {
                          d = 13;
                          sx = x - d;
                          sy = y - 2;
                          final n = 0;
                          return SingleClock(sx, sy, n,
                              type: SingleClockType.doubleColumn,
                              highlight: NumMatrix.degreeSign[sy][sx] == 10
                                  ? false
                                  : true);
                        } else if (x >= 15 && x <= 18) {
                          numPos = 0;
                          d = 15;
                          sx = x - d;
                          sy = y - 2;
                          final n = 1;
                          return SingleClock(sx, sy, n,
                              type: SingleClockType.alphaBet,
                              highlight:
                                  NumMatrix.f[sy][sx] == 10 ? false : true);
                        } else {
                          return SingleClock(0, 0, 10,
                              type: SingleClockType.fourColumn);
                        }
                      } else {
                        final temp = _temperature.toInt();
                        if (x >= 1 && x <= 4) {
                          numPos = 0;
                          d = 1;
                          sx = x - d;
                          sy = y - 2;
                          int n;
                          if (temp <= -10) {
                            n = 11;
                          } else {
                            n = 10;
                          }
                          return SingleClock(sx, sy, n,
                              highlight:
                                  NumMatrix.m[n][sy][sx] == 10 ? false : true);
                        } else if (x >= 5 && x <= 8) {
                          numPos = 1;
                          d = 5;
                          sx = x - d;
                          sy = y - 2;
                          int n = (temp.abs() % 100) ~/ 10;
                          if (temp < 0 && temp > -10) {
                            n = 11;
                          } else if (n == 0) {
                            n = 10;
                          }
                          return SingleClock(sx, sy, n,
                              highlight:
                                  NumMatrix.m[n][sy][sx] == 10 ? false : true);
                        } else if (x >= 9 && x <= 12) {
                          numPos = 2;
                          d = 9;
                          sx = x - d;
                          sy = y - 2;
                          final n = temp.abs() % 10;
                          return SingleClock(sx, sy, n,
                              highlight:
                                  NumMatrix.m[n][sy][sx] == 10 ? false : true);
                        } else if (x >= 13 && x <= 14) {
                          d = 13;
                          sx = x - d;
                          sy = y - 2;
                          final n = 0;
                          return SingleClock(sx, sy, n,
                              type: SingleClockType.doubleColumn,
                              highlight: NumMatrix.degreeSign[sy][sx] == 10
                                  ? false
                                  : true);
                        } else if (x >= 15 && x <= 18) {
                          numPos = 0;
                          d = 15;
                          sx = x - d;
                          sy = y - 2;
                          final n = 0;
                          return SingleClock(sx, sy, n,
                              type: SingleClockType.alphaBet,
                              highlight:
                                  NumMatrix.c[sy][sx] == 10 ? false : true);
                        } else {
                          return SingleClock(0, 0, 10,
                              type: SingleClockType.fourColumn);
                        }
                      }
                    } else {
                      return SingleClock(0, 0, 10,
                          type: SingleClockType.fourColumn);
                    }
                  } else if (_displayType == DisplayType.flutter) {
                    if (x >= 0 && x <= 19) {
                      final d = 0;
                      final sx = x - d;
                      final sy = y;
                      return SingleClock(
                        sx,
                        sy,
                        0,
                        toHour: () {
                          int t = NumMatrix.icons[0][sy][sx];
                          FlutterLogoRaidanType type =
                              FlutterLogoRadians.all[t];
                          final hour = FlutterLogoRadians.hourValue(type);
                          return hour;
                        },
                        toMinutes: () {
                          int t = NumMatrix.icons[0][sy][sx];
                          FlutterLogoRaidanType type =
                              FlutterLogoRadians.all[t];
                          final minute = FlutterLogoRadians.minuteValue(type);
                          return minute;
                        },
                        type: SingleClockType.icons,
                        highlight:
                            NumMatrix.icons[0][sy][sx] == 9 ? false : true,
                      );
                    }
                    return SingleClock(0, 0, 10,
                        type: SingleClockType.fourColumn);
                  } else {
                    return SingleClock(index ~/ 16, index % 16, h1);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
