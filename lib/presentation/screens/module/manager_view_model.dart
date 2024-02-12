import 'package:flutter/src/widgets/framework.dart';

import '../../resources/routes_manager.dart';
import '/domain/model/model.dart';
import '/presentation/resources/assets_manager.dart';
import 'base_module_view_model.dart';

class ManagerModuleViewModel extends ModuleViewModel {

  ManagerModuleViewModel();

  @override
  final String moduleName = "مدیریت";

  @override
  final List<ReportListViewData> reportListViewData = [];

  @override
  void start() {}

  @override
  List<CustomButtonData> get buttons => [
    CustomButtonData("قفل حساب", ImageAssets.clDbLock, Routes.lockHesabRoute),
  ];

  @override
  List<int> get shimmerCardRowCount => [];

  @override
  int get shimmerChartCount => 0;


}