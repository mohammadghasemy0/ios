import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {Key? key,
      this.hint = "",
      this.onChange,
      this.label = "عنوان",
      required this.value,
      this.controller,
      this.inputType,
      this.maxLines})
      : super(key: key);
  final String hint;
  final String label;
  final String value;
  final int? maxLines;
  final TextInputType? inputType;
  final Function(String value)? onChange;
  final TextEditingController? controller;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: widget.inputType,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hint,
        label: Text(widget.label),
      ),
      onChanged: onChange,
      onTap: () => _controller.selection = TextSelection.collapsed(offset: _controller.text.length),
    );
  }

  void onChange(String value) {
    if (widget.onChange != null) {
      widget.onChange!(value);
    }
  }


}
