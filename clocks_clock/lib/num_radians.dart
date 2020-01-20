enum NumRaidanType {
  NumRaidan0,
  NumRaidan1,
  NumRaidan2,
  NumRaidan3,
  NumRaidan4,
  NumRaidan5,
  NumRaidan6,
  NumRaidan7,
  NumRaidan8,
  NumRaidan9,
  NumRaidan10,
}

class NumRadians {
  static const List<NumRaidanType> all = [
    NumRaidanType.NumRaidan0,
    NumRaidanType.NumRaidan1,
    NumRaidanType.NumRaidan2,
    NumRaidanType.NumRaidan3,
    NumRaidanType.NumRaidan4,
    NumRaidanType.NumRaidan5,
    NumRaidanType.NumRaidan6,
    NumRaidanType.NumRaidan7,
    NumRaidanType.NumRaidan8,
    NumRaidanType.NumRaidan9,
    NumRaidanType.NumRaidan10,
  ];

  static int minuteValue(NumRaidanType type) {
    switch (type) {
      case NumRaidanType.NumRaidan0:
        return 15;
      case NumRaidanType.NumRaidan1:
        return 30;
      case NumRaidanType.NumRaidan2:
        return 45;
      case NumRaidanType.NumRaidan3:
        return 0;
      case NumRaidanType.NumRaidan4:
        return 15;
      case NumRaidanType.NumRaidan5:
        return 30;
      case NumRaidanType.NumRaidan6:
        return 25;
      case NumRaidanType.NumRaidan7:
        return 35;
      case NumRaidanType.NumRaidan8:
        return 55;
      case NumRaidanType.NumRaidan9:
        return 5;
      case NumRaidanType.NumRaidan10:
        return 10;
      default:
        break;
    }
    return 0;
  }

  static int hourValue(NumRaidanType type) {
    switch (type) {
      case NumRaidanType.NumRaidan0:
        return 6;
      case NumRaidanType.NumRaidan1:
        return 9;
      case NumRaidanType.NumRaidan2:
        return 0;
      case NumRaidanType.NumRaidan3:
        return 3;
      case NumRaidanType.NumRaidan4:
        return 9;
      case NumRaidanType.NumRaidan5:
        return 0;
      case NumRaidanType.NumRaidan6:
        return 0;
      case NumRaidanType.NumRaidan7:
        return 0;
      case NumRaidanType.NumRaidan8:
        return 6;
      case NumRaidanType.NumRaidan9:
        return 6;
      case NumRaidanType.NumRaidan10:
        return 8;
      default:
        break;
    }
    return 0;
  }

  // static NumRadians(type)
}
