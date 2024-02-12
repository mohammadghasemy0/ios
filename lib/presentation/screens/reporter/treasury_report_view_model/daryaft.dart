import 'package:kiano/data/mapper/mapper.dart';
import '../../module/base_module_view_model.dart';
import '/presentation/screens/filter_screen/filter_model/treasury/daryaft_and_pardakht.dart';
import '/domain/usecase/khazane/treasury_daryaft_rep_usecase.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class TreasuryDaryaftRepViewModel extends ReportsViewModel
    with TreasuryDaryaftRepViewModelInput, TreasuryDaryaftRepViewModelOutput {
  final TreasuryDaryaftRepUseCase _useCase;
  TreasuryDaryaftAndPardakhtFilterModel _filterModel = TreasuryDaryaftAndPardakhtFilterModel("دریافت");

  TreasuryDaryaftRepViewModel(this._useCase);

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
            r.toReportItemDataListDaryaft();
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

  @override
  List<int> get shimmerCardRowCount => [8,8];
}

abstract class TreasuryDaryaftRepViewModelInput {}

abstract class TreasuryDaryaftRepViewModelOutput {}
