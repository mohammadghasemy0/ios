import 'package:flutter/material.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '../../resources/assets_manager.dart';
import '/domain/model/model.dart';
import '../../common/widget/header_menu.dart';
import '/app/di.dart';
import '/presentation/screens/select_fiscal_year/select_fiscal_year_viewmodel.dart';

enum SelectMode { singleSelect, multiSelect }

class SelectFiscalYear extends StatefulWidget {
  const SelectFiscalYear(
      {Key? key,
      required this.currentCompany,
      required this.companyName,
      required this.dataBaseName})
      : super(key: key);
  final Company currentCompany;
  final String companyName;
  final String dataBaseName;

  @override
  State<SelectFiscalYear> createState() => _SelectFiscalYearState();
}

class _SelectFiscalYearState extends State<SelectFiscalYear> {
  final _viewModel = instance<SelectFiscalYearViewModel>();

  _bind() {
    _viewModel.currentCompany = widget.currentCompany;
    _viewModel.start();
    _viewModel.resultStreamOutput.listen((result) {
      _viewModel.dismissDialog(context);
      Navigator.of(context, rootNavigator: true).pop(result);
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
      body: StreamBuilder<FlowState?>(
          stream: _viewModel.outputState,
          builder: (_, snapshot) {
            _viewModel.dismissDialog(context);
            if (_viewModel.flowState != null) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
            title: "انتخاب سال مالی",
            subTitle: "${widget.companyName} - ${widget.dataBaseName}",
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  _getFiscalYearList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getFiscalYearList() {
    return StreamBuilder(
      stream: _viewModel.fiscalYearChangeOutput,
      builder: (context, snapshot) => ListView.separated(
        padding: const EdgeInsets.only(top: 12),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _viewModel.fiscalYearList.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () async =>
              await _viewModel.selectFiscalYear(index, showPopUp),
          title: Text(_viewModel.fiscalYearList[index].description),
          trailing: Icon(
            Icons.key_rounded,
            color: _viewModel.isLoggedIn(_viewModel.fiscalYearList[index])
                ? Colors.green
                : Colors.red,
          ),
        ),
        separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16), child: Divider()),
      ),
    );
  }

  Future<void> showPopUp(FiscalYear fiscalYear) async {
    TextEditingController txtUserName = TextEditingController();
    TextEditingController txtPass = TextEditingController();
    String txtError = "";

    final dialog = Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "ورود: ${fiscalYear.dbName}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: txtUserName,
              decoration: const InputDecoration(
                  label: Text("نام کاربری"), hintText: "نام کاربری"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: txtPass,
              decoration: const InputDecoration(
                  label: Text("رمز ورود"), hintText: "رمز ورود"),
            ),
            const SizedBox(height: 16),
            if (txtError.isNotEmpty)
              Text(
                txtError,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.red),
              ),
            SizedBox(
              width: double.maxFinite,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  txtError = "";
                  _viewModel.registerFiscalYearLoginData(FiscalYearLoginData(
                      txtUserName.text, txtPass.text, fiscalYear.dbName));
                },
                child: _viewModel.isLoading
                    ? const CircularProgressIndicator()
                    : const Text("ورود"),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (context) {
          _viewModel.popUpCloseStreamOutput
              .listen((event) => Navigator.of(context).pop(fiscalYear));
          return StreamBuilder<bool>(
              stream: _viewModel.popUpStateStreamOutput,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (!snapshot.data!) {
                    txtError = "نام کاربری یا رمز عبور اشتباه است.";
                  }
                }
                return dialog;
              });
        });
  }
}
