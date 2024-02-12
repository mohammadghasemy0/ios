import 'package:flutter/material.dart';
import '/presentation/screens/filter_screen/filter_field/selectable_items/selectable_items_widget.dart';
import '/presentation/screens/filter_screen/filter_field/base/base_filter_field.dart';

class SelectableItemsFilterField extends FilterField<Map<String, dynamic>> {
  final String title;
  late final Map<String, dynamic> _items;
  late final Map<String, dynamic> _selectedItems;
  final bool multiSelect;
  final void Function(SelectableItemsFilterField snapShot)? onDataChange;

  SelectableItemsFilterField(
      {required Map<String, dynamic> items,
      Map<String, dynamic>? selectedItems,
      this.title = 'عنوان',
      this.multiSelect = false,
      this.onDataChange}) {
    _selectedItems = selectedItems ?? {};
    _items = items;
  }

  @override
  Map<String, dynamic>? get defaultValue => Map.from(_selectedItems);

  @override
  Widget getWidget() => SelectableItemsWidget(
        title: title,
        items: Map<String, dynamic>.from(_items),
        selectedItems: Map<String, dynamic>.from(_selectedItems),
        multiSelect: multiSelect,
        onChange: (value) {
          _selectedItems.clear();
          _selectedItems.addAll(value);
          if(onDataChange != null){
            onDataChange!(copyWith());
          }
        },
      );

  @override
  bool validate() {
    return true;
  }

  SelectableItemsFilterField copyWith(
      {String? title,
      Map<String, dynamic>? items,
      Map<String, dynamic>? selectedItems,
      bool? multiSelect}) {
    return SelectableItemsFilterField(
        title: title ?? this.title,
        items: Map.from(items ?? _items),
        selectedItems: Map.from(selectedItems ?? _selectedItems),
        multiSelect: multiSelect ?? this.multiSelect, onDataChange: onDataChange);
  }

  @override
  Map<String, dynamic> get value => _selectedItems;
}
