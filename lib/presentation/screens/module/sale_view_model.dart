import '../../common/state_renderer/state_renderer_test.dart';
import '/domain/usecase/sale/sale_daily_summary_rep_usecase.dart';
import '/app/persian_date_time.dart';
import '/data/mapper/mapper.dart';
import '/domain/model/model.dart';
import '/data/request/customer_api_request.dart';
import 'base_module_view_model.dart';

class SaleModuleViewModel extends ModuleViewModel {
  final SaleDailySummaryRepUseCase _useCase;

  SaleModuleViewModel(this._useCase);

  @override
  final String moduleName = "فروش";

  @override
  final List<ReportListViewData> reportListViewData = [];

  @override
  void start() async {
    refreshStreamInput.add(RefreshState.loading);
    (await _useCase
        .execute(SaleDailySummaryRepRequest(dataBaseName, PersianDateTime.now().toString())))
        .fold(
            (l) {
              refreshStreamInput.add(RefreshState.error);
              inputState.add(
                ErrorState(
                  message: l.message,
                ),
              );
            },
            (r) {
          chartItemData = r.chartList.toChartItemDataList();
          reportItemData = r.cardList.toReportItemDataList();
          refreshStreamInput.add(RefreshState.hasData);
        });
  }

  @override
  List<CustomButtonData> get buttons => [];
  @override
  List<int> get shimmerCardRowCount => [2,2,2,2];

  @override
  int get shimmerChartCount => 2;

}