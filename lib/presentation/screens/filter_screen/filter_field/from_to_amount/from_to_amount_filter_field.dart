import 'package:flutter/material.dart';
import '/presentation/screens/filter_screen/filter_field/base/base_filter_field.dart';
import '/presentation/screens/filter_screen/filter_field/from_to_amount/from_to_amount_widget.dart';

class FromToAmountFilterField extends FilterField<FromToAmountValueObject> {
  final _defaultValue = FromToAmountValueObject();
  late final FromToAmountValueObject _value;
  final String minLabel;
  final String maxLabel;
  final String label;

  FromToAmountFilterField({
    FromToAmountValueObject? value,
    this.minLabel = 'از',
    this.maxLabel = 'تا',
    this.label = 'عنوان',
  }) {
    _value = value ?? defaultValue;
  }

  @override
  FromToAmountValueObject get defaultValue => _defaultValue;

  @override
  FromToAmountValueObject get value => _value;

  @override
  Widget getWidget() => FromToAmount(
      minLabel: minLabel,
      maxLabel: maxLabel,
      label: label,
      value: value,
      onChange: (flag, min, max) {
        value.minValue = min;
        value.maxValue = max;
        value.isChecked = flag;
      });

  @override
  bool validate() {
    return true;
  }

  FromToAmountFilterField copyWith(
          {
            FromToAmountValueObject? value,
            String? minLabel,
            String? maxLabel,
            String? label
          }) =>
      FromToAmountFilterField(
        value: value != null ? value.copyWith() : this.value.copyWith(),
        minLabel: minLabel ?? this.minLabel,
        maxLabel: maxLabel ?? this.maxLabel,
        label: label ?? this.label,
      );
}

class FromToAmountValueObject {
  bool isChecked;
  String minValue;
  String maxValue;

  FromToAmountValueObject(
      {this.minValue = '0', this.maxValue = '0', this.isChecked = false});

  FromToAmountValueObject copyWith(
          {bool? isChecked, String? minValue, String? maxValue}) =>
      FromToAmountValueObject(
          isChecked: isChecked ?? this.isChecked,
          minValue: minValue ?? this.minValue,
          maxValue: maxValue ?? this.maxValue);
}
