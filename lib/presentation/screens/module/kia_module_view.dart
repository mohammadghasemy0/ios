import 'package:flutter/material.dart';
import 'package:kiano/domain/model/model.dart';
import 'package:kiano/presentation/common/widget/custom_button.dart';
import 'package:kiano/presentation/screens/module/plate_view_model.dart';
import '../../resources/assets_manager.dart';
import '/presentation/screens/module/sale_view_model.dart';
import '/presentation/screens/module/treasury_module.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '/domain/enums.dart';
import '../../resources/routes_manager.dart';
import '/presentation/common/widget/header_menu.dart';
import '/presentation/common/widget/chart_view.dart';
import '/presentation/common/widget/report_card_view.dart';
import '/presentation/common/widget/report_list_view.dart';
import '/app/di.dart';
import 'bascule_module.dart';
import 'concrete_view_module.dart';
import 'finance_module.dart';
import 'manager_view_model.dart';
import 'material_view_module.dart';
import 'base_module_view_model.dart';
import 'package:shimmer/shimmer.dart';


class ModuleView extends StatefulWidget {
  final KiaSystemModule module;
  final String companyName;
  final String dataBaseName;

  const ModuleView(
      {Key? key,
      required this.module,
      required this.companyName,
      required this.dataBaseName})
      : super(key: key);

  @override
  State<ModuleView> createState() => _ModuleViewState();
}

class _ModuleViewState extends State<ModuleView> {
  late final ModuleViewModel _viewModel;

  _bind() {
    switch (widget.module) {
      case KiaSystemModule.material:
        _viewModel = instance<MaterialModuleViewModel>();
        break;
      case KiaSystemModule.treasury:
        _viewModel = instance<TreasuryModuleViewModel>();
        break;
      case KiaSystemModule.sale:
        _viewModel = instance<SaleModuleViewModel>();
        break;
      case KiaSystemModule.plate:
        _viewModel = instance<PlateModuleViewModel>();
        break;
      case KiaSystemModule.finance:
        _viewModel = instance<FinanceModuleViewModel>();
        break;
      case KiaSystemModule.concrete:
        _viewModel = instance<ConcreteModuleViewModel>();
        break;
      case KiaSystemModule.bascule:
        _viewModel = instance<BasculeModuleViewModel>();
        break;
      case KiaSystemModule.managerModule:
        _viewModel = instance<ManagerModuleViewModel>();
        break;
    }

    _viewModel.dataBaseName = widget.dataBaseName;
    _viewModel.start();
    _viewModel.refreshStreamInput.add(RefreshState.loading);
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
                Future.delayed(const Duration(milliseconds: 2), () {
                  _viewModel.showDialogScreen(context, _viewModel.flowState!);
                  _viewModel.currentFlowState = _viewModel.flowState;
                  _viewModel.flowState = null;
                },);
              });
            }
            return _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageAssets.repeat1), repeat: ImageRepeat.repeat,opacity: .1)
      ),
      padding: const EdgeInsets.only(left: 16, top: 48, bottom: 8, right: 16),
      child: Column(
        children: [
          HeaderMenu(
            title: _viewModel.moduleName,
            subTitle: "${widget.companyName} - ${widget.dataBaseName}",
          ),
          StreamBuilder(
            stream: _viewModel.refreshStreamOutput,
            builder: (context, snapshot) {
              return Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      if (_viewModel.reportItemData.isNotEmpty &&
                          snapshot.data == RefreshState.hasData)
                        ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: _viewModel.reportItemData.length,
                          itemBuilder: (context, index) => ReportItemCardView(
                              data: _viewModel.reportItemData[index]),
                          // physics: const NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                        ),
                      if (snapshot.data == RefreshState.loading || snapshot.data == null)
                        ListView.builder(
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
                        ),
                      if (_viewModel.chartItemData.isNotEmpty &&
                          snapshot.data == RefreshState.hasData)
                        ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: _viewModel.chartItemData.length,
                          itemBuilder: (context, index) => ChartItemCardView(
                              data: _viewModel.chartItemData[index]),
                          // physics: const NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                        ),
                      if (snapshot.data == RefreshState.loading || snapshot.data == null)
                        ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: _viewModel.shimmerChartCount,
                          itemBuilder: (context, index)
                          {
                            return Shimmer.fromColors(
                              baseColor: Theme.of(context).cardColor,
                              highlightColor: Colors.grey.withOpacity(.6),
                              child: ChartItemCardView(
                                  data: ChartItemData(chartItemDataList: [
                                    ChartItemDataField("....", 25),
                                    ChartItemDataField("...", 50),
                                    ChartItemDataField(".....", 25),
                                  ], title: ".....")),
                            );
                          },
                          // physics: const NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                        ),
                      if (_viewModel.buttons.isNotEmpty)
                        ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: _viewModel.buttons.length,
                          itemBuilder: (context, index) => CustomButton(
                              onSelectItem: () => Navigator.of(context).pushNamed(
                                  _viewModel.buttons[index].routeName,
                                  arguments: [
                                    widget.companyName,
                                    widget.dataBaseName,
                                    _viewModel.moduleName,
                                  ]),
                              data: _viewModel.buttons[index]),
                          // physics: const NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                        ),
                      if (_viewModel.reportListViewData.isNotEmpty)
                        ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: _viewModel.reportListViewData.length,
                          itemBuilder: (context, index) => ReportListView(
                              onSelectItem: (item) => Navigator.of(context)
                                  .pushNamed(Routes.reporterRoute,
                                  arguments: [
                                    item,
                                    widget.companyName,
                                    widget.dataBaseName,
                                    _viewModel.moduleName,
                                  ]),
                              data: _viewModel.reportListViewData[index]),
                          // physics: const NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                        ),
                    ],
                  ),
                ),
              );
            },
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
