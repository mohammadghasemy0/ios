import '/data/response/customer_api_response.dart';
import '/data/request/customer_api_request.dart';
import '/data/request/kiano_api_request.dart';
import '../response/base_api_response.dart';
import '/data/request/japo_api_request.dart';
import '../response/japo_api_response.dart';
import '/data/network/japo_app_api.dart';

abstract class RemoteDataSource {
  Future<BaseAPIResponse<AppLoginResponse>> appLogin(AppLoginRequest request);

  Future<BaseAPIResponse<SendVerificationCodeResponse>> sendVerificationCode(
      SendVerificationCodeRequest request);

  Future<BaseAPIResponse<String>> checkConfirmCode(
      CheckConfirmCodeRequest request);

  Future<BaseAPIResponse<String>> sendChangeDeviceCode(
      SendChangeDeviceCodeRequest request);

  Future<BaseAPIResponse<KianoAccessListResponse>> getKianoAccessList(
      KianoAccessListRequest request);

  Future<BaseAPIResponse<List<FiscalYearResponse>>> getCompanyFiscalYear();

  Future<BaseAPIResponse<String>> dbAuth(FiscalYearDataBaseAuthRequest request);

  Future<BaseAPIResponse<MaterialDailySummaryRepResponse>>
      materialDailySummaryRep(MaterialDailySummaryRepRequest request);

  Future<BaseAPIResponse<BasculeDailySummaryRepResponse>>
      basculeDailySummaryRep(BasculeDailySummaryRepRequest request);

  Future<BaseAPIResponse<ConcreteDailySummaryRepResponse>>
      concreteDailySummaryRep(ConcreteDailySummaryRepRequest request);

  Future<BaseAPIResponse<SaleDailySummaryRepResponse>> saleDailySummaryRep(
      SaleDailySummaryRepRequest request);

  Future<BaseAPIResponse<PlateDailySummaryRepResponse>> plateDailySummaryRep(
      PlateDailySummaryRepRequest request);

  Future<BaseAPIResponse<TreasuryDailySummaryRepResponse>>
      treasuryDailySummaryRep(TreasuryDailySummaryRepRequest request);

  Future<BaseAPIResponse<FinanceDailySummaryRepResponse>>
      financeDailySummaryRep(FinanceDailySummaryRepRequest request);

  Future<BaseAPIResponse<List<MaterialBillRepResponse>>> materialBillRep(
      MaterialBillRepRequest request);

  Future<BaseAPIResponse<List<MaterialBillRepByProductResponse>>>
      materialBillRepByProduct(MaterialBillRepByProductRequest request);

  Future<BaseAPIResponse<List<MaterialBillRepByCustomerResponse>>>
      materialBillRepByCustomer(MaterialBillRepByCustomerRequest request);

  Future<BaseAPIResponse<List<MaterialBillRepByCarResponse>>>
      materialBillRepByCar(MaterialBillRepByCarRequest request);

  Future<BaseAPIResponse<List<MaterialDetailedIncomingRepResponse>>>
      materialDetailedIncomingRep(MaterialDetailedIncomingRepRequest request);

  Future<BaseAPIResponse<List<MaterialIncomingRepByProductResponse>>>
      materialIncomingRepByProduct(MaterialIncomingRepByProductRequest request);

  Future<BaseAPIResponse<List<MaterialIncomingRepByCarResponse>>>
      materialIncomingRepByCar(MaterialIncomingRepByCarRequest request);

  Future<BaseAPIResponse<List<MaterialIncomingRepByCustomerResponse>>>
      materialIncomingRepByCustomer(
          MaterialIncomingRepByCustomerRequest request);

  Future<BaseAPIResponse<List<MaterialIncomingRepByCustomerAndProductResponse>>>
      materialIncomingRepByCustomerAndProduct(
          MaterialIncomingRepByCustomerAndProductRequest request);

  Future<BaseAPIResponse<MaterialMineTransportToSaleRatioReportResponse>>
      materialMineTransportToSaleRatioReport(
          MaterialMineTransportToSaleRatioReportRequest request);

  Future<BaseAPIResponse<List<MaterialMostCarrierRepResponse>>>
      materialMostCarrierRep(MaterialMostCarrierRepRequest request);

  Future<BaseAPIResponse<List<MaterialMineMonthlyRepResponse>>>
      materialMineMonthlyRep(MaterialMineMonthlyRepRequest request);

