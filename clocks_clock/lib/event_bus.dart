import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

EventBus eventBus = EventBus();

class ColorChangeEvent {
  Color color;

  ColorChangeEvent(this.color);
}

class ColorRecoveryEvent {
  ColorRecoveryEvent();
}
