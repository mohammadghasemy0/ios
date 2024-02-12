import '../../filter_screen/filter_model/material/bill_rep_filter_model.dart';
import '/presentation/screens/filter_screen/filter_model/base_filter_model.dart';
import '../base_reporter_view_model.dart';

class ManagerReportViewModel extends ReportsViewModel {
  final _managerFilterModel = BillRepFilterModel("مدیریت");

  @override
  void start() {
  }

  @override
  FilterModel get filterModel => _managerFilterModel;

  @override
  set filterModel(filterModel) {
  }

  @override
  Future<void> getData() {
    throw UnimplementedError();
  }

}