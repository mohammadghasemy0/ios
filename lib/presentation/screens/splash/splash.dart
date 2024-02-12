import 'package:flutter/material.dart';
import '/presentation/resources/assets_manager.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '/presentation/screens/splash/splash_view_model.dart';
import '/app/di.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _viewModel = instance<SplashScreenViewModel>();

  _bind() {
    _viewModel.start();
    _viewModel.nextScreenStreamOutput.listen((routeName) {
      Navigator.of(context).pushReplacementNamed(routeName);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            ImageAssets.logo,
            fit: BoxFit.contain,
            width: 200,
            height: 200,
          ),
        ),
        Text(
          "کیانو",
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
