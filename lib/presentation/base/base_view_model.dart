import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/state_renderer/state_renderer_test.dart';

abstract class BaseViewModel extends BaseViewModelInPuts
    with BaseViewModelOutPuts {
  final _inputStateStreamController = StreamController<FlowState?>.broadcast();
  FlowState? flowState;
  FlowState? currentFlowState;
  @override
  void dispose() {
    _inputStateStreamController.close();
  }

  Future<void> showDialogScreen(
      BuildContext context, FlowState flowState) async {
    final res = await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          key: flowState.key,
          content: flowState.getScreenWidget(context),
        ));
    currentFlowState = null;
  }

  dismissDialog(BuildContext context) {
    if(currentFlowState != null){
      Navigator.of(context).pop();
    }
  }

  showCurrentDialog(BuildContext context){
    dismissDialog(context);
    if (flowState != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Future.delayed(
          const Duration(milliseconds: 2),
              () {
                showDialogScreen(context, flowState!);
            currentFlowState = flowState;
            flowState = null;
          },
        );
      });
    }
  }

  @override
  Stream<FlowState?> get outputState => _inputStateStreamController.stream.map((flowState) {
    this.flowState = flowState;
    return this.flowState;
      });

  @override
  Sink<FlowState?> get inputState => _inputStateStreamController.sink;
}

abstract class BaseViewModelInPuts {
  void start();
  void dispose();
  Sink<FlowState?> get inputState;
}

abstract class BaseViewModelOutPuts {
  Stream<FlowState?> get outputState;
}
