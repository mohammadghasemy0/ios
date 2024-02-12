import '../../module/base_module_view_model.dart';
import '/domain/usecase/concrete/concrete_sale_by_product_rep.dart';
import '../../filter_screen/filter_model/concrete/by_product.dart';
import '/data/mapper/mapper.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class ConcreteSaleByProductRepViewModel extends ReportsViewModel
    with ConcreteSaleByProductRepViewModelInput, ConcreteSaleByProductRepViewModelOutput {
  final ConcreteSaleByProductRepUseCase _useCase;
  ConcreteRepByProductFilterModel _filterModel = ConcreteRepByProductFilterModel("به تفکیک نوع بتن");

  ConcreteSaleByProductRepViewModel(this._useCase);

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
      if(r != null){
        reportItemData =
            r.toReportItemDataList();
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

abstract class ConcreteSaleByProductRepViewModelInput {}

abstract class ConcreteSaleByProductRepViewModelOutput {}
