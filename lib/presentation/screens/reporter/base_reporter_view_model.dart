import 'dart:async';
import '../filter_screen/filter_model/base_filter_model.dart';
import '../module/base_module_view_model.dart';
import '/domain/model/model.dart';
import '/presentation/base/base_view_model.dart';

enum ReportModule {
  financialBedBes,
  financialGozareshHesab,
  materialBillRepByCar,
  materialBillRepByProduct,
  materialBillRepByCustomer,
  materialBillRep,
  materialDetailedIncomingRep,
  materialIncomingRepByProduct,
  materialIncomingRepByCar,
  materialIncomingRepByCustomer,
  materialIncomingRepByCustomerAndProduct,
  materialMineDailyRep,
  materialMineMonthly,
  materialMostCarrierRep,
  materialMineTransportToSaleRatioReport,
  managerModule,
  managerReportModule,
  treasuryDaryaft,
  treasuryDaryaftBeTafkikHesab,
  treasuryTajmieiDaryaft,
  treasuryPardakht,
  treasuryPardakhtBeTafkikHesab,
  treasuryTajmieiPardakht,
  concreteSaleDetailed,
  concreteByCustomerAndProduct,
  concreteByProduct,
  concreteDailyTotaled,
  mixerDailyCumulativeReport,
  mixerDriverDetailedReport,
  pompKarkardPomp,
  concreteOrdersInDay, plateReaderTotaledReport, plateReaderDailyTotaledReport, plateReaderDetailedReport,
}

abstract class ReportsViewModel extends BaseViewModel
    with ReporterViewModelInput, ReporterViewModelOutput {
  List<ReportItemData> reportItemData = [];
  ReportItemData? header;
  String dataBaseName = "";
  final _refreshDataStreamController = StreamController<RefreshState>.broadcast();
  List<int> shimmerCardRowCount = [5,5,5,5,5];

  FilterModel get filterModel;

  set filterModel(filterModel);

  Future<void> getData();

  void getPdf() {}
  bool hasPdf() {
    return false;
  }

  @override
  Sink get refreshDataInput => _refreshDataStreamController.sink;

  @override
  Stream<RefreshState> get refreshDataOutput => _refreshDataStreamController.stream;
}

abstract class ReporterViewModelInput {
  Sink get refreshDataInput;
}

abstract class ReporterViewModelOutput {
  Stream<RefreshState> get refreshDataOutput;
}
