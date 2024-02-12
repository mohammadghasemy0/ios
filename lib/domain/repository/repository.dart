import 'package:dartz/dartz.dart';
import '/data/request/customer_api_request.dart';
import '../model/model.dart';
import '/data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, bool>> appLogin();

  Future<Either<Failure, bool>> sendVerificationCode(String phoneNumber);

  Future<Either<Failure, bool>> checkConfirmCode(String confirmCode);

  Future<Either<Failure, bool>> sendChangeDeviceCode();

  Future<Either<Failure, List<Company>>> getKianoAccessListCompany();

  Future<Either<Failure, List<FiscalYear>>> getCompanyFiscalYear(
      String address);

  Future<Either<Failure, bool>> fiscalYearDataBaseAuth(
      FiscalYearDataBaseAuthRequest request);

  Future<Either<Failure, MaterialDailySummaryRep>> materialDailySummaryRep(
      MaterialDailySummaryRepRequest request);

  Future<Either<Failure, List<MaterialBillRep>>> materialBillRep(
      MaterialBillRepRequest request);

  Future<Either<Failure, List<MaterialBillRepByProduct>>>
      materialBillRepByProduct(MaterialBillRepByProductRequest request);

  Future<Either<Failure, List<MaterialBillRepByCustomer>>>
      materialBillRepByCustomer(MaterialBillRepByCustomerRequest request);

  Future<Either<Failure, List<MaterialBillRepByCar>>> materialBillRepByCar(
      MaterialBillRepByCarRequest request);

  Future<Either<Failure, List<MaterialDetailedIncomingRep>>>
      materialDetailedIncomingRep(MaterialDetailedIncomingRepRequest request);

  Future<Either<Failure, List<MaterialIncomingRepByProduct>>>
      materialIncomingRepByProduct(MaterialIncomingRepByProductRequest request);

  Future<Either<Failure, List<MaterialIncomingRepByCar>>>
      materialIncomingRepByCar(MaterialIncomingRepByCarRequest request);

  Future<Either<Failure, List<MaterialIncomingRepByCustomer>>>
      materialIncomingRepByCustomer(
          MaterialIncomingRepByCustomerRequest request);

  Future<Either<Failure, List<MaterialIncomingRepByCustomerAndProduct>>>
      materialIncomingRepByCustomerAndProduct(
          MaterialIncomingRepByCustomerAndProductRequest request);

  Future<Either<Failure, MaterialMineTransportToSaleRatioReport>>
      materialMineTransportToSaleRatioReport(
          MaterialMineTransportToSaleRatioReportRequest request);

  Future<Either<Failure, List<MaterialMineMostCarrierRep>>>
      materialMostCarrierRep(MaterialMostCarrierRepRequest request);

  Future<Either<Failure, List<MaterialMineMonthlyRep>>> materialMineMonthlyRep(
      MaterialMineMonthlyRepRequest request);

  Future<Either<Failure, List<MaterialMineDailyRep>>> materialMineDailyRep(
      MaterialMineDailyRepRequest request);

  Future<Either<Failure, CacheParams>> getCacheParams(
      CacheParamsRequest request);

  Future<Either<Failure, List<Tafsili>>> getHesabTafsiliList(
      TafsiliRequest request);

  Future<Either<Failure, SaleDailySummaryRep>> saleDailySummaryRep(
      SaleDailySummaryRepRequest request);

  Future<Either<Failure, PlateDailySummaryRep>> plateDailySummaryRep(
      PlateDailySummaryRepRequest request);

  Future<Either<Failure, TreasuryDailySummaryRep>> treasuryDailySummaryRep(
      TreasuryDailySummaryRepRequest request);

  Future<Either<Failure, FinanceDailySummaryRep>> financeDailySummaryRep(
      FinanceDailySummaryRepRequest request);

  Future<Either<Failure, ConcreteDailySummaryRep>> concreteDailySummaryRep(
      ConcreteDailySummaryRepRequest request);

  Future<Either<Failure, BasculeDailySummaryRep>> basculeDailySummaryRep(
      BasculeDailySummaryRepRequest request);

  Future<Either<Failure, List<TreasuryDaryaftAndPardakhtRep>?>>
      treasuryDaryaftRep(TreasuryDaryaftAndPardakhtRepRequest request);

  Future<Either<Failure, List<TreasuryDaryaftAndPardakhtBeTafkikHesabRep>?>>
      treasuryDaryaftBeTafkikHesabRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request);

  Future<Either<Failure, List<TreasuryGoTajmiDaryaftAndPardakhtRep>?>>
      treasuryGoTajmiDaryaftRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request);

  Future<Either<Failure, List<TreasuryGoTajmiDaryaftAndPardakhtRep>?>>
      treasuryGoTajmiPardakhtRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request);

  Future<Either<Failure, List<TreasuryDaryaftAndPardakhtRep>?>>
      treasuryPardakhtRep(TreasuryDaryaftAndPardakhtRepRequest request);

  Future<Either<Failure, List<TreasuryDaryaftAndPardakhtBeTafkikHesabRep>?>>
      treasuryPardakhtBeTafkikHesabRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request);

  Future<Either<Failure, List<ConcreteOrdersInDayRep>?>>
      concreteOrdersInDayReport(ConcreteOrdersInDayRepRequest request);

  Future<Either<Failure, List<ConcreteSaleDetailedRep>?>>
      concreteSaleDetailedReport(ConcreteSaleDetailedRepRequest request);

  Future<Either<Failure, List<ConcreteReportByCustomerAndProduct>?>>
      concreteReportByCustomerAndProduct(
          ConcreteReportByCustomerAndProductRequest request);

  Future<Either<Failure, List<ConcreteSalesByProductRep>?>>
      concreteSalesByProductRep(ConcreteSalesByProductRepRequest request);

  Future<Either<Failure, List<ConcreteSalesDailyTotaledRep>?>>
      concreteSalesDailyTotaledRep(ConcreteSalesDailyTotaledRepRequest request);

  Future<Either<Failure, List<ConcreteMixerDailyCumulativeRep>?>>
      concreteMixerDailyCumulativeRep(
          ConcreteMixerDailyCumulativeRepRequest request);

  Future<Either<Failure, List<ConcreteMixerDriverDetailedRep>?>>
      concreteMixerDriverDetailedRep(
          ConcreteMixerDriverDetailedRepRequest request);

  Future<Either<Failure, List<ConcretePompKarkardPompRep>?>>
      concretePompKarkardPompRep(ConcretePompKarkardPompRepRequest request);

  Future<Either<Failure, FinancialBedBesRep?>> financialBedBesReport(
      FinancialBedBesRepRequest request);

  Future<Either<Failure, List<FinancialGozareshHesabRep>?>>
      financialGozareshHesabReport(FinancialGozareshHesabRepRequest request);

  Future<Either<Failure, GetHesabLockConditions>>
      managementGetHesabLockConditions(String request);

  Future<Either<Failure, String>> managementSetHesabLockConditions(
      ManagementSetHesabLockConditionsRequest request);

  Future<Either<Failure, String?>>
  managementLockHesab(ManagementLockHesabRequest request);

  Future<Either<Failure, List<PlateReaderDailyTotaledAndTotaledRep>?>> plateReaderDailyTotaledRep(
      PlateReaderDetailedAndDailyTotaledRepRequest request);

  Future<Either<Failure, List<PlateReaderDailyTotaledAndTotaledRep>?>> plateReaderTotaledRep(
      PlateReaderDetailedAndDailyTotaledRepRequest request);

  Future<Either<Failure, List<PlateReaderDetailedRep>?>> plateReaderDetailedRep(
      PlateReaderDetailedAndDailyTotaledRepRequest request);

  Future<Either<Failure, String?>> concreteAddOrder(
      ConcreteAddOrderRequest request);

  Future<Either<Failure, List<PlateReaderInstanceList>?>> plateReaderGetInstanceList();
}
