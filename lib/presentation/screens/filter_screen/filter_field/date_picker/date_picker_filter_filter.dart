import 'dart:async';

import 'package:flutter/material.dart';
import 'date_picker_widget.dart';
import '/app/persian_date_time.dart';
import '../base/base_filter_field.dart';

class DatePickerFilterField extends FilterField<PersianDateTime> {
  final _defaultValue = PersianDateTime.now();
  PersianDateTime _value = PersianDateTime.now();
  final _datePickerStream = StreamController<PersianDateTime>.broadcast();
  DatePickerFilterField({PersianDateTime? value}) {
    _value = value ?? _defaultValue;
  }

  @override
  PersianDateTime get defaultValue => _defaultValue;

  @override
  PersianDateTime get value => _value;

  set value(PersianDateTime data) {
    _value = data;
    _datePickerStream.add(data);
  }

  @override
  Widget getWidget() => DatePickerWidget(
      onChange: (dateTime) {
        _value = dateTime;
      },
      dateTime: value, refreshData: _datePickerStream.stream,);

  @override
  bool validate() {
    return true;
  }

  DatePickerFilterField copyWith({PersianDateTime? value}) => DatePickerFilterField(
      value: value != null ? value.copyWith() : this.value.copyWith());
}
