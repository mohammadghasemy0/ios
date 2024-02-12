import 'package:flutter/material.dart';
import '/presentation/resources/routes_manager.dart';

class SelectableItemsWidget extends StatefulWidget {
  const SelectableItemsWidget(
      {Key? key,
      this.title = 'عنوان',
      required this.items,
      required this.selectedItems,
      this.multiSelect = false,
      this.onChange})
      : super(key: key);
  final String title;
  final Map<String, dynamic> items;
  final Map<String, dynamic> selectedItems;
  final bool multiSelect;
  final Function(Map<String, dynamic> value)? onChange;

  @override
  State<SelectableItemsWidget> createState() => _SelectableItemsWidgetState();
}

class _SelectableItemsWidgetState extends State<SelectableItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(widget.title),
          Expanded(
              child: Text(
            widget.selectedItems.isEmpty
                ? 'انتخاب نشده'
                : widget.selectedItems.length > 1
                    ? '${widget.selectedItems.length.toString()} مورد'
                    : (widget.selectedItems.keys.toList())[0],
            textAlign: TextAlign.end,
          )),
          IconButton(
              onPressed: onTap, icon: const Icon(Icons.navigate_next_rounded))
        ],
      ),
    );
  }

  onTap() async {
    final res = await Navigator.of(context).pushNamed(Routes.itemsSelectorRoute,
        arguments: [
          widget.title,
          Map<String, dynamic>.from(widget.items),
          Map<String, dynamic>.from(widget.selectedItems),
          widget.multiSelect
        ]);
    if (res != null) {
      setState(() {
        widget.selectedItems.clear();
        widget.selectedItems.addAll(res as Map<String, dynamic>);
        if (widget.onChange != null) {
          widget.onChange!(widget.selectedItems);
        }
      });
    }
  }
}
