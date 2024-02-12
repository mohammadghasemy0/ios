import '../../module/base_module_view_model.dart';
import '/data/mapper/mapper.dart';
import '/domain/usecase/concrete/concrete_report_by_customer_and_product_rep.dart';
import '../../filter_screen/filter_model/concrete/rep_by_customer_and_product.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class ConcreteReportByCustomerAndProductRepViewModel extends ReportsViewModel
    with
        ConcreteReportByCustomerAndProductRepViewModelInput,
        ConcreteReportByCustomerAndProductRepViewModelOutput {
  final ConcreteReportByCustomerAndProductRepUseCase _useCase;
  ConcreteRepByCustomerAndProductFilterModel _filterModel =
      ConcreteRepByCustomerAndProductFilterModel(
          "به تفکیک مشتری و نوع بتن");

  ConcreteReportByCustomerAndProductRepViewModel(this._useCase);

  @override
  void start() async {
    getData();
  }

  @override
  getData() async {
    header = null;
    reportItemData = [];
    refreshDataInput.add(RefreshState.loading);

    (await _useCase.execute(_filterModel.getRequest()))
        .fold((l) => refreshDataInput.add(RefreshState.error), (r) {
      if (r != null) {
        reportItemData = r.toReportItemDataList();
      }
      refreshDataInput.add(RefreshState.hasData);
    });
  }

  @override
  FilterModel get filterModel => _filterModel;

  @override
  set filterModel(filterModel) {
    _filterModel = filterModel;
  }
}

abstract class ConcreteReportByCustomerAndProductRepViewModelInput {}

abstract class ConcreteReportByCustomerAndProductRepViewModelOutput {}
