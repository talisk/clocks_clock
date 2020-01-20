enum FlutterLogoRaidanType {
  FlutterLogoRaidan0,
  FlutterLogoRaidan1,
  FlutterLogoRaidan2,
  FlutterLogoRaidan3,
  FlutterLogoRaidan4,
  FlutterLogoRaidan5,
  FlutterLogoRaidan6,
  FlutterLogoRaidan7,
  FlutterLogoRaidan8,
  FlutterLogoRaidan9,
  FlutterLogoRaidan10,
}

class FlutterLogoRadians {
  static const List<FlutterLogoRaidanType> all = [
    FlutterLogoRaidanType.FlutterLogoRaidan0,
    FlutterLogoRaidanType.FlutterLogoRaidan1,
    FlutterLogoRaidanType.FlutterLogoRaidan2,
    FlutterLogoRaidanType.FlutterLogoRaidan3,
    FlutterLogoRaidanType.FlutterLogoRaidan4,
    FlutterLogoRaidanType.FlutterLogoRaidan5,
    FlutterLogoRaidanType.FlutterLogoRaidan6,
    FlutterLogoRaidanType.FlutterLogoRaidan7,
    FlutterLogoRaidanType.FlutterLogoRaidan8,
    FlutterLogoRaidanType.FlutterLogoRaidan9,
    FlutterLogoRaidanType.FlutterLogoRaidan10,
  ];

  static double minuteValue(FlutterLogoRaidanType type) {
    switch (type) {
      case FlutterLogoRaidanType.FlutterLogoRaidan0:
        return 7;
      case FlutterLogoRaidanType.FlutterLogoRaidan1:
        return 53;
      case FlutterLogoRaidanType.FlutterLogoRaidan2:
        return 53;
      case FlutterLogoRaidanType.FlutterLogoRaidan3:
        return 37;
      case FlutterLogoRaidanType.FlutterLogoRaidan4:
        return 37;
      case FlutterLogoRaidanType.FlutterLogoRaidan5:
        return 53;
      case FlutterLogoRaidanType.FlutterLogoRaidan6:
        return 23;
      case FlutterLogoRaidanType.FlutterLogoRaidan7:
        return 0;
      case FlutterLogoRaidanType.FlutterLogoRaidan8:
        return 15;
      case FlutterLogoRaidanType.FlutterLogoRaidan9:
        return 0;
      case FlutterLogoRaidanType.FlutterLogoRaidan10:
        return 10;
      default:
        break;
    }
    return 0;
  }

  static double hourValue(FlutterLogoRaidanType type) {
    switch (type) {
      case FlutterLogoRaidanType.FlutterLogoRaidan0:
        return 7.5;
      case FlutterLogoRaidanType.FlutterLogoRaidan1:
        return 4.5;
      case FlutterLogoRaidanType.FlutterLogoRaidan2:
        return 9;
      case FlutterLogoRaidanType.FlutterLogoRaidan3:
        return 9;
      case FlutterLogoRaidanType.FlutterLogoRaidan4:
        return 3;
      case FlutterLogoRaidanType.FlutterLogoRaidan5:
        return 3;
      case FlutterLogoRaidanType.FlutterLogoRaidan6:
        return 1.5;
      case FlutterLogoRaidanType.FlutterLogoRaidan7:
        return 6;
      case FlutterLogoRaidanType.FlutterLogoRaidan8:
        return 9;
      case FlutterLogoRaidanType.FlutterLogoRaidan9:
        return 0;
      case FlutterLogoRaidanType.FlutterLogoRaidan10:
        return 8;
      default:
        break;
    }
    return 0;
  }
}
