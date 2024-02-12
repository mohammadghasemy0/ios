import '../../common/state_renderer/state_renderer_test.dart';
import '/app/persian_date_time.dart';
import '/domain/usecase/khazane/treasury_daily_summary_rep_usecase.dart';
import '/data/mapper/mapper.dart';
import '/domain/model/model.dart';
import '/data/request/customer_api_request.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';
import '/presentation/resources/assets_manager.dart';
import 'base_module_view_model.dart';

class TreasuryModuleViewModel extends ModuleViewModel {
  final TreasuryDailySummaryRepUseCase _useCase;

  TreasuryModuleViewModel(this._useCase);

  @override
  final String moduleName = "خزانه داری";

  @override
  final List<ReportListViewData> reportListViewData = [
    ReportListViewData(title: "ماژول های خزانه داری", items: [
      ReportListViewItem(
          "دریافت", ImageAssets.clIncoming2, ReportModule.treasuryDaryaft),
      ReportListViewItem("دریافت به ت پرداخت کننده", ImageAssets.clReport2,
          ReportModule.treasuryDaryaftBeTafkikHesab),
      ReportListViewItem("تجمیعی دریافت", ImageAssets.clTotally,
          ReportModule.treasuryTajmieiDaryaft),
      ReportListViewItem(
          "پرداخت", ImageAssets.clPay, ReportModule.treasuryPardakht),
      ReportListViewItem("پرداخت به تفکیک حساب", ImageAssets.clReport2,
          ReportModule.treasuryPardakhtBeTafkikHesab),
      ReportListViewItem("تجمیعی پرداخت", ImageAssets.clTotally,
          ReportModule.treasuryTajmieiPardakht),
    ]),
  ];

  @override
  void start() async {
    refreshStreamInput.add(RefreshState.loading);
    (await _useCase.execute(TreasuryDailySummaryRepRequest(
            PersianDateTime.now().toString(), dataBaseName)))
        .fold((l) {
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
  List<int> get shimmerCardRowCount => [4,4];

  @override
  int get shimmerChartCount => 0;
}

//http://37.156.14.41:2050/api/Treasury/Reports/Summary/DailySummaryReport?Date=1400%2F10%2F10&DbName=kia6
//http://192.168.1.206:2050/api/Treasury/Reports/Summary/DailySummaryReport?PersianDate=1400%2F10%2F10&DbName=kia6
