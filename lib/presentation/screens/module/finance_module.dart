import '../../common/state_renderer/state_renderer_test.dart';
import '/app/persian_date_time.dart';
import '/domain/usecase/finance/finance_daily_summary_rep_usecase.dart';
import '/data/mapper/mapper.dart';
import '/domain/model/model.dart';
import '/data/request/customer_api_request.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';
import '/presentation/resources/assets_manager.dart';
import 'base_module_view_model.dart';

class FinanceModuleViewModel extends ModuleViewModel {
  final FinanceDailySummaryRepUseCase _useCase;

  FinanceModuleViewModel(this._useCase);

  @override
  final String moduleName = "مالی";

  @override
  final List<ReportListViewData> reportListViewData = [
    ReportListViewData(title: "ماژول های مالی", items: [
      ReportListViewItem("بدهکار و بستانکار", ImageAssets.clPay,
          ReportModule.financialBedBes),
      ReportListViewItem(
          "گزارش حساب", ImageAssets.clReport, ReportModule.financialGozareshHesab),
    ]),
  ];

  // String persianFromStrDate;
  // String persianToStrDate;
  // List<int>? goroohTafsiliList;
  // bool bedehkar;
  // bool bestankar;
  // bool bihesab;
  // int bedFrom;
  // int bedTo;
  // int besFrom;
  // int besTo;
  // String dbName;

  @override
  void start() async {
    refreshStreamInput.add(RefreshState.loading);
    (await _useCase.execute(FinanceDailySummaryRepRequest(
            PersianDateTime.now().toString(), dataBaseName)))
        .fold(
            (l) {
              inputState.add(
                ErrorState(
                  message: l.message,
                ),
              );
              refreshStreamInput.add(RefreshState.error);
            }, (r) {
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
