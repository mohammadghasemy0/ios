import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/presentation/screens/filter_screen/filter_field/from_to_amount/from_to_amount_filter_field.dart';

class FromToAmount extends StatefulWidget {
  const FromToAmount(
      {Key? key,
      this.onChange,
      this.minLabel = "از",
      this.maxLabel = "تا",
      this.label = "عنوان",
      required this.value})
      : super(key: key);
  final FromToAmountValueObject value;
  final String minLabel;
  final String maxLabel;
  final String label;
  final Function(bool flag, String min, String max)? onChange;

  @override
  State<FromToAmount> createState() => _FromToAmountState();
}

class _FromToAmountState extends State<FromToAmount> {
  String minValue = "", maxValue = "";
  bool isChecked = false;
  final minAmountController = TextEditingController();
  final maxAmountController = TextEditingController();

  formatter(String text) => text.isNotEmpty
      ? NumberFormat.decimalPattern('en_US')
          .format(int.parse(text.replaceAll(',', '')))
      : "";

  @override
  void initState() {
    minValue = widget.value.minValue;
    maxValue = widget.value.maxValue;
    isChecked = widget.value.isChecked;
    minAmountController.text = minValue;
    maxAmountController.text = maxValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => onChange(!isChecked),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.label),
              Checkbox(
                value: isChecked,
                onChanged: onChange,
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
        if (isChecked)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: minAmountController,
                      onChanged: (text) {
                        text = formatter(text);
                        minAmountController.value = TextEditingValue(
                          text: text,
                          selection:
                              TextSelection.collapsed(offset: text.length),
                        );
                        minValue = text.replaceAll(',', '');
                        if (widget.onChange != null) {
                          widget.onChange!(isChecked, minValue, maxValue);
                        }
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: widget.minLabel),
                      textAlign: TextAlign.end),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                      controller: maxAmountController,
                      onChanged: (text) {
                        text = formatter(text);
                        maxAmountController.value = TextEditingValue(
                          text: text,
                          selection:
                              TextSelection.collapsed(offset: text.length),
                        );
                        maxValue = text.replaceAll(',', '');
                        if (widget.onChange != null) {
                          widget.onChange!(isChecked, minValue, maxValue);
                        }
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: widget.maxLabel),
                      textAlign: TextAlign.end),
                ),
              ],
            ),
          ),
      ],
    );
  }

  void onChange(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
    if (widget.onChange != null) {
      widget.onChange!(isChecked, minValue, maxValue);
    }
  }
}
