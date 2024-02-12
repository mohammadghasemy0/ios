import 'package:flutter/material.dart';
import '/presentation/screens/filter_screen/filter_field/base/base_filter_field.dart';
import 'text_field_widget.dart';

class TextFieldFilterField extends FilterField<String> {
  final String title;
  final String hint;
  final int? maxLines;
  final TextInputType? inputType;
  String _value = "";


  TextFieldFilterField({this.maxLines, this.inputType,String? value, this.title = 'عنوان', this.hint = ""}) {
    if(value != null){
      _value = value;
    }
  }

  @override
  String get defaultValue => "";

  @override
  String get value => _value;

  @override
  Widget getWidget() => TextFieldWidget(
        label: title,
        hint: hint,
        value: _value,
        maxLines: maxLines,
        inputType: inputType,
        onChange: (value) {
          _value = value;
        },
      );

  @override
  bool validate() {
    return true;
  }

  TextFieldFilterField copyWith({String? title, String? value}) =>
      TextFieldFilterField(value: value ?? _value, title: title ?? this.title);
}
