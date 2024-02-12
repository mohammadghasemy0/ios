import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kiano/app/persian_date_time.dart';
import 'package:kiano/domain/usecase/cache_params_usecase.dart';
import 'package:kiano/domain/usecase/concrete/concrete_add_order.dart';
import 'package:kiano/domain/usecase/concrete/concrete_karkard_pomp_rep.dart';
import 'package:kiano/domain/usecase/concrete/concrete_mixer_daily_cumulative_rep.dart';
import 'package:kiano/domain/usecase/concrete/concrete_mixer_driver_cumulative_rep.dart';
import 'package:kiano/domain/usecase/concrete/concrete_sale_by_product_rep.dart';
import 'package:kiano/domain/usecase/concrete/concrete_sale_daily_totaled_rep.dart';
import 'package:kiano/domain/usecase/concrete/concrete_sale_detailed_rep.dart';
import 'package:kiano/domain/usecase/finance/finance_bed_bes_rep_usecase.dart';
import 'package:kiano/domain/usecase/finance/finance_gozaresh_hesab_rep_usecase.dart';
import 'package:kiano/domain/usecase/khazane/treasury_daryaft_be_tafkik_hesab_rep_usecase.dart';
import 'package:kiano/domain/usecase/khazane/treasury_pardakht_be_tafkik_hesab_rep_usecase.dart';
import 'package:kiano/domain/usecase/khazane/treasury_tajmi_daryaft_rep_usecase.dart';
import 'package:kiano/domain/usecase/khazane/treasury_tajmi_pardakht_rep_usecase.dart';
import 'package:kiano/domain/usecase/management/get_hesab_lock_conditions_usecase.dart';
import 'package:kiano/domain/usecase/management/management_lock_hesab_usecase.dart';
import 'package:kiano/domain/usecase/management/set_hesab_lock_conditions_usecase.dart';
import 'package:kiano/domain/usecase/plate_reader/plate_reader_daily_totaled_rep_usecase.dart';
import 'package:kiano/domain/usecase/plate_reader/plate_reader_detailed_rep_usecase.dart';
import 'package:kiano/presentation/common/cache_params.dart';
import 'package:kiano/presentation/screens/add_concrete_order/add_concrete_order_view_model.dart';
import 'package:kiano/presentation/screens/items_selector/item_selector_view_model.dart';
import 'package:kiano/presentation/screens/lock_hesab_managment/lock_hesab_view_model.dart';
import 'package:kiano/presentation/screens/reporter/concrete/sale_detailed_view_model.dart';
import 'package:kiano/presentation/screens/reporter/plate_reader_reporter_view_model/plate_reader_dayli_totaled_rep.dart';
import 'package:kiano/presentation/screens/reporter/plate_reader_reporter_view_model/plate_reader_detailed_rep.dart';
import 'package:kiano/presentation/screens/reporter/treasury_report_view_model/pardakht.dart';
import 'package:kiano/presentation/screens/reporter/treasury_report_view_model/pardakht_be_tafkik_hesab.dart';
import 'package:kiano/presentation/screens/reporter/treasury_report_view_model/tajmiei_daryaft.dart';
import 'package:kiano/presentation/screens/reporter/treasury_report_view_model/tajmiei_pardakht.dart';
import '../domain/enums.dart';
import '../domain/usecase/bascule/bascule_daily_summary_rep_usecase.dart';
import '../domain/usecase/concrete/concrete_daily_summary_rep.dart';
import '../domain/usecase/concrete/concrete_get_orders_in_day_rep.dart';
import '../domain/usecase/concrete/concrete_report_by_customer_and_product_rep.dart';
import '../domain/usecase/finance/finance_daily_summary_rep_usecase.dart';
import '../domain/usecase/hesab_tafsili_usecase.dart';
import '../domain/usecase/khazane/treasury_daryaft_rep_usecase.dart';
import '../domain/usecase/khazane/treasury_pardakht_rep_usecase.dart';
import '../domain/usecase/plate_reader/plate_daily_summary_rep_usecase.dart';
import '../domain/usecase/plate_reader/plate_reader_get_instance_list_usecase.dart';
import '../domain/usecase/plate_reader/plate_reader_totaled_rep_usecase.dart';
import '../domain/usecase/sale/sale_daily_summary_rep_usecase.dart';
import '../domain/usecase/khazane/treasury_daily_summary_rep_usecase.dart';
import '../presentation/screens/module/bascule_module.dart';
import '../presentation/screens/module/concrete_view_module.dart';
import '../presentation/screens/module/finance_module.dart';
import '../presentation/screens/module/manager_view_model.dart';
import '../presentation/screens/module/plate_view_model.dart';
import '../presentation/screens/module/sale_view_model.dart';
import '../presentation/screens/module/treasury_module.dart';
import '../presentation/screens/reporter/concrete/by_customer_and_product_view_model.dart';
import '../presentation/screens/reporter/concrete/by_sale_product_view_model.dart';
import '../presentation/screens/reporter/concrete/daily_totaled_rep_view_model.dart';
import '../presentation/screens/reporter/concrete/get_orders_in_day_view_model.dart';
import '../presentation/screens/reporter/concrete/karkard_pomp_rep_view_model.dart';
import '../presentation/screens/reporter/concrete/mixer_daily_cumulative_rep_view_model.dart';
import '../presentation/screens/reporter/concrete/mixer_driver_detailed_rep_view_model.dart';
import '../presentation/screens/reporter/financial_reporter_view_model/bed_bes_rep.dart';
import '../presentation/screens/reporter/financial_reporter_view_model/gozaresh_hesab.dart';
import '../presentation/screens/reporter/manager_report_view_model/manager_report_view_model.dart';
import '../presentation/screens/reporter/material_report_view_model/bill_rep.dart';
import '../presentation/screens/reporter/material_report_view_model/bill_rep_by_car.dart';
import '../presentation/screens/reporter/material_report_view_model/bill_rep_by_customer.dart';
import '../presentation/screens/reporter/material_report_view_model/bill_rep_by_product.dart';
import '../presentation/screens/reporter/material_report_view_model/detailed_incoming_rep.dart';
import '../presentation/screens/reporter/material_report_view_model/incoming_rep_by_car.dart';
import '../presentation/screens/reporter/material_report_view_model/incoming_rep_by_customer.dart';
import '../presentation/screens/reporter/material_report_view_model/incoming_rep_by_customer_and_product.dart';
import '../presentation/screens/reporter/material_report_view_model/incoming_rep_by_product.dart';
import '../presentation/screens/reporter/material_report_view_model/mine_daily_rep.dart';
import '../presentation/screens/reporter/material_report_view_model/mine_monthly_rep.dart';
import '../presentation/screens/reporter/material_report_view_model/mine_transport_to_sale_ratio_rep.dart';
import '../presentation/screens/reporter/material_report_view_model/most_carrier_rep.dart';
import '../presentation/screens/reporter/plate_reader_reporter_view_model/plate_reader_totaled_rep.dart';
import '../presentation/screens/reporter/treasury_report_view_model/daryaft.dart';
import '../presentation/screens/reporter/treasury_report_view_model/daryaft_be_tafkik_hesab.dart';
import '/domain/usecase/fiscal_year_db_auth.dart';
import '../domain/usecase/material/material_bill_rep_by_car_usecase.dart';
import '../domain/usecase/material/material_bill_rep_by_customer_usecase.dart';
import '../domain/usecase/material/material_bill_rep_by_product_usecase.dart';
import '../domain/usecase/material/material_bill_rep_usecase.dart';
import '../domain/usecase/material/material_daily_summary_rep.dart';
import '../domain/usecase/material/material_detailed_incoming_rep_usecase.dart';
import '../domain/usecase/material/material_incoming_rep_by_car_usecase.dart';
import '../domain/usecase/material/material_incoming_rep_by_customer_and_product_usecase.dart';
import '../domain/usecase/material/material_incoming_rep_by_customer_usecase.dart';
import '../domain/usecase/material/material_incoming_rep_by_product_usecase.dart';
import '../domain/usecase/material/material_mine_daily_rep_usecase.dart';
import '/domain/usecase/material/material_mine_monthly_rep_usecase.dart';
import '/domain/usecase/material/material_mine_most_carrier_rep_usecase.dart';
import '/domain/usecase/material/material_mine_transport_to_sale_ratio_rep_usecase.dart';
import '/presentation/screens/filter_screen/filter_view_model.dart';
import '/presentation/screens/module/material_view_module.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';
import '/domain/usecase/fiscal_year_list_usecase.dart';
import '/presentation/screens/select_fiscal_year/select_fiscal_year_viewmodel.dart';
import '/domain/usecase/access_list_usecase.dart';
import '/presentation/screens/verification/verification_view_model.dart';
import '../domain/usecase/kiano_login/check_confirm_code_usecase.dart';
import '../domain/usecase/kiano_login/kiano_login_usecase.dart';
import '../domain/usecase/kiano_login/send_change_device_usecase.dart';
import '../domain/usecase/kiano_login/send_verification_code_usecase.dart';
import '/presentation/screens/register/register_view_model.dart';
import '/presentation/screens/home/home_view_model.dart';
import '/presentation/screens/splash/splash_view_model.dart';
import '/app/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/data/data_source/local_data_source.dart';
import '/data/data_source/remote_data_source.dart';
import '/data/network/japo_app_api.dart';
import '/data/network/dio_factory.dart';
import '/data/network/network_info.dart';
import '/data/repository/Repository_impl.dart';
import '/domain/repository/repository.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;
final dio = instance<DioFactory>().getDio();

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  instance.registerLazySingleton<PersianDateTime>(() => PersianDateTime());

  instance.registerLazySingleton<JapoAppServiceClient>(
      () => JapoAppServiceClient(dio, baseUrl: Constant.japoBaseUrl));

  instance.registerLazySingleton<KianoAppServiceClient>(
      () => KianoAppServiceClient(dio, baseUrl: Constant.kianoBaseUrl));

  instance.registerLazySingleton<CustomerAppServiceClient>(
      () => CustomerAppServiceClient(dio));

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance(), instance(), instance()));

  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(instance()));

  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance(), instance()));

  if (!GetIt.I.isRegistered<CacheParamsUseCase>()) {
    instance.registerFactory<CacheParamsUseCase>(
        () => CacheParamsUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<PlateReaderGetInstanceList>()) {
    instance.registerFactory<PlateReaderGetInstanceList>(
        () => PlateReaderGetInstanceList(instance()));
  }
  if (!GetIt.I.isRegistered<HesabTafsiliUseCase>()) {
    instance.registerFactory<HesabTafsiliUseCase>(
        () => HesabTafsiliUseCase(instance()));
  }
  instance.registerLazySingleton(
      () => CacheParamsManager(instance(), instance(), instance(), instance()));
}

