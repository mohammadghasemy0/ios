extension NonNullString on String? {
  String orEmpty() => this == null ? EMPTY: this!;
}

extension NonNullInteger on int? {
  int orZero() => this == null ? ZERO: this!;
}



const int ZERO = 0;
const String EMPTY = "";