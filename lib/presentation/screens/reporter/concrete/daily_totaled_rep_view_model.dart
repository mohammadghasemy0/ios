import '../../module/base_module_view_model.dart';
import '/domain/usecase/concrete/concrete_sale_daily_totaled_rep.dart';
import '/presentation/screens/filter_screen/filter_model/concrete/daily_totaled.dart';
import '/data/mapper/mapper.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class ConcreteDailyTotaledRepViewModel extends ReportsViewModel
    with ConcreteDailyTotaledRepViewModelInput, ConcreteDailyTotaledRepViewModelOutput {
  final ConcreteSaleDailyTotaledRepUseCase _useCase;
  ConcreteDailyTotaledFilterModel _filterModel = ConcreteDailyTotaledFilterModel("تجمیعی روزانه");

  ConcreteDailyTotaledRepViewModel(this._useCase);

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

abstract class ConcreteDailyTotaledRepViewModelInput {}

abstract class ConcreteDailyTotaledRepViewModelOutput {}
