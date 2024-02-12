import 'package:flutter/material.dart';
import 'date_time_widget.dart';
import '/app/persian_date_time.dart';
import '../base/base_filter_field.dart';

class DateTimeFilterField extends FilterField<PersianDateTime> {
  final PersianDateTime? firstDate;
  final PersianDateTime? lastDate;
  final _defaultValue = PersianDateTime.now();
  late final PersianDateTime _value;

  DateTimeFilterField({this.firstDate, this.lastDate,PersianDateTime? value}) {
    _value = value ?? _defaultValue;
  }

  @override
  PersianDateTime get defaultValue => _defaultValue;

  @override
  PersianDateTime get value => _value;

  @override
  Widget getWidget() => DateTimeWidget(
      onChange: (dateTime) {
        _value.copyWith(
            day: dateTime.day,
            month: dateTime.month,
            year: dateTime.year,
            hour: dateTime.hour,
            minute: dateTime.minute,
            second: dateTime.second);
      },
      firstDateTime: firstDate?? PersianDateTime(year:  1380),
      lastDateTime: lastDate?? PersianDateTime.now(),
      dateTime: value);

  @override
  bool validate() {
    return true;
  }

  DateTimeFilterField copyWith({PersianDateTime? value}) => DateTimeFilterField(
      value: value != null ? value.copyWith() : this.value.copyWith());
}
