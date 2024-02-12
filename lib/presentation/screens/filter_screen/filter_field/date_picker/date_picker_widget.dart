import 'package:flutter/material.dart';
import '/app/persian_date_time.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget(
      {Key? key,
      required this.onChange,
      required this.dateTime,
      this.refreshData})
      : super(key: key);
  final PersianDateTime dateTime;
  final Function(PersianDateTime dateTime) onChange;
  Stream<PersianDateTime>? refreshData;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  final TextEditingController dateController = TextEditingController();
  late PersianDateTime dateTime;
  late Function(PersianDateTime dateTime) onChange;

  @override
  void initState() {
    dateTime = widget.dateTime;
    onChange = widget.onChange;
    super.initState();
    if(widget.refreshData != null){
      widget.refreshData!.listen((event) {setState(() {
        dateTime = event;
      });});
    }

  }

  @override
  Widget build(BuildContext context) {
    dateController.text = dateTime.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        readOnly: true,
        onTap: () async {
          final res = await showPersianDateTimePicker(
            context,
            initialDate: dateTime,
            firstDate: PersianDateTime(year: 1380),
            lastDate: PersianDateTime.now(),
          );
          if (res != null) {
            setState(() {
              dateTime = res;
              onChange(dateTime);
            });
          }
        },
        textAlign: TextAlign.end,
        controller: dateController,
        decoration: const InputDecoration(
          labelText: "تاریخ",
          suffixIcon: Icon(Icons.date_range),
        ),
      ),
    );
  }
}
