import 'package:flutter/material.dart';

abstract class FilterField<T> {
  bool validate();

  Widget getWidget();

  T get value;

  T? get defaultValue;
}
