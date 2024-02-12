import 'package:flutter/material.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '../../resources/assets_manager.dart';
import '/presentation/screens/filter_screen/filter_model/base_filter_model.dart';
import '/presentation/common/widget/header_menu.dart';
import '/presentation/screens/filter_screen/filter_view_model.dart';
import '/app/di.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key, required this.filterModel}) : super(key: key);
  final FilterModel filterModel;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  final _viewModel = instance<FilterViewModel>();

  _bind() {
    _viewModel.setFilter(widget.filterModel);
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
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
            return _getContentWidget(context);
          }),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    final list = _viewModel.filterModel.items.values.toList();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageAssets.repeat1), repeat: ImageRepeat.repeat,opacity: .1)
      ),
      padding: const EdgeInsets.only(left: 16, top: 48, bottom: 8, right: 16),
      child: Column(
        children: [
          HeaderMenu(title: _viewModel.title),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => list[index].getWidget(),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: _viewModel.filterModel.items.length),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.maxFinite,
            child: ElevatedButton(
                onPressed: _viewModel.isValidate() ? () =>
                    Navigator.of(context).pop(_viewModel.filterModel) : null,
                child: const Text('تائید')),
          )
        ],
      ),
    );
  }
}
