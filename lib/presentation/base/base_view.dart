import 'package:flutter/material.dart';
import '/presentation/base/base_view_model.dart';
import '../common/state_renderer/state_renderer_test.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key, required this.viewModel,required this.child, this.floatingActionButton, this.drawer}) : super(key: key);
  final BaseViewModel viewModel;
  final Widget child;
  final Widget? floatingActionButton;
  final Widget? drawer;
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<FlowState?>(
          stream: widget.viewModel.outputState,
          builder: (_, snapshot) {
            widget.viewModel.showCurrentDialog(context);
            return widget.child;
          }),
      floatingActionButton: widget.floatingActionButton,
      drawer: widget.drawer,
    );
  }
}
