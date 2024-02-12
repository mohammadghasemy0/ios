import 'package:kiano/data/mapper/mapper.dart';
import '../../module/base_module_view_model.dart';
import '/domain/usecase/concrete/concrete_sale_detailed_rep.dart';
import '../../filter_screen/filter_model/concrete/sale_detailed.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class ConcreteSaleDetailedViewModel extends ReportsViewModel
    with ConcreteSaleDetailedViewModelInput, ConcreteSaleDetailedViewModelOutput {
  final ConcreteSaleDetailedRepUseCase _useCase;
  ConcreteSaleDetailedFilterModel _filterModel = ConcreteSaleDetailedFilterModel("ریز فروش");

  ConcreteSaleDetailedViewModel(this._useCase);

  @override
  void start() async {
    getData();
  }

  @override
  getData() async {
    header = null;
    reportItemData = [];

    refreshDataInput.add(RefreshState.loading);

    (await _useCase.execute(_filterModel.getRequest())).fold((l) => refreshDataInput.add(RefreshState.error),
            (r) {
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

abstract class ConcreteSaleDetailedViewModelInput {}

abstract class ConcreteSaleDetailedViewModelOutput {}
