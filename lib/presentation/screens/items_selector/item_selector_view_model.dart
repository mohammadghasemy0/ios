import 'dart:async';
import '/presentation/base/base_view_model.dart';

class ItemsSelectorViewModel extends BaseViewModel
    with ItemsSelectorViewModelInputs, ItemsSelectorViewModelOutputs {
  final changeStreamController = StreamController<void>.broadcast();
  Map<String, dynamic> items = {};
  Map<String, dynamic> selectedItems = {};
  Map<String, dynamic> validItems = {};
  bool multiSelect = false;

  @override
  void start() {
    validItems = Map<String, dynamic>.of(items);
    changeStreamInput.add(null);
  }

  onChangeSearchString(String value) {
    final List<String> keys = items.keys.toList();
    validItems = {};
    for (String key in keys) {
      if (key.contains(value)) {
        validItems[key] = items[key];
      }
    }
    changeStreamInput.add(null);
  }

  onSelectItem(String key, bool isChecked) {

    if (isChecked) {
      if(!multiSelect){
        selectedItems.clear();
      }
      selectedItems[key] = items[key];
    } else {
      selectedItems.remove(key);
    }
    changeStreamInput.add(null);
  }

  bool isChecked(String key) => selectedItems.containsKey(key);

  @override
  Stream<void> get changeStreamOutput => changeStreamController.stream;

  @override
  Sink<void> get changeStreamInput => changeStreamController.sink;
}

abstract class ItemsSelectorViewModelOutputs {
  Stream<void> get changeStreamOutput;
}

abstract class ItemsSelectorViewModelInputs {
  Sink<void> get changeStreamInput;
}
