import 'package:kiano/data/mapper/mapper.dart';
import '../../filter_screen/filter_model/material/bill_rep_by_customer_filter_model.dart';
import '../../module/base_module_view_model.dart';
import '/domain/usecase/material/material_bill_rep_by_customer_usecase.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class MaterialBillRepByCustomerViewModel extends ReportsViewModel
    with ReporterViewModelInput, ReporterViewModelOutput {
  final MaterialBillRepByCustomerUseCase _useCase;
  BillRepByCustomerFilterModel billRepFilterModel = BillRepByCustomerFilterModel("به تفکیک مشتری");
  MaterialBillRepByCustomerViewModel(this._useCase);

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

    (await _useCase.execute(billRepFilterModel.getRequest()))
        .fold((l) => refreshDataInput.add(RefreshState.error), (r) {
      reportItemData = r.toReportItemDataList();
      refreshDataInput.add(RefreshState.hasData);
    });
  }

}

abstract class ReporterViewModelInput {}

abstract class ReporterViewModelOutput {}
