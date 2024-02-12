import '../../common/state_renderer/state_renderer_test.dart';
import '../../resources/routes_manager.dart';
import '/domain/usecase/concrete/concrete_daily_summary_rep.dart';
import '/app/persian_date_time.dart';
import '/data/mapper/mapper.dart';
import '/domain/model/model.dart';
import '/data/request/customer_api_request.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';
import '/presentation/resources/assets_manager.dart';
import 'base_module_view_model.dart';

class ConcreteModuleViewModel extends ModuleViewModel {
  final ConcreteDailySummaryRepUseCase _useCase;

  ConcreteModuleViewModel(this._useCase);

  @override
  final String moduleName = "بتن آماده";

  @override
  final List<ReportListViewData> reportListViewData = [
    ReportListViewData(title: "گزارشات بتن", items: [
      ReportListViewItem(
          "ریز فروش بتن", ImageAssets.clDetail, ReportModule.concreteSaleDetailed),
      ReportListViewItem("به تفکیک مشتری و بتن", ImageAssets.clCustomer,
          ReportModule.concreteByCustomerAndProduct),
      ReportListViewItem("به تفکیک کالا", ImageAssets.clProduct,
          ReportModule.concreteByProduct),
      ReportListViewItem("کلی روزانه", ImageAssets.clTotally,
          ReportModule.concreteDailyTotaled),
    ]),
    ReportListViewData(title: "گزارشات ورودی", items: [
      ReportListViewItem("ریز ورودی", ImageAssets.clDetail,
          ReportModule.materialDetailedIncomingRep),
      ReportListViewItem("ورودی براساس خودرو", ImageAssets.clTruck2,
          ReportModule.materialIncomingRepByCar),
      ReportListViewItem("ورودی به تفکیک فروشنده", ImageAssets.clCustomer,
          ReportModule.materialIncomingRepByCustomer),
      ReportListViewItem("ورودی به تفکیک کالا", ImageAssets.clProduct,
          ReportModule.materialIncomingRepByProduct),
      ReportListViewItem("ورودی به تفکیک مشتری و محصول", ImageAssets.clTotally2,
          ReportModule.materialIncomingRepByCustomerAndProduct),
    ]),
    ReportListViewData(title: "گزارشات میکسر", items: [
      ReportListViewItem(
          "تجمیعی میکسر", ImageAssets.clTotally, ReportModule.mixerDailyCumulativeReport),
      ReportListViewItem("ریز میکسر", ImageAssets.clDetail,
          ReportModule.mixerDriverDetailedReport),
    ]),
    ReportListViewData(title: "گزارشات پمپ", items: [
      ReportListViewItem(
          "ریز پمپ", ImageAssets.clTotally, ReportModule.mixerDriverDetailedReport),
      ReportListViewItem("کارکرد پمپ", ImageAssets.clDetail,
          ReportModule.pompKarkardPomp),
    ]),
  ];

  @override
  void start() async {
    refreshStreamInput.add(RefreshState.loading);
    (await _useCase
            .execute(ConcreteDailySummaryRepRequest(PersianDateTime.now().toString(), dataBaseName)))
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
  List<CustomButtonData> get buttons => [
    CustomButtonData("سفارش بتن", ImageAssets.clConcrete2, Routes.concreteOrder),
  ];

  @override
  List<int> get shimmerCardRowCount => [5,2];

  @override
  int get shimmerChartCount => 2;


}
