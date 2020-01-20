class NumMatrix {
  static const width = 4;
  static const height = 8;

  static List<List<List<int>>> get icons {
    return [
      NumMatrix.flutterLogo,
    ];
  }

  static List<List<int>> get flutterLogo {
    return [
      [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 4, 8, 8, 3, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 9, 9, 9, 9, 0, 4, 3, 0, 9, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 9, 9, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 9, 9, 9, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 4, 8, 8, 3, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 6, 6, 0, 0, 0, 4, 3, 0, 9, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 9, 1, 0, 0, 0, 0, 0, 9, 9, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 9, 9, 6, 6, 0, 0, 9, 9, 9, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 9, 9, 9, 1, 0, 1, 1, 9, 9, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 5, 2, 1, 9, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 5, 8, 8, 2, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
    ];
  }

  /* ******************************* */

  static List<List<List<int>>> get alphaBet {
    return [
      NumMatrix.c,
      NumMatrix.f,
    ];
  }

  static List<List<int>> get c {
    return [
      [0, 4, 4, 1],
      [5, 0, 4, 2],
      [5, 5, 10, 10],
      [5, 5, 10, 10],
      [5, 5, 10, 10],
      [5, 5, 10, 10],
      [5, 3, 4, 1],
      [3, 4, 4, 2],
    ];
  }

  static List<List<int>> get f {
    return [
      [0, 4, 4, 1],
      [5, 0, 4, 2],
      [5, 5, 10, 10],
      [5, 3, 4, 1],
      [5, 0, 4, 2],
      [5, 5, 10, 10],
      [5, 5, 10, 10],
      [3, 2, 10, 10],
    ];
  }

  /* ******************************* */

  static List<List<List<int>>> get doubleColumn {
    return [
      NumMatrix.degreeSign,
      NumMatrix.colon,
    ];
  }

  static List<List<int>> get degreeSign {
    return [
      [0, 1],
      [3, 2],
      [10, 10],
      [10, 10],
      [10, 10],
      [10, 10],
      [10, 10],
      [10, 10],
    ];
  }

  static List<List<int>> get colon {
    return [
      [10, 10],
      [10, 10],
      [0, 1],
      [3, 2],
      [0, 1],
      [3, 2],
      [10, 10],
      [10, 10],
    ];
  }

  /* ******************************* */

  static List<List<List<int>>> get m {
    return [
      NumMatrix.n0,
      NumMatrix.n1,
      NumMatrix.n2,
      NumMatrix.n3,
      NumMatrix.n4,
      NumMatrix.n5,
      NumMatrix.n6,
      NumMatrix.n7,
      NumMatrix.n8,
      NumMatrix.n9,
      NumMatrix.none,
      NumMatrix.signMinus,
    ];
  }

  static List<List<int>> get n0 {
    return [
      [0, 4, 4, 1],
      [5, 0, 1, 5],
      [5, 5, 5, 5],
      [5, 5, 5, 5],
      [5, 5, 5, 5],
      [5, 5, 5, 5],
      [5, 3, 2, 5],
      [3, 4, 4, 2],
    ];
  }

  static List<List<int>> get n1 {
    return [
      [0, 4, 1, 10],
      [3, 1, 5, 10],
      [10, 5, 5, 10],
      [10, 5, 5, 10],
      [10, 5, 5, 10],
      [10, 5, 5, 10],
      [0, 2, 3, 1],
      [3, 4, 4, 2],
    ];
  }

  static List<List<int>> get n2 {
    return [
      [0, 4, 4, 1],
      [3, 4, 1, 5],
      [10, 10, 5, 5],
      [0, 4, 2, 5],
      [5, 0, 4, 2],
      [5, 5, 10, 10],
      [5, 3, 4, 1],
      [3, 4, 4, 2],
    ];
  }

  static List<List<int>> get n3 {
    return [
      [0, 4, 4, 1],
      [3, 4, 1, 5],
      [10, 10, 5, 5],
      [0, 4, 2, 7],
      [3, 4, 1, 8],
      [10, 10, 5, 5],
      [0, 4, 2, 5],
      [3, 4, 4, 2],
    ];
  }

  static List<List<int>> get n4 {
    return [
      [0, 1, 10, 10],
      [5, 5, 10, 10],
      [5, 5, 0, 1],
      [5, 5, 5, 5],
      [5, 3, 2, 5],
      [3, 4, 1, 5],
      [10, 10, 5, 5],
      [10, 10, 3, 2],
    ];
  }

  static List<List<int>> get n5 {
    return [
      [0, 4, 4, 1],
      [5, 0, 4, 2],
      [5, 5, 10, 10],
      [5, 3, 4, 1],
      [3, 4, 1, 5],
      [10, 10, 5, 5],
      [0, 4, 2, 5],
      [3, 4, 4, 2],
    ];
  }

  static List<List<int>> get n6 {
    return [
      [0, 4, 4, 1],
      [5, 0, 4, 2],
      [5, 5, 10, 10],
      [5, 3, 4, 1],
      [5, 0, 1, 5],
      [5, 5, 5, 5],
      [5, 3, 2, 5],
      [3, 4, 4, 2],
    ];
  }

  static List<List<int>> get n7 {
    return [
      [0, 4, 4, 1],
      [3, 4, 1, 5],
      [10, 10, 7, 7],
      [10, 9, 9, 10],
      [10, 5, 5, 10],
      [10, 5, 5, 10],
      [10, 5, 5, 10],
      [10, 3, 2, 10],
    ];
  }

  static List<List<int>> get n8 {
    return [
      [0, 4, 4, 1],
      [5, 0, 1, 5],
      [5, 5, 5, 5],
      [6, 3, 2, 7],
      [9, 0, 1, 8],
      [5, 5, 5, 5],
      [5, 3, 2, 5],
      [3, 4, 4, 2],
    ];
  }

  static List<List<int>> get n9 {
    return [
      [0, 4, 4, 1],
      [5, 0, 1, 5],
      [5, 5, 5, 5],
      [5, 3, 2, 5],
      [3, 4, 1, 5],
      [0, 1, 5, 5],
      [5, 3, 2, 5],
      [3, 4, 4, 2],
    ];
  }

  static List<List<int>> get none {
    return [
      [10, 10, 10, 10],
      [10, 10, 10, 10],
      [10, 10, 10, 10],
      [10, 10, 10, 10],
      [10, 10, 10, 10],
      [10, 10, 10, 10],
      [10, 10, 10, 10],
      [10, 10, 10, 10],
    ];
  }

  static List<List<int>> get signMinus {
    return [
      [10, 10, 10, 10],
      [10, 10, 10, 10],
      [10, 10, 10, 10],
      [0, 4, 4, 1],
      [3, 4, 4, 2],
      [10, 10, 10, 10],
      [10, 10, 10, 10],
      [10, 10, 10, 10],
    ];
  }
}
