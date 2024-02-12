import 'package:flutter/material.dart';
import 'package:kiano/data/mapper/mapper.dart';
import '../../../../domain/model/model.dart';
import '../../../../domain/usecase/material/material_mine_daily_rep_usecase.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '../../filter_screen/filter_model/material/mine_daily_rep_filter_model.dart';
import '../../module/base_module_view_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';
import '/presentation/common/widget/report_card_view.dart';
import '../../../../domain/usecase/material/material_bill_rep_by_car_usecase.dart';

class MaterialMineDailyRepViewModel extends ReportsViewModel
    with MaterialMineDailyRepViewModelInput, MaterialMineDailyRepViewModelOutput {
  final MaterialMineDailyRepUseCase _useCase;

  MaterialMineDailyRepViewModel(this._useCase);

  MineDailyRepFilterModel billRepFilterModel = MineDailyRepFilterModel("روزانه معدن");

  @override
  void start() async {
    getData();
  }

  @override
  FilterModel get filterModel => billRepFilterModel;

  @override
  set filterModel(filterModel) {
    billRepFilterModel = filterModel;
  }


  @override
  Future<void> getData() async {
    header = null;
    reportItemData = [];

    refreshDataInput.add(RefreshState.loading);

    (await _useCase.execute(billRepFilterModel.getRequest())).fold((l) => refreshDataInput.add(RefreshState.error),
            (r) {
          reportItemData =
              r.toReportItemDataList();
          refreshDataInput.add(RefreshState.hasData);
        });
  }

  @override
  List<int> get shimmerCardRowCount => [5,5,5];
}

abstract class MaterialMineDailyRepViewModelInput {}

abstract class MaterialMineDailyRepViewModelOutput {}
