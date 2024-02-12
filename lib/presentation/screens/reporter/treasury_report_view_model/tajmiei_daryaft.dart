import 'package:kiano/data/mapper/mapper.dart';
import 'package:kiano/domain/usecase/khazane/treasury_tajmi_daryaft_rep_usecase.dart';
import 'package:kiano/presentation/screens/filter_screen/filter_model/treasury/daryaft_and_pardakht_betafkikhesab_or_tajmiei.dart';
import '../../../../domain/usecase/khazane/treasury_daryaft_be_tafkik_hesab_rep_usecase.dart';
import '../../../../domain/usecase/khazane/treasury_pardakht_be_tafkik_hesab_rep_usecase.dart';
import '../../module/base_module_view_model.dart';
import '/presentation/screens/filter_screen/filter_model/treasury/daryaft_and_pardakht.dart';
import '/domain/usecase/khazane/treasury_daryaft_rep_usecase.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class TreasuryTajmieiDaryaftRepViewModel extends ReportsViewModel
    with
        TreasuryTajmieiDaryaftRepViewModelInput,
        TreasuryTajmieiDaryaftRepViewModelOutput {
  final TreasuryTajmieiDaryaftRepUseCase _useCase;
  TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiFilterModel _filterModel =
      TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiFilterModel("تجمیعی دریافت");

  TreasuryTajmieiDaryaftRepViewModel(this._useCase);

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

abstract class TreasuryTajmieiDaryaftRepViewModelInput {}

abstract class TreasuryTajmieiDaryaftRepViewModelOutput {}
