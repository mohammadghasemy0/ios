import 'package:flutter/material.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '../../resources/assets_manager.dart';
import '/presentation/screens/reporter/concrete/by_sale_product_view_model.dart';
import '/presentation/screens/reporter/concrete/daily_totaled_rep_view_model.dart';
import '/presentation/screens/reporter/concrete/get_orders_in_day_view_model.dart';
import '/presentation/screens/reporter/concrete/mixer_daily_cumulative_rep_view_model.dart';
import '/presentation/screens/reporter/concrete/mixer_driver_detailed_rep_view_model.dart';
import '/presentation/screens/reporter/concrete/sale_detailed_view_model.dart';
import '/presentation/screens/reporter/manager_report_view_model/manager_report_view_model.dart';
import '/presentation/screens/reporter/plate_reader_reporter_view_model/plate_reader_dayli_totaled_rep.dart';
import '/presentation/screens/reporter/plate_reader_reporter_view_model/plate_reader_detailed_rep.dart';
import '/presentation/screens/reporter/plate_reader_reporter_view_model/plate_reader_totaled_rep.dart';
import '/presentation/screens/reporter/treasury_report_view_model/daryaft.dart';
import '/presentation/screens/reporter/treasury_report_view_model/daryaft_be_tafkik_hesab.dart';
import '/presentation/screens/reporter/treasury_report_view_model/pardakht.dart';
import '/presentation/screens/reporter/treasury_report_view_model/pardakht_be_tafkik_hesab.dart';
import '/presentation/screens/reporter/treasury_report_view_model/tajmiei_daryaft.dart';
import '/presentation/screens/reporter/treasury_report_view_model/tajmiei_pardakht.dart';
import 'package:shimmer/shimmer.dart';
import '../../resources/routes_manager.dart';
import '../module/base_module_view_model.dart';
import '/domain/model/model.dart';
import '/presentation/screens/reporter/material_report_view_model/incoming_rep_by_product.dart';
import '/presentation/common/widget/report_card_view.dart';
import '/presentation/common/widget/header_menu.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';
import '/app/di.dart';
import 'concrete/by_customer_and_product_view_model.dart';
import 'concrete/karkard_pomp_rep_view_model.dart';
import 'financial_reporter_view_model/bed_bes_rep.dart';
import 'financial_reporter_view_model/gozaresh_hesab.dart';
import 'material_report_view_model/bill_rep.dart';
import 'material_report_view_model/bill_rep_by_car.dart';
import 'material_report_view_model/bill_rep_by_customer.dart';
import 'material_report_view_model/bill_rep_by_product.dart';
import 'material_report_view_model/detailed_incoming_rep.dart';
import 'material_report_view_model/incoming_rep_by_car.dart';
import 'material_report_view_model/incoming_rep_by_customer.dart';
import 'material_report_view_model/incoming_rep_by_customer_and_product.dart';
import 'material_report_view_model/mine_daily_rep.dart';
import 'material_report_view_model/mine_monthly_rep.dart';
import 'material_report_view_model/mine_transport_to_sale_ratio_rep.dart';
import 'material_report_view_model/most_carrier_rep.dart';

class ReporterView extends StatefulWidget {
  final ReportListViewItem reportModule;
  final String companyName;
  final String dataBaseName;
  final String moduleName;

  const ReporterView({
    Key? key,
    required this.companyName,
    required this.dataBaseName,
    required this.moduleName,
    required this.reportModule,
  }) : super(key: key);

  @override
  State<ReporterView> createState() => _ReporterViewState();
}

class _ReporterViewState extends State<ReporterView> {
  late final ReportsViewModel _viewModel;

  _bind() {
    initViewModel(widget.reportModule.type);
    _viewModel.start();
  }

