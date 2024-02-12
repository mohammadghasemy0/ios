import 'dart:async';
import '../filter_field/base/base_filter_field.dart';

abstract class FilterModel<T> {
  Map<String, FilterField> get items;

  final _onDataChange = StreamController<void>.broadcast();

  set items(Map<String, FilterField> newItems);

  bool validation();

  T getRequest();

  FilterModel clone();

  final String title;

  FilterModel(this.title);

  Sink get onDataChangeInput => _onDataChange.sink;

  Stream<void> get onDataChangeOutput => _onDataChange.stream;

  void dispose(){
    _onDataChange.close();
  }
}