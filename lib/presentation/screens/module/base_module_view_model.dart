import 'dart:async';
import 'package:flutter/material.dart';

import '../../common/widget/custom_button.dart';
import '/domain/model/model.dart';
import '/presentation/base/base_view_model.dart';

enum RefreshState {
  loading,
  hasData,
  isEmpty,
  error,
}

abstract class ModuleViewModel extends BaseViewModel
    with ModuleViewModelInputs, ModuleViewModelOutputs {

  final StreamController<RefreshState> _refreshStreamController = StreamController<RefreshState>.broadcast();
  List<ReportItemData> reportItemData = [];
  List<ChartItemData> chartItemData = [];
  List<ReportListViewData> get reportListViewData;
  List<CustomButtonData> get buttons;
  String get moduleName;
  String dataBaseName = "";
  int get shimmerChartCount;
  List<int> get shimmerCardRowCount;

  onReportItemSelect(ReportListViewItem item) {

  }

  @override
  Sink get refreshStreamInput => _refreshStreamController.sink;

  @override
  Stream<RefreshState> get refreshStreamOutput => _refreshStreamController.stream;

}

abstract class ModuleViewModelInputs {
  Sink get refreshStreamInput;
}

abstract class ModuleViewModelOutputs {
  Stream<RefreshState> get refreshStreamOutput;
}
