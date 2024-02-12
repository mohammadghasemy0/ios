import '../../module/base_module_view_model.dart';
import '/domain/usecase/concrete/concrete_mixer_driver_cumulative_rep.dart';
import '/presentation/screens/filter_screen/filter_model/concrete/mixer_driver_detailed.dart';
import '/data/mapper/mapper.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class ConcreteMixerDriverDetailedRepViewModel extends ReportsViewModel
    with ConcreteMixerDriverDetailedRepViewModelInput, ConcreteMixerDriverDetailedRepViewModelOutput {
  final ConcreteMixerDriverDetailedRepUseCase _useCase;
  ConcreteMixerDriverDetailedRepFilterModel _filterModel = ConcreteMixerDriverDetailedRepFilterModel("ریز پمپ");

  ConcreteMixerDriverDetailedRepViewModel(this._useCase);

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

  @override
  List<int> get shimmerCardRowCount => [7,7,7];
}

abstract class ConcreteMixerDriverDetailedRepViewModelInput {}

abstract class ConcreteMixerDriverDetailedRepViewModelOutput {}
