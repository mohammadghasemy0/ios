import '/data/mapper/mapper.dart';
import '/domain/usecase/plate_reader/plate_reader_daily_totaled_rep_usecase.dart';
import '../../module/base_module_view_model.dart';
import '/presentation/screens/filter_screen/filter_model/pelak_khan/totaled_rep.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class PlateReaderDailyViewModel extends ReportsViewModel
    with PlateReaderDailyViewModelInput, PlateReaderDailyViewModelOutput {
  final PlateReaderDailyTotaledRepUseCase _useCase;
  PlateReaderTotaledRepFilterModel totaledFilterModel = PlateReaderTotaledRepFilterModel("روزانه");

  PlateReaderDailyViewModel(this._useCase);

  @override
  void start() async {
    getData();
  }

  @override
  getData() async {
    header = null;
    reportItemData = [];
    refreshDataInput.add(RefreshState.loading);

    (await _useCase.execute(totaledFilterModel.getRequest()))
        .fold((l) => refreshDataInput.add(RefreshState.error), (r) {
      if(r != null){
        reportItemData =
            r.toReportItemDataList();
      }
      refreshDataInput.add(RefreshState.hasData);
    });
  }

  @override
  FilterModel get filterModel => totaledFilterModel;

  @override
  set filterModel(filterModel) {
    totaledFilterModel = filterModel;
  }

  @override
  List<int> get shimmerCardRowCount => [3,3,3,3,3,3];
}

abstract class PlateReaderDailyViewModelInput {}

abstract class PlateReaderDailyViewModelOutput {}
