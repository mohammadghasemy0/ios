import 'package:flutter/material.dart';
import '/app/persian_date_time.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget(
      {Key? key,
        required this.onChange,
        required this.dateTime, this.firstDateTime, this.lastDateTime,})
      : super(key: key);
  final PersianDateTime dateTime;
  final PersianDateTime? firstDateTime;
  final PersianDateTime? lastDateTime;
  final Function(PersianDateTime dateTime) onChange;

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  late PersianDateTime dateTime;
  late Function(PersianDateTime dateTime) onChange;

  @override
  void initState() {
    dateTime = widget.dateTime;
    onChange = widget.onChange;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    dateController.text = dateTime.toString();
    timeController.text = "${dateTime.hour}:${dateTime.minute}";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              readOnly: true,
              onTap: () async {
                final res = await showPersianDateTimePicker(
                  context,
                  initialDate: dateTime,
                  firstDate: widget.firstDateTime ?? PersianDateTime.now(),
                  lastDate: widget.lastDateTime ?? PersianDateTime(year: PersianDateTime.now().year + 3),
                );
                if (res != null) {
                  setState(() {
                    dateTime.year = res.year;
                    dateTime.month = res.month;
                    dateTime.day = res.day;
                    dateController.text = dateTime.toString();
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
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              readOnly: true,
              onTap: () async {
                final res = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (res != null) {
                  setState(() {
                    dateTime.hour = res.hour;
                    dateTime.minute = res.minute;
                    timeController.text = "${dateTime.hour}:${dateTime.minute}";
                    onChange(dateTime);
                  });
                }
              },
              textAlign: TextAlign.end,
              controller: timeController,
              decoration: const InputDecoration(
                labelText: "زمان",
                suffixIcon: Icon(Icons.access_time),
              ),
            ),
          )
        ],
      ),
    );
  }
}