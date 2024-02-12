import '../../common/state_renderer/state_renderer_test.dart';
import '/domain/usecase/plate_reader/plate_daily_summary_rep_usecase.dart';
import '/data/mapper/mapper.dart';
import '/domain/model/model.dart';
import '/data/request/customer_api_request.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';
import '/presentation/resources/assets_manager.dart';
import 'base_module_view_model.dart';

class PlateModuleViewModel extends ModuleViewModel {
  final PlateDailySummaryRepUseCase _useCase;

  PlateModuleViewModel(this._useCase);

  @override
  final String moduleName = "پلاک خوان";

  @override
  final List<ReportListViewData> reportListViewData = [
    ReportListViewData(title: "گزارش های پلاک خوان", items: [
      ReportListViewItem(
          "گزارش ریز", ImageAssets.clDetail, ReportModule.plateReaderDetailedReport),
      ReportListViewItem("روزانه", ImageAssets.clDetail2,
          ReportModule.plateReaderDailyTotaledReport),
      ReportListViewItem("کلی", ImageAssets.clTotally,
          ReportModule.plateReaderTotaledReport),
    ]),
  ];

  @override
  void start() async {
    refreshStreamInput.add(RefreshState.loading);
    (await _useCase
        .execute(PlateDailySummaryRepRequest(DateTime.now().toIso8601String())))
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
          reportItemData = r.cardList.toReportItemDataList();
          refreshStreamInput.add(RefreshState.hasData);
        });
  }

  @override
  List<CustomButtonData> get buttons => [];

  @override
  List<int> get shimmerCardRowCount => [1];

  @override
  int get shimmerChartCount => 0;

}