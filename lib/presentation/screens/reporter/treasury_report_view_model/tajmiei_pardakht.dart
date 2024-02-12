import '/data/mapper/mapper.dart';
import '/domain/usecase/khazane/treasury_tajmi_pardakht_rep_usecase.dart';
import '/presentation/screens/filter_screen/filter_model/treasury/daryaft_and_pardakht_betafkikhesab_or_tajmiei.dart';
import '../../module/base_module_view_model.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class TreasuryTajmieiPardakhtRepViewModel extends ReportsViewModel
    with
        TreasuryTajmieiPardakhtRepViewModelInput,
        TreasuryTajmieiPardakhtRepViewModelOutput {
  final TreasuryTajmieiPardakhtRepUseCase _useCase;
  TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiFilterModel _filterModel =
      TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiFilterModel("تجمیعی پرداخت");

  TreasuryTajmieiPardakhtRepViewModel(this._useCase);

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

  @override
  List<int> get shimmerCardRowCount => [4];
}

abstract class TreasuryTajmieiPardakhtRepViewModelInput {}

abstract class TreasuryTajmieiPardakhtRepViewModelOutput {}
