import 'package:flutter/material.dart';
import '/presentation/resources/assets_manager.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '/presentation/screens/add_concrete_order/add_concrete_order_view_model.dart';
import '/app/di.dart';
import '../../common/widget/header_menu.dart';

class AddConcreteView extends StatefulWidget {
  const AddConcreteView({Key? key, required this.dataBaseName})
      : super(key: key);
  final String dataBaseName;

  @override
  State<AddConcreteView> createState() => _AddConcreteViewState();
}

class _AddConcreteViewState extends State<AddConcreteView> {
  late final AddConcreteViewModel _viewModel;
  final amountController = TextEditingController();
  final toleranceController = TextEditingController();
  final addressController = TextEditingController();

  _bind() {
    _viewModel = instance<AddConcreteViewModel>();
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
            toleranceController.text = _viewModel.tolerance;
            amountController.text = _viewModel.amount;
            addressController.text = _viewModel.address;
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          _viewModel.execute();
          FocusScope.of(context).unfocus();
        },
        child:
            Icon(Icons.check, color: Theme.of(context).colorScheme.onPrimary),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _getContentWidget() {
    final list = _viewModel.items.values.toList();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.repeat1),
              repeat: ImageRepeat.repeat,
              opacity: .1)),
      padding: const EdgeInsets.only(left: 16, top: 48, bottom: 8, right: 16),
      child: Column(
        children: [
          const HeaderMenu(
            title: "سفارش بتن",
          ),
          Expanded(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            list[index].getWidget(),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: _viewModel.items.length),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: amountController,
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text("مقدار"),
                            ),
                            onChanged: _viewModel.onChangeAmount,
                            onTap: () => amountController.selection =
                                TextSelection.collapsed(
                                    offset: amountController.text.length),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            enableInteractiveSelection: false,
                            controller: toleranceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text("تلرانس"),
                            ),
                            onChanged: _viewModel.onChangeTolerance,
                            onTap: () => toleranceController.selection =
                                TextSelection.collapsed(
                                    offset: toleranceController.text.length),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    TextField(
                      controller: addressController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        label: Text("آدرس"),
                      ),
                      onChanged: _viewModel.onChangeAddress,
                      onTap: () => addressController.selection =
                          TextSelection.collapsed(
                              offset: addressController.text.length),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
