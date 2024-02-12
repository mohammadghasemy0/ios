import '/data/mapper/mapper.dart';
import '/presentation/screens/filter_screen/filter_model/material/mine_transport_to_sale_ratio_rep_filter_model.dart';
import '/domain/usecase/material/material_mine_transport_to_sale_ratio_rep_usecase.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '../../module/base_module_view_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class MaterialMineTransportToSaleRatioReportViewModel extends ReportsViewModel
    with MaterialMineTransportToSaleRatioReportViewModelInput, MaterialMineTransportToSaleRatioReportViewModelOutput {
  final MaterialMineTransportToSaleRatioReportUseCase _useCase;

  MaterialMineTransportToSaleRatioReportViewModel(this._useCase);

  MineTransportToSaleRatioRepFilterModel billRepFilterModel = MineTransportToSaleRatioRepFilterModel("نسبت فروش به حمل");

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
          reportItemData.add(r.toReportItemData());
          refreshDataInput.add(RefreshState.hasData);
        });
  }

  @override
  List<int> get shimmerCardRowCount => [3];
}

abstract class MaterialMineTransportToSaleRatioReportViewModelInput {}

abstract class MaterialMineTransportToSaleRatioReportViewModelOutput {}
