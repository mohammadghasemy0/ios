import 'package:flutter/material.dart';
import '/app/persian_date_time.dart';

class FromToDateWidget extends StatefulWidget {
  const FromToDateWidget(
      {Key? key,
        required this.onChange,
        required this.start,
        required this.end})
      : super(key: key);
  final PersianDateTime start;
  final PersianDateTime end;
  final Function(PersianDateTime start, PersianDateTime end) onChange;

  @override
  State<FromToDateWidget> createState() => _FromToDateWidgetState();
}

class _FromToDateWidgetState extends State<FromToDateWidget> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  late PersianDateTime start;
  late PersianDateTime end;
  late Function(PersianDateTime start, PersianDateTime end) onChange;

  @override
  void initState() {
    start = widget.start;
    end = widget.end;
    onChange = widget.onChange;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    startDateController.text = start.toString();
    endDateController.text = end.toString();
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
                  initialDate: start,
                );
                if (res != null) {
                  setState(() {
                    start = res;
                    onChange(start, end);
                  });
                }
              },
              textAlign: TextAlign.end,
              controller: startDateController,
              decoration: const InputDecoration(
                labelText: "از تاریخ",
                suffixIcon: Icon(Icons.date_range),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              readOnly: true,
              onTap: () async {
                final res = await showPersianDateTimePicker(context,
                    initialDate: end);
                if (res != null) {
                  setState(() {
                    end = res;
                    onChange(start, end);
                  });
                }
              },
              textAlign: TextAlign.end,
              controller: endDateController,
              decoration: const InputDecoration(
                labelText: "تا تاریخ",
                suffixIcon: Icon(Icons.date_range),
              ),
            ),
          )
        ],
      ),
    );
  }
}