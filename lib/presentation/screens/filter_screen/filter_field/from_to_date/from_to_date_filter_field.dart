import 'package:flutter/material.dart';
import 'from_to_date_widget.dart';
import '/app/persian_date_time.dart';
import '../base/base_filter_field.dart';

class FromToDateFilterField extends FilterField<FromToDateValueObject> {
  final _defaultValue = FromToDateValueObject(
      PersianDateTime.now(), PersianDateTime.now());
  late final FromToDateValueObject _value;

  FromToDateFilterField({FromToDateValueObject? value}) {
    _value = value ?? _defaultValue;
  }

  @override
  FromToDateValueObject get defaultValue => _defaultValue;

  @override
  FromToDateValueObject get value => _value;

  @override
  Widget getWidget() => FromToDateWidget(
      onChange: (start, end) {
        _value.start = start;
        _value.end = end;
      },
      start: value.start,
      end: value.end);

  @override
  bool validate() {
    return true;
  }

  FromToDateFilterField copyWith({FromToDateValueObject? value}) =>
      FromToDateFilterField(
          value: value != null ? value.copyWith() : this.value.copyWith());
}

class FromToDateValueObject {
  PersianDateTime start;
  PersianDateTime end;

  FromToDateValueObject(this.start, this.end);

  FromToDateValueObject copyWith(
          {PersianDateTime? start, PersianDateTime? end}) =>
      FromToDateValueObject(
          start != null ? start.copyWith() : this.start.copyWith(),
          end != null ? end.copyWith() : this.end.copyWith());
}
