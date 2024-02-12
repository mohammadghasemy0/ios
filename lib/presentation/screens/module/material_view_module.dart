import '../../common/state_renderer/state_renderer_test.dart';
import '/app/persian_date_time.dart';
import '/data/mapper/mapper.dart';
import '/domain/model/model.dart';
import '/data/request/customer_api_request.dart';
import '/domain/usecase/material/material_daily_summary_rep.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';
import '/presentation/resources/assets_manager.dart';
import 'base_module_view_model.dart';

class MaterialModuleViewModel extends ModuleViewModel {
  final MaterialDailySummaryRepUseCase _useCase;

  MaterialModuleViewModel(this._useCase);

  @override
  final String moduleName = "باسکول پبشرفته";

  @override
  final List<ReportListViewData> reportListViewData = [
    ReportListViewData(title: "گزارش های بارنامه", items: [
      ReportListViewItem(
          "بارنامه", ImageAssets.clBill, ReportModule.materialBillRep),
      ReportListViewItem("به تفکیک خودرو", ImageAssets.clTruck,
          ReportModule.materialBillRepByCar),
      ReportListViewItem("به تفکیک مشتری", ImageAssets.clCustomer,
          ReportModule.materialBillRepByCustomer),
      ReportListViewItem("به تفکیک کالا", ImageAssets.clProduct,
          ReportModule.materialBillRepByProduct),
    ]),
    ReportListViewData(title: "گزارش های ورودی", items: [
      ReportListViewItem("ریز ورودی", ImageAssets.clDetail,
          ReportModule.materialDetailedIncomingRep),
      ReportListViewItem("به تفکیک خودرو", ImageAssets.clTruck,
          ReportModule.materialIncomingRepByCar),
      ReportListViewItem("به تفکیک مشتری", ImageAssets.clCustomer,
          ReportModule.materialIncomingRepByCustomer),
      ReportListViewItem("به تفکیک کالا", ImageAssets.clProduct,
          ReportModule.materialIncomingRepByProduct),
      ReportListViewItem("به تفکیک مشتری و کالا", ImageAssets.clCustomerAndProduct,
          ReportModule.materialIncomingRepByCustomerAndProduct),
    ]),
    ReportListViewData(title: "گزارش های معدن", items: [
      ReportListViewItem(
          "روزانه", ImageAssets.clDaily3, ReportModule.materialMineDailyRep),
      ReportListViewItem("ماهیانه", ImageAssets.clMonthly,
          ReportModule.materialMineMonthly),
      ReportListViewItem("نسبت فروش به حمل", ImageAssets.clHaml,
          ReportModule.materialMineTransportToSaleRatioReport),
      ReportListViewItem("مجموع حمل", ImageAssets.clTotally,
          ReportModule.materialMostCarrierRep),
    ]),
  ];

  @override
  void start() async {
    refreshStreamInput.add(RefreshState.loading);
    (await _useCase.execute(MaterialDailySummaryRepRequest(
            0, dataBaseName, PersianDateTime.now().toString())))
        .fold((l) {
      refreshStreamInput.add(RefreshState.error);
      inputState.add(
        ErrorState(
          message: l.message,
        ),
      );
    }, (r) {
      chartItemData = r.chartList.toChartItemDataList();
      reportItemData = r.cardList.toReportItemDataList();
      refreshStreamInput.add(RefreshState.hasData);
    });
  }

  @override
  List<CustomButtonData> get buttons => [];

  @override
  List<int> get shimmerCardRowCount => [5,2,2];

  @override
  int get shimmerChartCount => 2;
}
