import '/data/mapper/mapper.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '../../filter_screen/filter_model/material/bill_rep_by_car_filter_model.dart';
import '../../module/base_module_view_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';
import '/domain/usecase/material/material_bill_rep_by_car_usecase.dart';

class MaterialBillRepByCarViewModel extends ReportsViewModel
    with
        MaterialBillRepByCarViewModelInput,
        MaterialBillRepByCarViewModelOutput {
  final MaterialBillRepByCarUseCase _useCase;
  BillRepByCarFilterModel billRepFilterModel = BillRepByCarFilterModel("به تفکیک خودرو");

  MaterialBillRepByCarViewModel(this._useCase);

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
  List<int> get shimmerCardRowCount => [2,2,2,2,2];
}

abstract class MaterialBillRepByCarViewModelInput {}

abstract class MaterialBillRepByCarViewModelOutput {}
