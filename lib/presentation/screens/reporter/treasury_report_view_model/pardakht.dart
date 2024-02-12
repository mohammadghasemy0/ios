import 'package:kiano/data/mapper/mapper.dart';
import '../../../../domain/usecase/khazane/treasury_pardakht_rep_usecase.dart';
import '../../module/base_module_view_model.dart';
import '/presentation/screens/filter_screen/filter_model/treasury/daryaft_and_pardakht.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class TreasuryPardakhtRepViewModel extends ReportsViewModel
    with TreasuryPardakhtRepViewModelInput, TreasuryPardakhtRepViewModelOutput {
  final TreasuryPardakhtRepUseCase _useCase;
  TreasuryDaryaftAndPardakhtFilterModel _filterModel = TreasuryDaryaftAndPardakhtFilterModel("پرداخت");

  TreasuryPardakhtRepViewModel(this._useCase);

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
            r.toReportItemDataListPardakht();
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

abstract class TreasuryPardakhtRepViewModelInput {}

abstract class TreasuryPardakhtRepViewModelOutput {}
