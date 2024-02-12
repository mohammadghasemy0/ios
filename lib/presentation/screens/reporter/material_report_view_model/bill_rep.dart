import 'package:kiano/presentation/screens/module/base_module_view_model.dart';

import '../../filter_screen/filter_model/base_filter_model.dart';
import '../../filter_screen/filter_model/material/bill_rep_filter_model.dart';
import '/data/mapper/mapper.dart';
import '/domain/usecase/material/material_bill_rep_usecase.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class MaterialBillRepViewModel extends ReportsViewModel
    with MaterialBillRepViewModelInput, MaterialBillRepViewModelOutput {
  final MaterialBillRepUseCase _useCase;
  BillRepFilterModel billRepFilterModel = BillRepFilterModel("بارنامه");

  MaterialBillRepViewModel(this._useCase);

  @override
  void start() async {
    getData();
  }

  @override
  getData() async {
    header = null;
    reportItemData = [];
    refreshDataInput.add(RefreshState.loading);

    (await _useCase.execute(billRepFilterModel.getRequest()))
        .fold((l) => refreshDataInput.add(RefreshState.error), (r) {
      reportItemData = r.toReportItemDataList();
      refreshDataInput.add(RefreshState.hasData);
    });
  }

  @override
  FilterModel get filterModel => billRepFilterModel;

  @override
  set filterModel(filterModel) {
    billRepFilterModel = filterModel;
  }

  @override
  List<int> get shimmerCardRowCount => [16,16];
}

abstract class MaterialBillRepViewModelInput {}

abstract class MaterialBillRepViewModelOutput {}
