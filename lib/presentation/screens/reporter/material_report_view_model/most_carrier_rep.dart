import '/data/mapper/mapper.dart';
import '/presentation/screens/filter_screen/filter_model/material/most_carrier_rep_filter_model.dart';
import '../../module/base_module_view_model.dart';
import '/domain/usecase/material/material_mine_most_carrier_rep_usecase.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class MaterialMostCarrierRepViewModel extends ReportsViewModel
    with MaterialMostCarrierRepViewModelInput, MaterialMostCarrierRepViewModelOutput {
  final MaterialMostCarrierRepUseCase _useCase;

  MaterialMostCarrierRepViewModel(this._useCase);

  MostCarrierRepFilterModel billRepFilterModel = MostCarrierRepFilterModel("بیشترین حمل کننده");

  @override
  void start() async {
    getData();
  }

  @override
  FilterModel get filterModel => billRepFilterModel;

  @override
  set filterModel(filterModel) {
    billRepFilterModel = filterModel;
  }


  @override
  Future<void> getData() async {
    header = null;
    reportItemData = [];
    refreshDataInput.add(RefreshState.loading);

    (await _useCase.execute(billRepFilterModel.getRequest())).fold((l) => refreshDataInput.add(RefreshState.error),
            (r) {
              reportItemData =
                  r.toReportItemDataList();
          refreshDataInput.add(RefreshState.hasData);
        });
  }

  @override
  List<int> get shimmerCardRowCount => [3,3,3,3];
}

abstract class MaterialMostCarrierRepViewModelInput {}

abstract class MaterialMostCarrierRepViewModelOutput {}
