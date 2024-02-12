import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({Key? key, this.isChecked = false, this.onChange, this.title = "عنوان", this.refreshData}) : super(key: key);
  final bool isChecked;
  final Function(bool value)? onChange;
  final String title;
  Stream<bool>? refreshData;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  void initState() {
    isChecked = widget.isChecked;
    super.initState();
    if(widget.refreshData != null){
      widget.refreshData!.listen((event) {setState(() {
        isChecked = event;
      });});
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onChange(!isChecked),
      child: Row(
        children: [
          Expanded(child: Text(widget.title)),
          Checkbox(
            activeColor: Theme.of(context).colorScheme.primary,
            value: isChecked, onChanged: onChange)
        ],
      ),
    );
  }

  void onChange(bool? value){
    setState(() {
      isChecked = value ?? false;
      if(widget.onChange != null){
        widget.onChange!(isChecked);
      }
    });
  }
}
