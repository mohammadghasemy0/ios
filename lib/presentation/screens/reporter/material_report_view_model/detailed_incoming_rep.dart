import '/data/mapper/mapper.dart';
import '/presentation/screens/filter_screen/filter_model/material/detailed_incoming_filter_model.dart';
import '../../../../domain/usecase/material/material_detailed_incoming_rep_usecase.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '../../module/base_module_view_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class MaterialDetailedIncomingRepViewModel extends ReportsViewModel
    with MaterialDetailedIncomingRepViewModelInput, MaterialDetailedIncomingRepViewModelOutput {
  final MaterialDetailedIncomingRepUseCase _useCase;
  DetailedIncomingFilterModel billRepFilterModel = DetailedIncomingFilterModel("ریز ورودی");
  MaterialDetailedIncomingRepViewModel(this._useCase);


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
  List<int> get shimmerCardRowCount => [15,15];
}

abstract class MaterialDetailedIncomingRepViewModelInput {}

abstract class MaterialDetailedIncomingRepViewModelOutput {}