  initViewModel(ReportModule module) {
    switch (module) {
      case ReportModule.materialBillRepByCar:
        _viewModel = instance<MaterialBillRepByCarViewModel>();
        break;
      case ReportModule.materialBillRepByProduct:
        _viewModel = instance<MaterialBillRepByProductViewModel>();
        break;
      case ReportModule.materialBillRepByCustomer:
        _viewModel = instance<MaterialBillRepByCustomerViewModel>();
        break;
      case ReportModule.materialBillRep:
        _viewModel = instance<MaterialBillRepViewModel>();
        break;
      case ReportModule.materialDetailedIncomingRep:
        _viewModel = instance<MaterialDetailedIncomingRepViewModel>();
        break;
      case ReportModule.materialIncomingRepByProduct:
        _viewModel = instance<MaterialIncomingRepByProductViewModel>();
        break;
      case ReportModule.materialIncomingRepByCar:
        _viewModel = instance<MaterialIncomingRepByCarViewModel>();
        break;
      case ReportModule.materialIncomingRepByCustomer:
        _viewModel = instance<MaterialIncomingRepByCustomerViewModel>();
        break;
      case ReportModule.materialIncomingRepByCustomerAndProduct:
        _viewModel =
            instance<MaterialIncomingRepByCustomerAndProductViewModel>();
        break;
      case ReportModule.materialMineDailyRep:
        _viewModel = instance<MaterialMineDailyRepViewModel>();
        break;
      case ReportModule.materialMineMonthly:
        _viewModel = instance<MaterialMineMonthlyRepViewModel>();
        break;
      case ReportModule.materialMostCarrierRep:
        _viewModel = instance<MaterialMostCarrierRepViewModel>();
        break;
      case ReportModule.materialMineTransportToSaleRatioReport:
        _viewModel =
            instance<MaterialMineTransportToSaleRatioReportViewModel>();
        break;
      case ReportModule.managerReportModule:
        _viewModel = instance<ManagerReportViewModel>();
        break;
      case ReportModule.treasuryDaryaft:
        _viewModel = instance<TreasuryDaryaftRepViewModel>();
        break;
      case ReportModule.treasuryDaryaftBeTafkikHesab:
        _viewModel = instance<TreasuryDaryaftBeTafkikHesabRepViewModel>();
        break;
      case ReportModule.treasuryTajmieiDaryaft:
        _viewModel = instance<TreasuryTajmieiDaryaftRepViewModel>();
        break;
      case ReportModule.treasuryPardakht:
        _viewModel = instance<TreasuryPardakhtRepViewModel>();
        break;
      case ReportModule.treasuryPardakhtBeTafkikHesab:
        _viewModel = instance<TreasuryPardakhtBeTafkikHesabRepViewModel>();
        break;
      case ReportModule.treasuryTajmieiPardakht:
        _viewModel = instance<TreasuryTajmieiPardakhtRepViewModel>();
        break;
      case ReportModule.concreteSaleDetailed:
        _viewModel = instance<ConcreteSaleDetailedViewModel>();
        break;
      case ReportModule.concreteOrdersInDay:
        _viewModel = instance<ConcreteGetOrdersInDayViewModel>();
        break;
      case ReportModule.concreteByCustomerAndProduct:
        _viewModel = instance<ConcreteReportByCustomerAndProductRepViewModel>();
        break;
      case ReportModule.concreteByProduct:
        _viewModel = instance<ConcreteSaleByProductRepViewModel>();
        break;
      case ReportModule.concreteDailyTotaled:
        _viewModel = instance<ConcreteDailyTotaledRepViewModel>();
        break;
      case ReportModule.mixerDailyCumulativeReport:
        _viewModel = instance<ConcreteMixerDailyCumulativeRepViewModel>();
        break;
      case ReportModule.mixerDriverDetailedReport:
        _viewModel = instance<ConcreteMixerDriverDetailedRepViewModel>();
        break;
      case ReportModule.pompKarkardPomp:
        _viewModel = instance<ConcreteKarkardPompRepViewModel>();
        break;
      case ReportModule.plateReaderTotaledReport:
        _viewModel = instance<PlateReaderTotaledViewModel>();
        break;
      case ReportModule.managerModule:
        break;
      case ReportModule.plateReaderDailyTotaledReport:
        _viewModel = instance<PlateReaderDailyViewModel>();
        break;
      case ReportModule.plateReaderDetailedReport:
        _viewModel = instance<PlateReaderDetailedViewModel>();
        break;
      case ReportModule.financialBedBes:
        _viewModel = instance<FinancialBedBesViewModel>();
        break;
      case ReportModule.financialGozareshHesab:
        _viewModel = instance<FinancialGozareshHesabViewModel>();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          final res = await Navigator.of(context).pushNamed(Routes.filterRoute,
              arguments: _viewModel.filterModel.clone());
          if (res != null) {
            _viewModel.filterModel = res;
            _viewModel.getData();
          }
        });
        break;
    }
    _viewModel.dataBaseName = widget.dataBaseName;
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState?>(
          stream: _viewModel.outputState,
          builder: (_, snapshot) {
            if (_viewModel.flowState != null) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _viewModel.dismissDialog(context);
                Future.delayed(
                  const Duration(milliseconds: 2),
                  () {
                    _viewModel.showDialogScreen(context, _viewModel.flowState!);
                    _viewModel.currentFlowState = _viewModel.flowState;
                    _viewModel.flowState = null;
                  },
                );
              });
            }
            return _getContentWidget();
          }),
      floatingActionButton: _viewModel.hasPdf() ?FloatingActionButton(
        onPressed: () => _viewModel.getPdf(), child: const Icon(Icons.picture_as_pdf_outlined),
      ) : null,
    );
  }

  Widget _getContentWidget() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.repeat1),
              repeat: ImageRepeat.repeat,
              opacity: .1)),
      padding: const EdgeInsets.only(left: 16, top: 48, bottom: 8, right: 16),
      child: Column(
        children: [
          HeaderMenu(
            title: widget.reportModule.name,
            subTitle:
                "${widget.companyName} - ${widget.dataBaseName} - ${widget.moduleName}",
            trailing: IconButton(
              onPressed: () async {
                final res = await Navigator.of(context).pushNamed(
                    Routes.filterRoute,
                    arguments: _viewModel.filterModel.clone());
                if (res != null) {
                  _viewModel.filterModel = res;
                  _viewModel.getData();
                }
              },
              icon: const Icon(Icons.filter_alt_outlined),
            ),
          ),
          if (_viewModel.header != null)
            ReportItemCardView(data: _viewModel.header!),
          Expanded(
            child: StreamBuilder(
              stream: _viewModel.refreshDataOutput,
              builder: (context, snapshot) => (snapshot.data ==
                          RefreshState.loading ||
                      snapshot.data == null)
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: _viewModel.shimmerCardRowCount.length,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context).cardColor,
                          highlightColor: Colors.grey.withOpacity(.6),
                          child: ReportItemCardView(
                              data: ReportItemData(
                                  items: getShimmerReportItemData(
                                      _viewModel.shimmerCardRowCount[index]),
                                  title: "....")),
                        );
                      },
                      // physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 12),
                      itemCount: _viewModel.reportItemData.length,
                      itemBuilder: (context, index) => ReportItemCardView(
                          data: _viewModel.reportItemData[index]),
                      physics: const BouncingScrollPhysics(),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  List<ReportItemDataField> getShimmerReportItemData(int shimmerCardRowCount) {
    List<ReportItemDataField> list = [];
    for (int i = 0; i < shimmerCardRowCount; i++) {
      list.add(ReportItemDataField("..............", "...."));
    }
    return list;
  }
}