initSplashModule() {
  if (!GetIt.I.isRegistered<SplashScreenViewModel>()) {
    instance.registerFactory<SplashScreenViewModel>(
        () => SplashScreenViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<SendVerificationCodeUseCase>()) {
    instance.registerFactory<SendVerificationCodeUseCase>(
        () => SendVerificationCodeUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<SendChangeDeviceCodeUseCase>()) {
    instance.registerFactory<SendChangeDeviceCodeUseCase>(
        () => SendChangeDeviceCodeUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<RegisterViewModel>()) {
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance(), instance()));
  }
}

initVerificationModule() {
  if (!GetIt.I.isRegistered<CheckConfirmCodeUseCase>()) {
    instance.registerFactory<CheckConfirmCodeUseCase>(
        () => CheckConfirmCodeUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<KianoLoginUseCase>()) {
    instance.registerFactory<KianoLoginUseCase>(
        () => KianoLoginUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<VerificationViewModel>()) {
    instance.registerFactory<VerificationViewModel>(
        () => VerificationViewModel(instance(), instance()));
  }
}

initSelectFiscalYearModule() {
  if (!GetIt.I.isRegistered<FiscalYearListUseCase>()) {
    instance.registerFactory<FiscalYearListUseCase>(
        () => FiscalYearListUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<FiscalYearDataBaseAuthUseCase>()) {
    instance.registerFactory<FiscalYearDataBaseAuthUseCase>(
        () => FiscalYearDataBaseAuthUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<SelectFiscalYearViewModel>()) {
    instance.registerFactory<SelectFiscalYearViewModel>(
        () => SelectFiscalYearViewModel(instance(), instance()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<FiscalYearDataBaseAuthUseCase>()) {
    instance.registerFactory<FiscalYearDataBaseAuthUseCase>(
        () => FiscalYearDataBaseAuthUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<AccessListUseCase>()) {
    instance.registerFactory<AccessListUseCase>(
        () => AccessListUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<HomeViewModel>()) {
    instance.registerFactory<HomeViewModel>(
        () => HomeViewModel(instance(), instance(), instance()));
  }
}

initFilterModule() {
  if (!GetIt.I.isRegistered<FilterViewModel>()) {
    instance.registerFactory<FilterViewModel>(() => FilterViewModel());
  }
}

/// kiaSystem modules init
initKiaSystemModule(KiaSystemModule module) {
  switch (module) {
    case KiaSystemModule.material:
      initMaterialModule();
      break;
    case KiaSystemModule.treasury:
      initTreasuryModule();
      break;
    case KiaSystemModule.sale:
      initSaleModule();
      break;
    case KiaSystemModule.plate:
      initPlateModule();
      break;
    case KiaSystemModule.finance:
      initFinanceModule();
      break;
    case KiaSystemModule.concrete:
      initConcreteModule();
      break;
    case KiaSystemModule.bascule:
      initBasculeModule();
      break;
    case KiaSystemModule.managerModule:
      initManagerModule();
      break;
  }
}

initTreasuryModule() {
  if (!GetIt.I.isRegistered<TreasuryDailySummaryRepUseCase>()) {
    instance.registerFactory<TreasuryDailySummaryRepUseCase>(
        () => TreasuryDailySummaryRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TreasuryModuleViewModel>()) {
    instance.registerFactory<TreasuryModuleViewModel>(
        () => TreasuryModuleViewModel(instance()));
  }
}

initManagerModule() {
  if (!GetIt.I.isRegistered<ManagerModuleViewModel>()) {
    instance.registerFactory<ManagerModuleViewModel>(
        () => ManagerModuleViewModel());
  }
}

initConcreteModule() {
  if (!GetIt.I.isRegistered<ConcreteDailySummaryRepUseCase>()) {
    instance.registerFactory<ConcreteDailySummaryRepUseCase>(
        () => ConcreteDailySummaryRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ConcreteModuleViewModel>()) {
    instance.registerFactory<ConcreteModuleViewModel>(
        () => ConcreteModuleViewModel(instance()));
  }
}

initBasculeModule() {
  if (!GetIt.I.isRegistered<BasculeDailySummaryRepUseCase>()) {
    instance.registerFactory<BasculeDailySummaryRepUseCase>(
        () => BasculeDailySummaryRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<BasculeModuleViewModel>()) {
    instance.registerFactory<BasculeModuleViewModel>(
        () => BasculeModuleViewModel(instance()));
  }
}

initFinanceModule() {
  if (!GetIt.I.isRegistered<FinanceDailySummaryRepUseCase>()) {
    instance.registerFactory<FinanceDailySummaryRepUseCase>(
        () => FinanceDailySummaryRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<FinanceModuleViewModel>()) {
    instance.registerFactory<FinanceModuleViewModel>(
        () => FinanceModuleViewModel(instance()));
  }
}

initPlateModule() {
  if (!GetIt.I.isRegistered<PlateDailySummaryRepUseCase>()) {
    instance.registerFactory<PlateDailySummaryRepUseCase>(
        () => PlateDailySummaryRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<PlateModuleViewModel>()) {
    instance.registerFactory<PlateModuleViewModel>(
        () => PlateModuleViewModel(instance()));
  }
}

initSaleModule() {
  if (!GetIt.I.isRegistered<SaleDailySummaryRepUseCase>()) {
    instance.registerFactory<SaleDailySummaryRepUseCase>(
        () => SaleDailySummaryRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<SaleModuleViewModel>()) {
    instance.registerFactory<SaleModuleViewModel>(
        () => SaleModuleViewModel(instance()));
  }
}

initMaterialModule() {
  if (!GetIt.I.isRegistered<MaterialDailySummaryRepUseCase>()) {
    instance.registerFactory<MaterialDailySummaryRepUseCase>(
        () => MaterialDailySummaryRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialModuleViewModel>()) {
    instance.registerFactory<MaterialModuleViewModel>(
        () => MaterialModuleViewModel(instance()));
  }
}

/// report modules init
initReportModule(ReportModule module) {
  switch (module) {
    case ReportModule.materialBillRepByCar:
      initMaterialBillRepByCarModule();
      break;
    case ReportModule.materialBillRepByProduct:
      initMaterialBillRepByProductModule();
      break;
    case ReportModule.materialBillRepByCustomer:
      initMaterialBillRepByCustomerModule();
      break;
    case ReportModule.materialBillRep:
      initMaterialBillRepModule();
      break;
    case ReportModule.materialDetailedIncomingRep:
      initMaterialDetailedIncomingRepModule();
      break;
    case ReportModule.materialIncomingRepByProduct:
      initMaterialIncomingRepByProductModule();
      break;
    case ReportModule.materialIncomingRepByCar:
      initMaterialIncomingRepByCarModule();
      break;
    case ReportModule.materialIncomingRepByCustomer:
      initMaterialIncomingRepByCustomerModule();
      break;
    case ReportModule.materialIncomingRepByCustomerAndProduct:
      initMaterialIncomingRepByCustomerAndProductModule();
      break;
    case ReportModule.materialMineDailyRep:
      initMaterialMineDailyRepModule();
      break;
    case ReportModule.materialMineMonthly:
      initMaterialMineMonthlyRepModule();
      break;
    case ReportModule.materialMostCarrierRep:
      initMaterialMostCarrierRepModule();
      break;
    case ReportModule.materialMineTransportToSaleRatioReport:
      initMaterialMineTransportToSaleRatioReportModule();
      break;
    case ReportModule.managerModule:
      initManagerModule();
      break;
    case ReportModule.managerReportModule:
      initManagerReportViewModel();
      break;
    case ReportModule.treasuryDaryaft:
      initTreasuryDaryaftModule();
      break;
    case ReportModule.treasuryDaryaftBeTafkikHesab:
      initTreasuryDaryaftBeTafkikHesabModule();
      break;
    case ReportModule.treasuryTajmieiDaryaft:
      initTreasuryTajmieiDaryaftModule();
      break;
    case ReportModule.treasuryPardakht:
      initTreasuryPardakhtModule();
      break;
    case ReportModule.treasuryPardakhtBeTafkikHesab:
      initTreasuryPardakhtBeTafkikHesabModule();
      break;
    case ReportModule.treasuryTajmieiPardakht:
      initTreasuryTajmieiPardakhtModule();
      break;
    case ReportModule.concreteSaleDetailed:
      initConcreteSaleDetailedModule();
      break;
    case ReportModule.concreteByCustomerAndProduct:
      initConcreteReportByCustomerAndProductRepViewModel();
      break;
    case ReportModule.concreteByProduct:
      initConcreteSaleByProductRepViewModel();
      break;
    case ReportModule.concreteDailyTotaled:
      initConcreteDailyTotaledRepViewModel();
      break;
    case ReportModule.mixerDailyCumulativeReport:
      initConcreteMixerDailyCumulativeRepViewModel();
      break;
    case ReportModule.mixerDriverDetailedReport:
      initConcreteMixerDriverDetailedRepViewModel();
      break;
    case ReportModule.pompKarkardPomp:
      initConcreteKarkardPompRepViewModel();
      break;
    case ReportModule.plateReaderTotaledReport:
      initPlateReaderTotaledViewModel();
      break;
    case ReportModule.concreteOrdersInDay:
      // TODO: Handle this case.
      break;
    case ReportModule.plateReaderDailyTotaledReport:
      initplateReaderDailyTotaledReport();
      break;
    case ReportModule.plateReaderDetailedReport:
      initPlateReaderDetailedReport();
      break;
    case ReportModule.financialBedBes:
      initFinancialBedBesReport();
      break;
    case ReportModule.financialGozareshHesab:
      initFinancialGozareshHesab();
      break;
  }
}

void initFinancialBedBesReport() {
  if (!GetIt.I.isRegistered<FinanceBedBesRepUseCase>()) {
    instance.registerFactory<FinanceBedBesRepUseCase>(
        () => FinanceBedBesRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<FinancialBedBesViewModel>()) {
    instance.registerFactory<FinancialBedBesViewModel>(
        () => FinancialBedBesViewModel(instance()));
  }
}

void initFinancialGozareshHesab() {
  if (!GetIt.I.isRegistered<FinanceGozareshHesabUseCase>()) {
    instance.registerFactory<FinanceGozareshHesabUseCase>(
        () => FinanceGozareshHesabUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<FinancialGozareshHesabViewModel>()) {
    instance.registerFactory<FinancialGozareshHesabViewModel>(
        () => FinancialGozareshHesabViewModel(instance()));
  }
}

void initPlateReaderDetailedReport() {
  if (!GetIt.I.isRegistered<PlateReaderDetailedRepUseCase>()) {
    instance.registerFactory<PlateReaderDetailedRepUseCase>(
        () => PlateReaderDetailedRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<PlateReaderDetailedViewModel>()) {
    instance.registerFactory<PlateReaderDetailedViewModel>(
        () => PlateReaderDetailedViewModel(instance()));
  }
}

void initplateReaderDailyTotaledReport() {
  if (!GetIt.I.isRegistered<PlateReaderDailyTotaledRepUseCase>()) {
    instance.registerFactory<PlateReaderDailyTotaledRepUseCase>(
        () => PlateReaderDailyTotaledRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<PlateReaderDailyViewModel>()) {
    instance.registerFactory<PlateReaderDailyViewModel>(
        () => PlateReaderDailyViewModel(instance()));
  }
}

void initPlateReaderTotaledViewModel() {
  if (!GetIt.I.isRegistered<PlateReaderTotaledRepUseCase>()) {
    instance.registerFactory<PlateReaderTotaledRepUseCase>(
        () => PlateReaderTotaledRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<PlateReaderTotaledViewModel>()) {
    instance.registerFactory<PlateReaderTotaledViewModel>(
        () => PlateReaderTotaledViewModel(instance()));
  }
}

void initAddConcreteOrderModule() {
  if (!GetIt.I.isRegistered<ConcreteAddOrderUseCase>()) {
    instance.registerFactory<ConcreteAddOrderUseCase>(
        () => ConcreteAddOrderUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<AddConcreteViewModel>()) {
    instance.registerFactory<AddConcreteViewModel>(
        () => AddConcreteViewModel(instance()));
  }
}

void initLockHesabModule() {
  if (!GetIt.I.isRegistered<GetHesabLockConditionsUseCase>()) {
    instance.registerFactory<GetHesabLockConditionsUseCase>(
        () => GetHesabLockConditionsUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<SetHesabLockConditionsUseCase>()) {
    instance.registerFactory<SetHesabLockConditionsUseCase>(
        () => SetHesabLockConditionsUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ManagementLockHesabUseCase>()) {
    instance.registerFactory<ManagementLockHesabUseCase>(
        () => ManagementLockHesabUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<LockHesabViewModel>()) {
    instance.registerFactory<LockHesabViewModel>(
        () => LockHesabViewModel(instance(), instance(), instance()));
  }
}

void initConcreteOrderModule() {
  if (!GetIt.I.isRegistered<ConcreteOrdersInDayRepUseCase>()) {
    instance.registerFactory<ConcreteOrdersInDayRepUseCase>(
        () => ConcreteOrdersInDayRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ConcreteGetOrdersInDayViewModel>()) {
    instance.registerFactory<ConcreteGetOrdersInDayViewModel>(
        () => ConcreteGetOrdersInDayViewModel(instance()));
  }
}

void initManagerReportViewModel() {
  if (!GetIt.I.isRegistered<ManagerReportViewModel>()) {
    instance.registerFactory<ManagerReportViewModel>(
        () => ManagerReportViewModel());
  }
}

void initConcreteDailyTotaledRepViewModel() {
  if (!GetIt.I.isRegistered<ConcreteSaleDailyTotaledRepUseCase>()) {
    instance.registerFactory<ConcreteSaleDailyTotaledRepUseCase>(
        () => ConcreteSaleDailyTotaledRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ConcreteDailyTotaledRepViewModel>()) {
    instance.registerFactory<ConcreteDailyTotaledRepViewModel>(
        () => ConcreteDailyTotaledRepViewModel(instance()));
  }
}

void initConcreteMixerDailyCumulativeRepViewModel() {
  if (!GetIt.I.isRegistered<ConcreteMixerDailyCumulativeRepUseCase>()) {
    instance.registerFactory<ConcreteMixerDailyCumulativeRepUseCase>(
        () => ConcreteMixerDailyCumulativeRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ConcreteMixerDailyCumulativeRepViewModel>()) {
    instance.registerFactory<ConcreteMixerDailyCumulativeRepViewModel>(
        () => ConcreteMixerDailyCumulativeRepViewModel(instance()));
  }
}

void initConcreteMixerDriverDetailedRepViewModel() {
  if (!GetIt.I.isRegistered<ConcreteMixerDriverDetailedRepUseCase>()) {
    instance.registerFactory<ConcreteMixerDriverDetailedRepUseCase>(
        () => ConcreteMixerDriverDetailedRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ConcreteMixerDriverDetailedRepViewModel>()) {
    instance.registerFactory<ConcreteMixerDriverDetailedRepViewModel>(
        () => ConcreteMixerDriverDetailedRepViewModel(instance()));
  }
}

void initConcreteKarkardPompRepViewModel() {
  if (!GetIt.I.isRegistered<ConcreteKarkardPompRepUseCase>()) {
    instance.registerFactory<ConcreteKarkardPompRepUseCase>(
        () => ConcreteKarkardPompRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ConcreteKarkardPompRepViewModel>()) {
    instance.registerFactory<ConcreteKarkardPompRepViewModel>(
        () => ConcreteKarkardPompRepViewModel(instance()));
  }
}

///////////////////////

void initConcreteSaleByProductRepViewModel() {
  if (!GetIt.I.isRegistered<ConcreteSaleByProductRepUseCase>()) {
    instance.registerFactory<ConcreteSaleByProductRepUseCase>(
        () => ConcreteSaleByProductRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ConcreteSaleByProductRepViewModel>()) {
    instance.registerFactory<ConcreteSaleByProductRepViewModel>(
        () => ConcreteSaleByProductRepViewModel(instance()));
  }
}

void initConcreteReportByCustomerAndProductRepViewModel() {
  if (!GetIt.I.isRegistered<ConcreteReportByCustomerAndProductRepUseCase>()) {
    instance.registerFactory<ConcreteReportByCustomerAndProductRepUseCase>(
        () => ConcreteReportByCustomerAndProductRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ConcreteReportByCustomerAndProductRepViewModel>()) {
    instance.registerFactory<ConcreteReportByCustomerAndProductRepViewModel>(
        () => ConcreteReportByCustomerAndProductRepViewModel(instance()));
  }
}

void initConcreteSaleDetailedModule() {
  if (!GetIt.I.isRegistered<ConcreteSaleDetailedRepUseCase>()) {
    instance.registerFactory<ConcreteSaleDetailedRepUseCase>(
        () => ConcreteSaleDetailedRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ConcreteSaleDetailedViewModel>()) {
    instance.registerFactory<ConcreteSaleDetailedViewModel>(
        () => ConcreteSaleDetailedViewModel(instance()));
  }
}

void initTreasuryTajmieiPardakhtModule() {
  if (!GetIt.I.isRegistered<TreasuryTajmieiPardakhtRepUseCase>()) {
    instance.registerFactory<TreasuryTajmieiPardakhtRepUseCase>(
        () => TreasuryTajmieiPardakhtRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TreasuryTajmieiPardakhtRepViewModel>()) {
    instance.registerFactory<TreasuryTajmieiPardakhtRepViewModel>(
        () => TreasuryTajmieiPardakhtRepViewModel(instance()));
  }
}

void initTreasuryPardakhtBeTafkikHesabModule() {
  if (!GetIt.I.isRegistered<TreasuryPardakhtBeTafkikHesabRepUseCase>()) {
    instance.registerFactory<TreasuryPardakhtBeTafkikHesabRepUseCase>(
        () => TreasuryPardakhtBeTafkikHesabRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TreasuryPardakhtBeTafkikHesabRepViewModel>()) {
    instance.registerFactory<TreasuryPardakhtBeTafkikHesabRepViewModel>(
        () => TreasuryPardakhtBeTafkikHesabRepViewModel(instance()));
  }
}

void initTreasuryPardakhtModule() {
  if (!GetIt.I.isRegistered<TreasuryPardakhtRepUseCase>()) {
    instance.registerFactory<TreasuryPardakhtRepUseCase>(
        () => TreasuryPardakhtRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TreasuryPardakhtRepViewModel>()) {
    instance.registerFactory<TreasuryPardakhtRepViewModel>(
        () => TreasuryPardakhtRepViewModel(instance()));
  }
}

void initTreasuryTajmieiDaryaftModule() {
  if (!GetIt.I.isRegistered<TreasuryTajmieiDaryaftRepUseCase>()) {
    instance.registerFactory<TreasuryTajmieiDaryaftRepUseCase>(
        () => TreasuryTajmieiDaryaftRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TreasuryTajmieiDaryaftRepViewModel>()) {
    instance.registerFactory<TreasuryTajmieiDaryaftRepViewModel>(
        () => TreasuryTajmieiDaryaftRepViewModel(instance()));
  }
}

initTreasuryDaryaftBeTafkikHesabModule() {
  if (!GetIt.I.isRegistered<TreasuryDaryaftBeTafkikHesabRepUseCase>()) {
    instance.registerFactory<TreasuryDaryaftBeTafkikHesabRepUseCase>(
        () => TreasuryDaryaftBeTafkikHesabRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TreasuryDaryaftBeTafkikHesabRepViewModel>()) {
    instance.registerFactory<TreasuryDaryaftBeTafkikHesabRepViewModel>(
        () => TreasuryDaryaftBeTafkikHesabRepViewModel(instance()));
  }
}

initTreasuryDaryaftModule() {
  if (!GetIt.I.isRegistered<TreasuryDaryaftRepUseCase>()) {
    instance.registerFactory<TreasuryDaryaftRepUseCase>(
        () => TreasuryDaryaftRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TreasuryDaryaftRepViewModel>()) {
    instance.registerFactory<TreasuryDaryaftRepViewModel>(
        () => TreasuryDaryaftRepViewModel(instance()));
  }
}

initMaterialBillRepByCarModule() {
  if (!GetIt.I.isRegistered<MaterialBillRepByCarUseCase>()) {
    instance.registerFactory<MaterialBillRepByCarUseCase>(
        () => MaterialBillRepByCarUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialBillRepByCarViewModel>()) {
    instance.registerFactory<MaterialBillRepByCarViewModel>(
        () => MaterialBillRepByCarViewModel(instance()));
  }
}

initMaterialBillRepByProductModule() {
  if (!GetIt.I.isRegistered<MaterialBillRepByProductUseCase>()) {
    instance.registerFactory<MaterialBillRepByProductUseCase>(
        () => MaterialBillRepByProductUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialBillRepByProductViewModel>()) {
    instance.registerFactory<MaterialBillRepByProductViewModel>(
        () => MaterialBillRepByProductViewModel(instance()));
  }
}

initMaterialBillRepByCustomerModule() {
  if (!GetIt.I.isRegistered<MaterialBillRepByCustomerUseCase>()) {
    instance.registerFactory<MaterialBillRepByCustomerUseCase>(
        () => MaterialBillRepByCustomerUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialBillRepByCustomerViewModel>()) {
    instance.registerFactory<MaterialBillRepByCustomerViewModel>(
        () => MaterialBillRepByCustomerViewModel(instance()));
  }
}

initMaterialBillRepModule() {
  if (!GetIt.I.isRegistered<MaterialBillRepUseCase>()) {
    instance.registerFactory<MaterialBillRepUseCase>(
        () => MaterialBillRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialBillRepViewModel>()) {
    instance.registerFactory<MaterialBillRepViewModel>(
        () => MaterialBillRepViewModel(instance()));
  }
}

initMaterialDetailedIncomingRepModule() {
  if (!GetIt.I.isRegistered<MaterialDetailedIncomingRepUseCase>()) {
    instance.registerFactory<MaterialDetailedIncomingRepUseCase>(
        () => MaterialDetailedIncomingRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialDetailedIncomingRepViewModel>()) {
    instance.registerFactory<MaterialDetailedIncomingRepViewModel>(
        () => MaterialDetailedIncomingRepViewModel(instance()));
  }
}

initMaterialIncomingRepByProductModule() {
  if (!GetIt.I.isRegistered<MaterialIncomingRepByProductUseCase>()) {
    instance.registerFactory<MaterialIncomingRepByProductUseCase>(
        () => MaterialIncomingRepByProductUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialIncomingRepByProductViewModel>()) {
    instance.registerFactory<MaterialIncomingRepByProductViewModel>(
        () => MaterialIncomingRepByProductViewModel(instance()));
  }
}

initMaterialIncomingRepByCarModule() {
  if (!GetIt.I.isRegistered<MaterialIncomingRepByCarUseCase>()) {
    instance.registerFactory<MaterialIncomingRepByCarUseCase>(
        () => MaterialIncomingRepByCarUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialIncomingRepByCarViewModel>()) {
    instance.registerFactory<MaterialIncomingRepByCarViewModel>(
        () => MaterialIncomingRepByCarViewModel(instance()));
  }
}

initMaterialIncomingRepByCustomerModule() {
  if (!GetIt.I.isRegistered<MaterialIncomingRepByCustomerUseCase>()) {
    instance.registerFactory<MaterialIncomingRepByCustomerUseCase>(
        () => MaterialIncomingRepByCustomerUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialIncomingRepByCustomerViewModel>()) {
    instance.registerFactory<MaterialIncomingRepByCustomerViewModel>(
        () => MaterialIncomingRepByCustomerViewModel(instance()));
  }
}

initMaterialIncomingRepByCustomerAndProductModule() {
  if (!GetIt.I.isRegistered<MaterialIncomingRepByCustomerAndProductUseCase>()) {
    instance.registerFactory<MaterialIncomingRepByCustomerAndProductUseCase>(
        () => MaterialIncomingRepByCustomerAndProductUseCase(instance()));
  }
  if (!GetIt.I
      .isRegistered<MaterialIncomingRepByCustomerAndProductViewModel>()) {
    instance.registerFactory<MaterialIncomingRepByCustomerAndProductViewModel>(
        () => MaterialIncomingRepByCustomerAndProductViewModel(instance()));
  }
}

initMaterialMineDailyRepModule() {
  if (!GetIt.I.isRegistered<MaterialMineDailyRepUseCase>()) {
    instance.registerFactory<MaterialMineDailyRepUseCase>(
        () => MaterialMineDailyRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialMineDailyRepViewModel>()) {
    instance.registerFactory<MaterialMineDailyRepViewModel>(
        () => MaterialMineDailyRepViewModel(instance()));
  }
}

initMaterialMineMonthlyRepModule() {
  if (!GetIt.I.isRegistered<MaterialMineMonthlyRepUseCase>()) {
    instance.registerFactory<MaterialMineMonthlyRepUseCase>(
        () => MaterialMineMonthlyRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialMineMonthlyRepViewModel>()) {
    instance.registerFactory<MaterialMineMonthlyRepViewModel>(
        () => MaterialMineMonthlyRepViewModel(instance()));
  }
}

initMaterialMostCarrierRepModule() {
  if (!GetIt.I.isRegistered<MaterialMostCarrierRepUseCase>()) {
    instance.registerFactory<MaterialMostCarrierRepUseCase>(
        () => MaterialMostCarrierRepUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MaterialMostCarrierRepViewModel>()) {
    instance.registerFactory<MaterialMostCarrierRepViewModel>(
        () => MaterialMostCarrierRepViewModel(instance()));
  }
}

initMaterialMineTransportToSaleRatioReportModule() {
  if (!GetIt.I.isRegistered<MaterialMineTransportToSaleRatioReportUseCase>()) {
    instance.registerFactory<MaterialMineTransportToSaleRatioReportUseCase>(
        () => MaterialMineTransportToSaleRatioReportUseCase(instance()));
  }
  if (!GetIt.I
      .isRegistered<MaterialMineTransportToSaleRatioReportViewModel>()) {
    instance.registerFactory<MaterialMineTransportToSaleRatioReportViewModel>(
        () => MaterialMineTransportToSaleRatioReportViewModel(instance()));
  }
}

initItemSelectorModule() {
  if (!GetIt.I.isRegistered<ItemsSelectorViewModel>()) {
    instance.registerFactory<ItemsSelectorViewModel>(
        () => ItemsSelectorViewModel());
  }
}

updateDioBaseUrl(String address) {
  dio.options.baseUrl = address;
}
