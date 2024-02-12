import 'package:flutter/cupertino.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class PersianDateTime {
  int year;
  int month;
  int day;
  int hour;
  int minute;
  int second;

  PersianDateTime(
      {this.year = 1400,
      this.month = 1,
      this.day = 1,
      this.hour = 0,
      this.minute = 0,
      this.second = 0});

  factory PersianDateTime.now() {
    final pDate = Jalali.fromDateTime(DateTime.now());
    final time = DateTime.now();
    return PersianDateTime(
        year: pDate.year,
        month: pDate.month,
        day: pDate.day,
        hour: time.hour,
        minute: time.minute,
        second: time.second);
  }

  factory PersianDateTime.fromDateTime(DateTime date) {
    final pDate = Jalali.fromDateTime(date);
    return PersianDateTime(
        year: pDate.year,
        month: pDate.month,
        day: pDate.day,
        hour: pDate.hour,
        minute: pDate.minute,
        second: pDate.second);
  }

  PersianDateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
  }) =>
      PersianDateTime(
        year: year ?? this.year,
        month: month ?? this.month,
        day: day ?? this.day,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
        second: second ?? this.second,
      );

  @override
  String toString() =>
      "$year/${month > 9 ? month : '0$month'}/${day > 9 ? day : '0$day'}";

  String get time => "$hour:$minute";

  PersianDateTime subtract(Duration duration) =>
      PersianDateTime.fromDateTime(DateTime.now().subtract(duration));
// 2023-06-19T09:47:54.000
  DateTime toDateTime() =>
      Jalali(year, month, day, hour, minute, second).toDateTime();

  factory PersianDateTime.fromString(String lockDate) {
    final List<String> list = lockDate.split("/");
    try{
      return PersianDateTime(
        year: int.parse(list[0]),
        month: int.parse(list[1]),
        day: int.parse(list[2]),
      );
    }catch(error){
      return PersianDateTime.now();
    }
  }
}

Future<PersianDateTime?> showPersianDateTimePicker(
  BuildContext context, {
  PersianDateTime? initialDate,
  PersianDateTime? firstDate,
  PersianDateTime? lastDate,
}) async {
  final res = await showPersianDatePicker(
    context: context,
    initialDate: initialDate != null
        ? Jalali.fromDateTime(initialDate.toDateTime())
        : Jalali.now(),
    firstDate: firstDate != null
        ? Jalali.fromDateTime(firstDate.toDateTime())
        : Jalali(1380),
    lastDate: lastDate != null
        ? Jalali.fromDateTime(lastDate.toDateTime())
        : Jalali.now(),
  );

  if (res != null) {
    return PersianDateTime(
        year: res.year,
        month: res.month,
        day: res.day,
        hour: res.hour,
        minute: res.minute,
        second: res.second);
  }

  return null;
}
