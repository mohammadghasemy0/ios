import 'package:flutter/material.dart';
import 'package:kiano/presentation/resources/assets_manager.dart';
import '../../../common/state_renderer/state_renderer_test.dart';
import '/app/di.dart';
import '../../../common/widget/header_menu.dart';
import '../../../common/widget/report_card_view.dart';
import '../../../resources/routes_manager.dart';
import 'get_orders_in_day_view_model.dart';

class ConcreteOrdersView extends StatefulWidget {
  final String companyName;
  final String dataBaseName;
  final String moduleName;

  const ConcreteOrdersView({
    Key? key,
    required this.companyName,
    required this.dataBaseName,
    required this.moduleName,
  }) : super(key: key);

  @override
  State<ConcreteOrdersView> createState() => _ConcreteOrdersViewState();
}

class _ConcreteOrdersViewState extends State<ConcreteOrdersView> {
  late final ConcreteGetOrdersInDayViewModel _viewModel;

  _bind() {
    _viewModel = instance<ConcreteGetOrdersInDayViewModel>();
    _viewModel.dataBaseName = widget.dataBaseName;
    _viewModel.start();
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
      floatingActionButton: FloatingActionButton(
          onPressed: ()async {
            await Navigator.of(context).pushNamed(Routes.addConcreteOrder, arguments: _viewModel.dataBaseName);
            _viewModel.getData();
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
            title: "سفارشات بتن",
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
          Expanded(
            child: StreamBuilder(
              stream: _viewModel.refreshDataOutput,
              builder: (context, snapshot) => ListView.builder(
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
}
