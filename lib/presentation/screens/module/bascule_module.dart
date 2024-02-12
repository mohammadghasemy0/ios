import '../../common/state_renderer/state_renderer_test.dart';
import '/app/persian_date_time.dart';
import '/domain/usecase/bascule/bascule_daily_summary_rep_usecase.dart';
import '/data/mapper/mapper.dart';
import '/domain/model/model.dart';
import '/data/request/customer_api_request.dart';
import 'base_module_view_model.dart';

class BasculeModuleViewModel extends ModuleViewModel {
  final BasculeDailySummaryRepUseCase _useCase;

  BasculeModuleViewModel(this._useCase);

  @override
  final String moduleName = "باسکول";

  @override
  final List<ReportListViewData> reportListViewData = [];

  @override
  void start() async {
    refreshStreamInput.add(RefreshState.loading);
    (await _useCase
            .execute(BasculeDailySummaryRepRequest(PersianDateTime.now().toString(), dataBaseName)))
        .fold(
            (l) {
              inputState.add(
                ErrorState(
                  message: l.message,
                ),
              );
              refreshStreamInput.add(RefreshState.error);
            },
            (r) {
              reportItemData = r.cardList.toReportItemDataList();
              refreshStreamInput.add(RefreshState.hasData);
            });
  }

  @override
  List<CustomButtonData> get buttons => [];

  @override
  List<int> get shimmerCardRowCount => [2];

  @override
  int get shimmerChartCount => 0;

}


//http://37.156.14.41:2050/api/Treasury/Reports/Summary/DailySummaryReport?Date=1400%2F10%2F10&DbName=kia6
//http://192.168.1.206:2050/api/Treasury/Reports/Summary/DailySummaryReport?PersianDate=1400%2F10%2F10&DbName=kia6