import '/data/mapper/mapper.dart';
import '../../module/base_module_view_model.dart';
import '/presentation/screens/filter_screen/filter_model/material/incoming_rep_by_car_filter_model.dart';
import '/domain/usecase/material/material_incoming_rep_by_car_usecase.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class MaterialIncomingRepByCarViewModel extends ReportsViewModel
    with MaterialIncomingRepByCarViewModelInput, MaterialIncomingRepByCarViewModelOutput {
  final MaterialIncomingRepByCarUseCase _useCase;

  MaterialIncomingRepByCarViewModel(this._useCase);

  IncomingRepByCarFilterModel billRepFilterModel = IncomingRepByCarFilterModel("ورودی براساس خودرو");

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
  List<int> get shimmerCardRowCount => [2,2,2,2,2,2];
}

abstract class MaterialIncomingRepByCarViewModelInput {}

abstract class MaterialIncomingRepByCarViewModelOutput {}
