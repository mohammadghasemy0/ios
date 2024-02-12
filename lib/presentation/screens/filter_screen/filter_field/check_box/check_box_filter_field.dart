import 'dart:async';

import 'package:flutter/material.dart';
import '/presentation/screens/filter_screen/filter_field/base/base_filter_field.dart';
import 'check_box_widget.dart';

class CheckBoxFilterField extends FilterField<bool> {
  final String title;
  late bool _value;
  final Function(bool value)? onChange;
  final _checkBoxStream = StreamController<bool>.broadcast();

  CheckBoxFilterField({this.onChange, bool value = false, this.title = 'عنوان'}) {
    _value = value;
  }

  @override
  bool get defaultValue => false;

  @override
  bool get value => _value;

  set value(bool isChecked) {
  _value = isChecked;
  _checkBoxStream.add(isChecked);
  }

  @override
  Widget getWidget() => CheckBoxWidget(
        title: title,
        isChecked: _value,
        onChange: (value) {
          _value = value;
          if(onChange != null){
            onChange!(_value);
          }
        },
    refreshData: _checkBoxStream.stream,
      );

  @override
  bool validate() {
    return true;
  }

  CheckBoxFilterField copyWith({String? title, bool? value}) =>
      CheckBoxFilterField(value: value ?? _value, title: title ?? this.title);
}