  Future<BaseAPIResponse<List<MaterialMineDailyRepResponse>>>
      materialMineDailyRep(MaterialMineDailyRepRequest request);

  Future<BaseAPIResponse<CacheParamsResponse>> getCacheParams(
      CacheParamsRequest request);

  Future<BaseAPIResponse<List<TafsiliResponse>>> getHesabTafsiliList(
      TafsiliRequest request);

  Future<BaseAPIResponse<String?>> managementSetHesabLockConditions(
      ManagementSetHesabLockConditionsRequest request);

  Future<BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>?>>
      treasuryDaryaftRep(TreasuryDaryaftAndPardakhtRepRequest request);

  Future<
          BaseAPIResponse<
              List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>?>>
      treasuryDaryaftBeTafkikHesabRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request);

  Future<BaseAPIResponse<List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>?>>
      treasuryGoTajmiDaryaftRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request);

  Future<BaseAPIResponse<List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>?>>
      treasuryGoTajmiPardakhtRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request);

  Future<BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>?>>
      treasuryPardakhtRep(TreasuryDaryaftAndPardakhtRepRequest request);

  Future<
          BaseAPIResponse<
              List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>?>>
      treasuryPardakhtBeTafkikHesabRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request);

  Future<BaseAPIResponse<FinancialBedBesResponse?>> financialBedBesReport(
      FinancialBedBesRepRequest request);

  Future<BaseAPIResponse<List<ConcreteOrdersInDayRepResponse>?>>
      concreteOrdersInDayReport(ConcreteOrdersInDayRepRequest request);

  Future<BaseAPIResponse<List<ConcreteSaleDetailedRepResponse>?>>
      concreteSaleDetailedReport(ConcreteSaleDetailedRepRequest request);

  Future<BaseAPIResponse<List<ConcreteReportByCustomerAndProductResponse>?>>
      concreteReportByCustomerAndProduct(
          ConcreteReportByCustomerAndProductRequest request);

  Future<BaseAPIResponse<List<ConcreteSalesByProductRepResponse>?>>
      concreteSalesByProductRep(ConcreteSalesByProductRepRequest request);

  Future<BaseAPIResponse<List<ConcreteSalesDailyTotaledRepResponse>?>>
      concreteSalesDailyTotaledRep(ConcreteSalesDailyTotaledRepRequest request);

  Future<BaseAPIResponse<List<ConcreteMixerDriverDetailedRepResponse>?>>
      concreteMixerDriverDetailedRep(
          ConcreteMixerDriverDetailedRepRequest request);

  Future<BaseAPIResponse<List<ConcretePompKarkardPompRepResponse>?>>
      concretePompKarkardPompRep(ConcretePompKarkardPompRepRequest request);

  Future<BaseAPIResponse<String?>> managementLockHesab(
      ManagementLockHesabRequest request);

  Future<BaseAPIResponse<List<FinancialGozareshHesabRepResponse>?>>
      financialGozareshHesabReport(FinancialGozareshHesabRepRequest request);

  Future<BaseAPIResponse<List<ConcreteMixerDailyCumulativeRepResponse>?>>
      concreteMixerDailyCumulativeRep(
          ConcreteMixerDailyCumulativeRepRequest request);

  Future<BaseAPIResponse<ManagementGetHesabLockConditionsResponse?>>
      managementGetHesabLockConditions(String dbName);

  Future<
          BaseAPIResponse<
              List<PlateReaderDailyTotaledAndTotaledRepRepResponse>?>>
      plateReaderDailyTotaledRep(
          PlateReaderDetailedAndDailyTotaledRepRequest request);

  Future<
          BaseAPIResponse<
              List<PlateReaderDailyTotaledAndTotaledRepRepResponse>?>>
      plateReaderTotaledRep(
          PlateReaderDetailedAndDailyTotaledRepRequest request);

  Future<BaseAPIResponse<List<PlateReaderDetailedRepResponse>?>>
      plateReaderDetailedRep(
          PlateReaderDetailedAndDailyTotaledRepRequest request);

  Future<BaseAPIResponse<List<PlateReaderInstanceListResponse>?>>
      plateReaderGetInstanceList();

  Future<BaseAPIResponse<String?>> concreteAddOrder(
      ConcreteAddOrderRequest request);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final JapoAppServiceClient _japoAppServiceClient;
  final KianoAppServiceClient _kianoAppServiceClient;
  final CustomerAppServiceClient _customerAppServiceClient;

  RemoteDataSourceImplementer(this._japoAppServiceClient,
      this._kianoAppServiceClient, this._customerAppServiceClient);

  // 37.156.14.41:2043 services

  @override
  Future<BaseAPIResponse<AppLoginResponse>> appLogin(
          AppLoginRequest request) async =>
      await _japoAppServiceClient.appLogin(request.phoneNumber);

  @override
  Future<BaseAPIResponse<String>> checkConfirmCode(
          CheckConfirmCodeRequest request) async =>
      await _japoAppServiceClient.checkConfirmCode(
          request.phoneNumber, request.verificationCode);

  @override
  Future<BaseAPIResponse<String>> sendChangeDeviceCode(
          SendChangeDeviceCodeRequest request) async =>
      await _japoAppServiceClient.sendChangeDeviceCode(request.phoneNumber,
          request.macAddress, request.deviceName, request.deviceType);

  @override
  Future<BaseAPIResponse<SendVerificationCodeResponse>> sendVerificationCode(
          SendVerificationCodeRequest request) async =>
      await _japoAppServiceClient.sendVerificationCode(request.phoneNumber,
          request.phoneModel, request.macAddress, request.deviceType);

  //new.kiasystem.ir services

  @override
  Future<BaseAPIResponse<KianoAccessListResponse>> getKianoAccessList(
      KianoAccessListRequest request) async {
    return await _kianoAppServiceClient.getKianoAccessList(request.phoneNumber);
  }

  //customer services
  @override
  Future<BaseAPIResponse<List<FiscalYearResponse>>>
      getCompanyFiscalYear() async {
    return await _customerAppServiceClient.getCompanyFiscalYear("3618");
  }

  @override
  Future<BaseAPIResponse<String>> dbAuth(
      FiscalYearDataBaseAuthRequest request) async {
    return await _customerAppServiceClient.dbAuth(
        request.username, request.password, request.dbName);
  }

  @override
  Future<BaseAPIResponse<MaterialDailySummaryRepResponse>>
      materialDailySummaryRep(MaterialDailySummaryRepRequest request) async =>
          await _customerAppServiceClient.materialDailySummaryRep(
              request.date, request.dbName, request.costCenterId);

  @override
  Future<BaseAPIResponse<SaleDailySummaryRepResponse>> saleDailySummaryRep(
          SaleDailySummaryRepRequest request) async =>
      await _customerAppServiceClient.saleDailySummaryRep(
          request.date, request.dbName);

  @override
  Future<BaseAPIResponse<PlateDailySummaryRepResponse>> plateDailySummaryRep(
          PlateDailySummaryRepRequest request) async =>
      await _customerAppServiceClient.plateDailySummaryRep(request.date);

  @override
  Future<BaseAPIResponse<TreasuryDailySummaryRepResponse>>
      treasuryDailySummaryRep(TreasuryDailySummaryRepRequest request) async =>
          await _customerAppServiceClient.treasuryDailySummaryRep(
              request.date, request.dbName);

  @override
  Future<BaseAPIResponse<FinanceDailySummaryRepResponse>>
      financeDailySummaryRep(FinanceDailySummaryRepRequest request) async =>
          await _customerAppServiceClient.financeDailySummaryRep(
              request.date, request.dbName);

  @override
  Future<BaseAPIResponse<ConcreteDailySummaryRepResponse>>
      concreteDailySummaryRep(ConcreteDailySummaryRepRequest request) async =>
          await _customerAppServiceClient.concreteDailySummaryRep(
              request.date, request.dbName);

  @override
  Future<BaseAPIResponse<BasculeDailySummaryRepResponse>>
      basculeDailySummaryRep(BasculeDailySummaryRepRequest request) async =>
          await _customerAppServiceClient.basculeDailySummaryRep(
              request.date, request.dbName);

  @override
  Future<BaseAPIResponse<List<MaterialBillRepResponse>>> materialBillRep(
          MaterialBillRepRequest request) async =>
      await _customerAppServiceClient.materialBillRep(
          request.persianFromStrDate,
          request.persianToStrDate,
          request.dbName,
          request.customerId,
          request.costCenterId,
          request.carId,
          request.driverName,
          request.productIds);

  @override
  Future<BaseAPIResponse<List<MaterialBillRepByCustomerResponse>>>
      materialBillRepByCustomer(
              MaterialBillRepByCustomerRequest request) async =>
          await _customerAppServiceClient.materialBillRepByCustomer(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.dbName,
              request.customerId,
              request.costCenterId,
              request.productIds);

  @override
  Future<BaseAPIResponse<List<MaterialBillRepByCarResponse>>>
      materialBillRepByCar(MaterialBillRepByCarRequest request) async =>
          await _customerAppServiceClient.materialBillRepByCar(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.dbName,
              request.costCenterId,
              request.customerId);

  @override
  Future<BaseAPIResponse<List<MaterialBillRepByProductResponse>>>
      materialBillRepByProduct(MaterialBillRepByProductRequest request) async =>
          await _customerAppServiceClient.materialBillRepByProduct(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.dbName,
              request.costCenterId,
              request.productIds);

  @override
  Future<BaseAPIResponse<List<MaterialDetailedIncomingRepResponse>>>
      materialDetailedIncomingRep(
              MaterialDetailedIncomingRepRequest request) async =>
          await _customerAppServiceClient.materialDetailedIncomingRep(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.dbName,
              request.costCenterId,
              request.carId,
              request.customerId,
              request.productIds);

  @override
  Future<BaseAPIResponse<List<MaterialIncomingRepByCarResponse>>>
      materialIncomingRepByCar(MaterialIncomingRepByCarRequest request) async =>
          await _customerAppServiceClient.materialIncomingRepByCar(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.dbName,
              request.costCenterId,
              request.customerId);

  @override
  Future<BaseAPIResponse<List<MaterialIncomingRepByProductResponse>>>
      materialIncomingRepByProduct(
              MaterialIncomingRepByProductRequest request) async =>
          await _customerAppServiceClient.materialIncomingRepByProduct(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.dbName,
              request.costCenterId,
              request.productIds);

  @override
  Future<BaseAPIResponse<List<MaterialIncomingRepByCustomerResponse>>>
      materialIncomingRepByCustomer(
              MaterialIncomingRepByCustomerRequest request) async =>
          await _customerAppServiceClient.materialIncomingRepByCustomer(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.dbName,
              request.costCenterId,
              request.customerId);

  @override
  Future<BaseAPIResponse<List<MaterialIncomingRepByCustomerAndProductResponse>>>
      materialIncomingRepByCustomerAndProduct(
              MaterialIncomingRepByCustomerAndProductRequest request) async =>
          await _customerAppServiceClient
              .materialIncomingRepByCustomerAndProduct(
                  request.persianFromStrDate,
                  request.persianToStrDate,
                  request.dbName,
                  request.costCenterId,
                  request.customerId,
                  request.productIds);

  @override
  Future<BaseAPIResponse<List<MaterialMineDailyRepResponse>>>
      materialMineDailyRep(MaterialMineDailyRepRequest request) async =>
          await _customerAppServiceClient.materialMineDailyRep(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.dbName,
              request.costCenterId);

  @override
  Future<BaseAPIResponse<List<MaterialMineMonthlyRepResponse>>>
      materialMineMonthlyRep(MaterialMineMonthlyRepRequest request) async =>
          await _customerAppServiceClient.materialMineMonthlyRep(
              request.year, request.dbName, request.costCenterId);

  @override
  Future<BaseAPIResponse<List<MaterialMostCarrierRepResponse>>>
      materialMostCarrierRep(MaterialMostCarrierRepRequest request) async =>
          await _customerAppServiceClient.materialMostCarrierRep(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.dbName,
              request.costCenterId);

  @override
  Future<BaseAPIResponse<MaterialMineTransportToSaleRatioReportResponse>>
      materialMineTransportToSaleRatioReport(
              MaterialMineTransportToSaleRatioReportRequest request) async =>
          await _customerAppServiceClient
              .materialMineTransportToSaleRatioReport(
                  request.persianFromStrDate,
                  request.persianToStrDate,
                  request.dbName,
                  request.costCenterId);

  @override
  Future<BaseAPIResponse<CacheParamsResponse>> getCacheParams(
          CacheParamsRequest request) async =>
      await _customerAppServiceClient.getCacheParams(
          request.cacheKeys, request.dbName);

  @override
  Future<BaseAPIResponse<String?>> managementSetHesabLockConditions(
          ManagementSetHesabLockConditionsRequest request) async =>
      await _customerAppServiceClient.managementSetHesabLockConditions(
          request.lockDate,
          request.lockAutomatic,
          request.lockDayLength,
          request.dbName);

  @override
  Future<
          BaseAPIResponse<
              List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>?>>
      treasuryDaryaftBeTafkikHesabRep(
              TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest
                  request) async =>
          await _customerAppServiceClient.treasuryDaryaftBeTafkikHesabRep(
              request.persianFromDate, request.persianToDate, request.dbName);

  @override
  Future<BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>?>>
      treasuryDaryaftRep(TreasuryDaryaftAndPardakhtRepRequest request) async =>
          await _customerAppServiceClient.treasuryDaryaftRep(
              request.persianFromDate,
              request.persianToDate,
              request.naghdi,
              request.havale,
              request.kart,
              request.check,
              request.idPardakhtKonande,
              request.idDaryaftKonande,
              request.dbName);

  @override
  Future<BaseAPIResponse<List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>?>>
      treasuryGoTajmiDaryaftRep(
              TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest
                  request) async =>
          await _customerAppServiceClient.treasuryGoTajmiDaryaftRep(
              request.persianFromDate, request.persianToDate, request.dbName);

  @override
  Future<BaseAPIResponse<List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>?>>
      treasuryGoTajmiPardakhtRep(
              TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest
                  request) async =>
          await _customerAppServiceClient.treasuryGoTajmiPardakhtRep(
              request.persianFromDate, request.persianToDate, request.dbName);

  @override
  Future<
          BaseAPIResponse<
              List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>?>>
      treasuryPardakhtBeTafkikHesabRep(
              TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest
                  request) async =>
          await _customerAppServiceClient.treasuryPardakhtBeTafkikHesabRep(
              request.persianFromDate, request.persianToDate, request.dbName);

  @override
  Future<BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>?>>
      treasuryPardakhtRep(TreasuryDaryaftAndPardakhtRepRequest request) async =>
          await _customerAppServiceClient.treasuryPardakhtRep(
              request.persianFromDate,
              request.persianToDate,
              request.dbName,
              request.naghdi,
              request.havale,
              request.kart,
              request.check,
              request.idPardakhtKonande,
              request.idDaryaftKonande);

  @override
  Future<BaseAPIResponse<FinancialBedBesResponse?>> financialBedBesReport(
          FinancialBedBesRepRequest request) async =>
      await _customerAppServiceClient.financialBedBesReport(
          request.persianFromStrDate,
          request.persianToStrDate,
          request.goroohTafsiliList,
          request.bedehkar,
          request.bestankar,
          request.bihesab,
          request.bedFrom,
          request.bedTo,
          request.besFrom,
          request.besTo,
          request.dbName);

  @override
  Future<BaseAPIResponse<List<FinancialGozareshHesabRepResponse>?>>
      financialGozareshHesabReport(
              FinancialGozareshHesabRepRequest request) async =>
          await _customerAppServiceClient.financialGozareshHesabReport(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.hesabTafsili,
              request.moinList,
              request.showMandeHesabGhabli,
              request.showRizFactor,
              request.showKerayeHaml,
              request.dbName);

  @override
  Future<BaseAPIResponse<List<ConcreteOrdersInDayRepResponse>?>>
      concreteOrdersInDayReport(ConcreteOrdersInDayRepRequest request) async =>
          await _customerAppServiceClient.concreteOrdersInDayReport(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.workStatus,
              request.dbName);

  @override
  Future<BaseAPIResponse<List<ConcreteSaleDetailedRepResponse>?>>
      concreteSaleDetailedReport(
              ConcreteSaleDetailedRepRequest request) async =>
          await _customerAppServiceClient.concreteSaleDetailedReport(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.productIds,
              request.customerId,
              request.carId,
              request.driverName,
              request.dbName);

  @override
  Future<BaseAPIResponse<List<ConcreteReportByCustomerAndProductResponse>?>>
      concreteReportByCustomerAndProduct(
              ConcreteReportByCustomerAndProductRequest request) async =>
          await _customerAppServiceClient.concreteReportByCustomerAndProduct(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.productIds,
              request.customerId,
              request.dbName);

  @override
  Future<BaseAPIResponse<List<ConcreteSalesByProductRepResponse>?>>
      concreteSalesByProductRep(
              ConcreteSalesByProductRepRequest request) async =>
          await _customerAppServiceClient.concreteSalesByProductRep(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.productIds,
              request.dbName);

  @override
  Future<BaseAPIResponse<List<ConcreteSalesDailyTotaledRepResponse>?>>
      concreteSalesDailyTotaledRep(
              ConcreteSalesDailyTotaledRepRequest request) async =>
          await _customerAppServiceClient.concreteSalesDailyTotaledRep(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.dbName);

  @override
  Future<BaseAPIResponse<List<ConcreteMixerDailyCumulativeRepResponse>?>>
      concreteMixerDailyCumulativeRep(
              ConcreteMixerDailyCumulativeRepRequest request) async =>
          await _customerAppServiceClient.concreteMixerDailyCumulativeRep(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.carId,
              request.driverName,
              request.dbName);

  @override
  Future<BaseAPIResponse<List<ConcreteMixerDriverDetailedRepResponse>?>>
      concreteMixerDriverDetailedRep(
              ConcreteMixerDriverDetailedRepRequest request) async =>
          await _customerAppServiceClient.concreteMixerDriverDetailedRep(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.customerId,
              request.driverName,
              request.dbName);

  @override
  Future<BaseAPIResponse<List<ConcretePompKarkardPompRepResponse>?>>
      concretePompKarkardPompRep(
              ConcretePompKarkardPompRepRequest request) async =>
          await _customerAppServiceClient.concretePompKarkardPompRep(
              request.persianFromStrDate,
              request.persianToStrDate,
              request.pompId,
              request.dbName);

  @override
  Future<BaseAPIResponse<String?>> managementLockHesab(
          ManagementLockHesabRequest request) async =>
      await _customerAppServiceClient.managementLockHesab(
          request.lockDate, request.dbName);

  @override
  Future<BaseAPIResponse<ManagementGetHesabLockConditionsResponse?>>
      managementGetHesabLockConditions(String dbName) async =>
          await _customerAppServiceClient
              .managementGetHesabLockConditions(dbName);

  @override
  Future<BaseAPIResponse<List<PlateReaderDetailedRepResponse>?>>
      plateReaderDetailedRep(
              PlateReaderDetailedAndDailyTotaledRepRequest request) async =>
          await _customerAppServiceClient.plateReaderDetailedRep(
              request.fromDate,
              request.toDate,
              request.p1,
              request.p2,
              request.p3,
              request.p4,
              request.instanceId,
              request.showReserves,
              request.pageNumber,
              request.pageSize);

  @override
  Future<BaseAPIResponse<String?>> concreteAddOrder(
          ConcreteAddOrderRequest request) async =>
      await _customerAppServiceClient.concreteAddOrder(
          request.persianDate,
          request.time,
          request.address,
          request.workType,
          request.dbName,
          request.customerId,
          request.productId,
          request.pompId,
          request.meghdar,
          request.tolerance,
          request.controlType);

  @override
  Future<BaseAPIResponse<List<PlateReaderInstanceListResponse>?>>
      plateReaderGetInstanceList() async =>
          await _customerAppServiceClient.plateReaderGetInstanceList();

  @override
  Future<
          BaseAPIResponse<
              List<PlateReaderDailyTotaledAndTotaledRepRepResponse>?>>
      plateReaderDailyTotaledRep(
              PlateReaderDetailedAndDailyTotaledRepRequest request) async =>
          await _customerAppServiceClient.plateReaderDailyTotaledRep(
              request.fromDate,
              request.toDate,
              request.p1,
              request.p2,
              request.p3,
              request.p4,
              request.instanceId,
              request.showReserves,
              request.pageNumber,
              request.pageSize);

  @override
  Future<
          BaseAPIResponse<
              List<PlateReaderDailyTotaledAndTotaledRepRepResponse>?>>
      plateReaderTotaledRep(
              PlateReaderDetailedAndDailyTotaledRepRequest request) async =>
          await _customerAppServiceClient.plateReaderTotaledRep(
              request.fromDate,
              request.toDate,
              request.p1,
              request.p2,
              request.p3,
              request.p4,
              request.instanceId,
              request.showReserves,
              request.pageNumber,
              request.pageSize);

  @override
  Future<BaseAPIResponse<List<TafsiliResponse>>> getHesabTafsiliList(
      TafsiliRequest request) async =>
    await _customerAppServiceClient.getHesabTafsiliList(
        request.idTaf, request.idGoroTaf, request.dbName);



}
