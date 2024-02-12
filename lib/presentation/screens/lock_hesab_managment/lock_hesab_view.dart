import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiano/presentation/resources/assets_manager.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '/presentation/screens/lock_hesab_managment/lock_hesab_view_model.dart';
import '/app/di.dart';
import '../../common/widget/header_menu.dart';

class LockHesabView extends StatefulWidget {
  const LockHesabView(
      {Key? key,
      required this.dataBaseName,
      required this.companyName,
      required this.moduleName})
      : super(key: key);
  final String dataBaseName;
  final String companyName;
  final String moduleName;

  @override
  State<LockHesabView> createState() => _LockHesabViewState();
}

class _LockHesabViewState extends State<LockHesabView> {
  late final LockHesabViewModel _viewModel;
  final prioudController = TextEditingController();

  _bind() {
    _viewModel = instance<LockHesabViewModel>();
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
          const HeaderMenu(
            title: "قفل کردن حساب ها",
          ),
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                _viewModel.date.getWidget(),
                if (_viewModel.checkBox.value) const Divider(),
                if (_viewModel.checkBox.value)
                  TextField(
                    enableInteractiveSelection: false,
                    controller: prioudController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      label: Text("تعداد روز ها"),
                    ),
                    onChanged: _viewModel.onChangePrioud,
                    onTap: () => prioudController.selection =
                        TextSelection.collapsed(
                            offset: prioudController.text.length),
                  ),
                const Divider(),
                _viewModel.checkBox.getWidget(),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () => _viewModel.onTap(context),
                  child: const SizedBox(
                    height: 48,
                    width: double.maxFinite,
                    child: Center(child: Text("اعمال")),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
