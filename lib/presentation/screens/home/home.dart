import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:kiano/presentation/base/base_view.dart';
import 'package:shimmer/shimmer.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '/presentation/common/widget/header_menu.dart';
import '/domain/model/model.dart';
import '/presentation/resources/routes_manager.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/screens/home/home_view_model.dart';
import '/app/di.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _viewModel = instance<HomeViewModel>();

  _bind() {
    _viewModel.start();
    _viewModel.logOutStreamOutput.listen((event) => Phoenix.rebirth(context));
    _viewModel.navigatorStreamOutput.listen((module) =>
        Navigator.of(context).pushNamed(Routes.moduleRoute, arguments: [
          module,
          _viewModel.currentCompany!.customerName,
          _viewModel.currentFiscalYearLoginData!.dbName
        ]));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: _viewModel, drawer: _drawer(), child: _getContentWidget());
  }

  Widget _getContentWidget() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.repeat1),
              repeat: ImageRepeat.repeat,
              opacity: .1)),
      padding: const EdgeInsets.only(left: 16, top: 48, bottom: 8, right: 16),
      child: StreamBuilder<void>(
          stream: _viewModel.companyChangeOutput,
          builder: (_, snapshot) {
            return snapshot.connectionState != ConnectionState.waiting
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_viewModel.currentCompany != null)
                        _headerMenu(context),
                      _viewModel.currentFiscalYearLoginData != null
                          ? _kiaSystemModules()
                          : Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Image.asset(
                                    ImageAssets.dbLogin,
                                    width: 200,
                                    height: 200,
                                  ),
                                  const SizedBox(height: 26),
                                  Text(
                                    "سال مالی را انتخاب نکرده اید",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "برای نمایش ماژول ها باید از منوی بالا به یک سال مالی وارد شوید.",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ])),
                    ],
                  )
                : Shimmer.fromColors(
                    baseColor: Theme.of(context).cardColor,
                    highlightColor: Colors.grey.withOpacity(.6),
                    child: const SizedBox(height: 220, width: double.maxFinite),
                  );
          }),
    );
  }

  Future<void> selectFiscalYear() async {
    final result = await Navigator.of(context)
        .pushNamed(Routes.selectFiscalYearRoute, arguments: [
      _viewModel.currentCompany!,
      _viewModel.currentCompany != null
          ? _viewModel.currentCompany!.customerName
          : "",
      _viewModel.currentFiscalYearLoginData != null
          ? _viewModel.currentFiscalYearLoginData!.dbName
          : ""
    ]);
    if (result != null) {
      _viewModel.setFiscalYearLoginData(result as FiscalYearLoginData);
    }
  }

  Widget _headerMenu(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.fiscalYearChangeOutput,
      builder: (context, snapshot) => HeaderMenu(
        onTap: selectFiscalYear,
        title: _viewModel.currentFiscalYearLoginData != null
            ? _viewModel.currentFiscalYearLoginData!.dbName
            : "انتخاب سال مالی",
        subTitle: _viewModel.currentCompany!.customerName,
        leading: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu)),
        trailing: IconButton(
          onPressed: selectFiscalYear,
          icon: const Icon(Icons.arrow_drop_down_rounded),
        ),
      ),
    );
  }

  Widget _kiaSystemModules() {
    final List<ModuleItemData> list = _viewModel.getModulesList();
    return Expanded(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 8 / 7,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () => _viewModel.onSelectModule(
              list[index].module, list[index].isActive),
          child: _moduleItem(list[index]),
        ),
      ),
    );
  }

  Widget _moduleItem(ModuleItemData item) {
    return Card(
      // color: item.isActive ?Theme.of(context).cardColor :Theme.of(context).disabledColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Image.asset(item.assetIcon,
                      color: item.isActive
                          ? null
                          : Theme.of(context).disabledColor)),
            ),
            Expanded(
              flex: 1,
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color:
                        item.isActive ? null : Theme.of(context).disabledColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 48, left: 8, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 36, top: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(56),
                        border: Border.all(width: 1.5, color: Colors.black12)),
                    width: 72,
                    height: 72,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(56),
                      child: Image.asset(
                        ImageAssets.logo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _viewModel.getUserName().isNotEmpty
                                ? _viewModel.getUserName()
                                : "کاربر کیاسیستم",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _viewModel.getPhoneNumber(),
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "لیست شرکت های مجاز",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Divider(),
            Expanded(
              child: StreamBuilder<void>(
                stream: _viewModel.accessListChangeOutput,
                builder: (context, snapshot) => ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: _viewModel.accessList.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () async {
                      await _viewModel.selectCompany(index);
                    },
                    title: Text(
                      _viewModel.accessList[index].customerName,
                      style: Theme.of(context).textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: const Icon(Icons.account_balance_sharp),
                    trailing: _viewModel.accessList[index].id ==
                            _viewModel.currentCompany!.id
                        ? const Icon(
                            Icons.check_circle_outline_rounded,
                            color: Colors.green,
                          )
                        : null,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تنظیمات",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const Divider(),
                ListTile(
                    onTap: _viewModel.logout,
                    title: Text("خروج از حساب",
                        style: Theme.of(context).textTheme.bodyText2),
                    leading: const Icon(Icons.exit_to_app_rounded)),
              ],
            )
          ],
        ),
      ),
    );
  }

}


