import '/data/mapper/mapper.dart';
import '../../module/base_module_view_model.dart';
import '/domain/usecase/plate_reader/plate_reader_totaled_rep_usecase.dart';
import '/presentation/screens/filter_screen/filter_model/pelak_khan/totaled_rep.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class PlateReaderTotaledViewModel extends ReportsViewModel
    with PlateReaderTotaledViewModelInput, PlateReaderTotaledViewModelOutput {
  final PlateReaderTotaledRepUseCase _useCase;
  PlateReaderTotaledRepFilterModel totaledFilterModel = PlateReaderTotaledRepFilterModel("کلی");

  PlateReaderTotaledViewModel(this._useCase);

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
            r.toReportItemDataListTotaled();
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
  List<int> get shimmerCardRowCount => [2,2,2,2,2,2];
}

abstract class PlateReaderTotaledViewModelInput {}

abstract class PlateReaderTotaledViewModelOutput {}
