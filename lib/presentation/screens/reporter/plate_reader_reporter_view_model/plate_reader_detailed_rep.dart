import '/data/mapper/mapper.dart';
import '/domain/usecase/plate_reader/plate_reader_detailed_rep_usecase.dart';
import '../../module/base_module_view_model.dart';
import '/presentation/screens/filter_screen/filter_model/pelak_khan/totaled_rep.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class PlateReaderDetailedViewModel extends ReportsViewModel
    with PPlateReaderDetailedViewModelInput, PlateReaderDetailedViewModelOutput {
  final PlateReaderDetailedRepUseCase _useCase;
  PlateReaderTotaledRepFilterModel detailedFilterModel = PlateReaderTotaledRepFilterModel("ریز تردد");

  PlateReaderDetailedViewModel(this._useCase);

  @override
  void start() async {
    getData();
  }

  @override
  getData() async {
    header = null;
    reportItemData = [];
    refreshDataInput.add(RefreshState.loading);
    (await _useCase.execute(detailedFilterModel.getRequest()))
        .fold((l) => refreshDataInput.add(RefreshState.error), (r) {
      if(r != null){
        reportItemData =
            r.toReportItemDataList();
      }
      refreshDataInput.add(RefreshState.hasData);
    });
  }

  @override
  FilterModel get filterModel => detailedFilterModel;

  @override
  set filterModel(filterModel) {
    detailedFilterModel = filterModel;
  }

  @override
  List<int> get shimmerCardRowCount => [2,2,2,2,2,2,2];
}

abstract class PPlateReaderDetailedViewModelInput {}

abstract class PlateReaderDetailedViewModelOutput {}
