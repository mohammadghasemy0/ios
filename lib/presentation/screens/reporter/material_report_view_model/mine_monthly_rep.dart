import '../../module/base_module_view_model.dart';
import '/data/mapper/mapper.dart';
import '/presentation/screens/filter_screen/filter_model/material/mine_monthly_rep_filter_model.dart';
import '/domain/usecase/material/material_mine_monthly_rep_usecase.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class MaterialMineMonthlyRepViewModel extends ReportsViewModel
    with MaterialMineMonthlyRepViewModelInput, MaterialMineMonthlyRepViewModelOutput {
  final MaterialMineMonthlyRepUseCase _useCase;

  MaterialMineMonthlyRepViewModel(this._useCase);

  MineMonthlyRepFilterModel billRepFilterModel = MineMonthlyRepFilterModel("ماهانه معدن");

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

abstract class MaterialMineMonthlyRepViewModelInput {}

abstract class MaterialMineMonthlyRepViewModelOutput {}
