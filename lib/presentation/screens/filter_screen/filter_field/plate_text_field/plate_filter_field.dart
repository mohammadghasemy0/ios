import 'package:flutter/material.dart';
import '/domain/model/model.dart';
import 'plate_widget.dart';
import '../base/base_filter_field.dart';

class PlateFilterField extends FilterField<CarPlate> {
  final _defaultValue = CarPlate(12, "الف", 345, 67);
  late CarPlate _value;

  PlateFilterField({CarPlate? value}) {
    _value = value ?? _defaultValue;
  }

  @override
  CarPlate get defaultValue => _defaultValue;

  @override
  CarPlate get value => _value;

  @override
  Widget getWidget() => PlateWidget(
      onChange: (plate) {
        _value = plate;
      },
      plate: value);

  @override
  bool validate() {
    return true;
  }

  PlateFilterField copyWith({CarPlate? value}) => PlateFilterField(
      value: value ?? this.value);
}
