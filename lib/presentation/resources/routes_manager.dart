import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kiano/app/di.dart';
import 'package:kiano/domain/model/model.dart';
import 'package:kiano/domain/usecase/base_usecase.dart';
import 'package:kiano/domain/usecase/material/material_bill_rep_usecase.dart';
import 'package:kiano/presentation/common/widget/report_list_view.dart';
import 'package:kiano/presentation/screens/add_concrete_order/add_concrete_order_view.dart';
import 'package:kiano/presentation/screens/reporter/concrete/concrete_orders_view.dart';
import 'package:kiano/presentation/screens/filter_screen/filter.dart';
import 'package:kiano/presentation/screens/filter_screen/filter_model/base_filter_model.dart';
import 'package:kiano/presentation/screens/module/kia_module_view.dart';
import 'package:kiano/presentation/screens/module/base_module_view_model.dart';
import 'package:kiano/presentation/screens/register/register.dart';
import 'package:kiano/presentation/screens/reporter/reporter.dart';
import 'package:kiano/presentation/screens/reporter/base_reporter_view_model.dart';
import 'package:kiano/presentation/screens/verification/verification.dart';
import '../../domain/enums.dart';
import '../screens/items_selector/item_selector_view.dart';
import '../screens/home/home.dart';
import '../screens/lock_hesab_managment/lock_hesab_view.dart';
import '../screens/select_fiscal_year/select_fiscal_year.dart';
import '../screens/splash/splash.dart';
import '/presentation/resources/string_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
  static const String registerRoute = "/register";
  static const String verificationRoute = "/verification";
  static const String selectFiscalYearRoute = "/selectFiscalYear";
  static const String reporterRoute = "/reporter";
  static const String moduleRoute = "/module";
  static const String filterRoute = "/filter";
  static const String itemsSelectorRoute = "/itemsSelectorRoute";
  static const String addConcreteOrder = "/addOrderConcrete";
  static const String concreteOrder = "/orderConcrete";
  static const String lockHesabRoute = "/lockHesabRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        initSplashModule();
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.homeRoute:
        initHomeModule();
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(
          builder: (context) => const RegisterView(),
        );
      case Routes.verificationRoute:
        initVerificationModule();
        final arguments = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => VerificationView(phoneNumber: arguments),
        );
      case Routes.reporterRoute:
        final arguments = routeSettings.arguments as List<dynamic>;
        initReportModule((arguments[0] as ReportListViewItem).type);
        return MaterialPageRoute(
          builder: (context) => ReporterView(
            reportModule: arguments[0] as ReportListViewItem,
            companyName: arguments[1] as String,
            dataBaseName: arguments[2] as String,
            moduleName: arguments[3] as String,
          ),
        );
      case Routes.filterRoute:
        initFilterModule();
        final arguments = routeSettings.arguments as FilterModel;
        return MaterialPageRoute(
          builder: (context) => FilterView(filterModel: arguments),
        );
      case Routes.itemsSelectorRoute:
        final arguments = routeSettings.arguments as List<dynamic>;
        initItemSelectorModule();
        return MaterialPageRoute(
          builder: (context) => ItemsSelector(
            title: arguments[0] as String,
            items: arguments[1] as Map<String, dynamic>,
            selectedItems: arguments[2] as Map<String, dynamic>,
            multiSelect: arguments[3] as bool,
          ),
        );
      case Routes.selectFiscalYearRoute:
        initSelectFiscalYearModule();
        final arguments = routeSettings.arguments as List<dynamic>;
        return MaterialPageRoute(
          builder: (context) => SelectFiscalYear(
              currentCompany: arguments[0] as Company,
              companyName: arguments[1] as String,
              dataBaseName: arguments[2] as String),
        );
      case Routes.moduleRoute:
        final arguments = routeSettings.arguments as List<dynamic>;
        initKiaSystemModule(arguments[0] as KiaSystemModule);
        return MaterialPageRoute(
          builder: (context) => ModuleView(
              module: arguments[0] as KiaSystemModule,
              companyName: arguments[1] as String,
              dataBaseName: arguments[2] as String),
        );
      case Routes.addConcreteOrder:
        final arguments = routeSettings.arguments as String;
        initAddConcreteOrderModule();
        return MaterialPageRoute(
          builder: (context) => AddConcreteView(
            dataBaseName: arguments,
          ),
        );
      case Routes.concreteOrder:
        final arguments = routeSettings.arguments as List<dynamic>;
        initConcreteOrderModule();
        return MaterialPageRoute(
          builder: (context) => ConcreteOrdersView(
              companyName: arguments[0] as String,
              dataBaseName: arguments[1] as String,
              moduleName: arguments[2] as String
          ),
        );
      case Routes.lockHesabRoute:
        final arguments = routeSettings.arguments as List<dynamic>;
        initLockHesabModule();
        return MaterialPageRoute(
          builder: (context) => LockHesabView(
              companyName: arguments[0] as String,
              dataBaseName: arguments[1] as String,
              moduleName: arguments[2] as String
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(AppString.noRouteFound.tr()),
        ),
        body: Center(
          child: Text(AppString.noRouteFound.tr()),
        ),
      ),
    );
  }
}
