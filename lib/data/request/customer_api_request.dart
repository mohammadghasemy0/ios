class FiscalYearDataBaseAuthRequest {
  String username;
  String password;
  String dbName;

  FiscalYearDataBaseAuthRequest(this.username, this.password, this.dbName);
}

class MaterialDailySummaryRepRequest {
  int costCenterId;
  String dbName;
  String date;

  MaterialDailySummaryRepRequest(this.costCenterId, this.dbName, this.date);
}

class MaterialBillRepByCustomerRequest {
  final String persianFromStrDate;
  final String persianToStrDate;
  final String dbName;
  final int customerId;
  final int costCenterId;
  final List<int> productIds;

  MaterialBillRepByCustomerRequest(this.persianFromStrDate,
      this.persianToStrDate,
      this.dbName,
      this.customerId,
      this.costCenterId,
      this.productIds);
}

class MaterialBillRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  String dbName;
  int customerId;
  int costCenterId;
  int carId;
  String driverName;
  List<int> productIds;

  MaterialBillRepRequest(this.persianFromStrDate,
      this.persianToStrDate,
      this.dbName,
      this.customerId,
      this.costCenterId,
      this.carId,
      this.driverName,
      this.productIds);
}

class MaterialBillRepByProductRequest {
  final String persianFromStrDate;
  final String persianToStrDate;
  final String dbName;
  final int costCenterId;
  final List<int> productIds;

  MaterialBillRepByProductRequest(this.persianFromStrDate,
      this.persianToStrDate, this.dbName, this.costCenterId, this.productIds);
}

class MaterialBillRepByCarRequest {
  final String persianFromStrDate;
  final String persianToStrDate;
  final String dbName;
  final int costCenterId;
  final int customerId;

  MaterialBillRepByCarRequest(this.persianFromStrDate, this.persianToStrDate,
      this.dbName, this.costCenterId, this.customerId);
}

class MaterialDetailedIncomingRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  String dbName;
  int customerId;
  int costCenterId;
  int carId;
  List<int> productIds;

  MaterialDetailedIncomingRepRequest(this.persianFromStrDate,
      this.persianToStrDate,
      this.dbName,
      this.customerId,
      this.costCenterId,
      this.carId,
      this.productIds);
}

class MaterialIncomingRepByProductRequest {
  final String persianFromStrDate;
  final String persianToStrDate;
  final String dbName;
  final int costCenterId;
  final List<int> productIds;

  MaterialIncomingRepByProductRequest(this.persianFromStrDate,
      this.persianToStrDate, this.dbName, this.costCenterId, this.productIds);
}

class MaterialIncomingRepByCarRequest {
  final String persianFromStrDate;
  final String persianToStrDate;
  final String dbName;
  final int costCenterId;
  final int customerId;

  MaterialIncomingRepByCarRequest(this.persianFromStrDate,
      this.persianToStrDate, this.dbName, this.costCenterId, this.customerId);
}

class MaterialIncomingRepByCustomerRequest {
  final String persianFromStrDate;
  final String persianToStrDate;
  final String dbName;
  final int costCenterId;
  final int customerId;

  MaterialIncomingRepByCustomerRequest(this.persianFromStrDate,
      this.persianToStrDate, this.dbName, this.costCenterId, this.customerId);
}

class MaterialIncomingRepByCustomerAndProductRequest {
  final String persianFromStrDate;
  final String persianToStrDate;
  final String dbName;
  final int costCenterId;
  final int customerId;
  final List<int> productIds;

  MaterialIncomingRepByCustomerAndProductRequest(this.persianFromStrDate,
      this.persianToStrDate,
      this.dbName,
      this.costCenterId,
      this.customerId,
      this.productIds);
}

class MaterialMineDailyRepRequest {
  final String persianFromStrDate;
  final String persianToStrDate;
  final String dbName;
  final int costCenterId;

  MaterialMineDailyRepRequest(this.persianFromStrDate, this.persianToStrDate,
      this.dbName, this.costCenterId);
}

class MaterialMineMonthlyRepRequest {
  final String year;
  final String dbName;
  final int costCenterId;

  MaterialMineMonthlyRepRequest(this.year, this.dbName, this.costCenterId);
}

class MaterialMostCarrierRepRequest {
  final String persianFromStrDate;
  final String persianToStrDate;
  final String dbName;
  final int costCenterId;

  MaterialMostCarrierRepRequest(this.persianFromStrDate, this.persianToStrDate,
      this.dbName, this.costCenterId);
}

class MaterialMineTransportToSaleRatioReportRequest {
  final String persianFromStrDate;
  final String persianToStrDate;
  final String dbName;
  final int costCenterId;

  MaterialMineTransportToSaleRatioReportRequest(this.persianFromStrDate,
      this.persianToStrDate, this.dbName, this.costCenterId);
}

class CacheParamsRequest {
  final List<String> cacheKeys;
  final String dbName;

  CacheParamsRequest(this.cacheKeys, this.dbName);
}

class TafsiliRequest {
  final List<int> idTaf;
  final List<int> idGoroTaf;
  final String dbName;

  TafsiliRequest(this.idTaf, this.idGoroTaf, this.dbName);
}

class SaleDailySummaryRepRequest {
  String dbName;
  String date;

  SaleDailySummaryRepRequest(this.dbName, this.date);
}

class PlateDailySummaryRepRequest {
  String date;

  PlateDailySummaryRepRequest(this.date);
}

class TreasuryDailySummaryRepRequest {
  String date;
  String dbName;

  TreasuryDailySummaryRepRequest(this.date, this.dbName);
}

class FinanceDailySummaryRepRequest {
  String date;
  String dbName;

  FinanceDailySummaryRepRequest(this.date, this.dbName);
}

class ConcreteDailySummaryRepRequest {
  String date;
  String dbName;

  ConcreteDailySummaryRepRequest(this.date, this.dbName);
}

class BasculeDailySummaryRepRequest {
  String date;
  String dbName;

  BasculeDailySummaryRepRequest(this.date, this.dbName);
}

class GetHesabLockConditionsRequest {
  String dbName;

  GetHesabLockConditionsRequest(this.dbName);
}

class TreasuryDaryaftAndPardakhtRepRequest {
  String persianFromDate;
  String persianToDate;
  bool naghdi;
  bool havale;
  bool kart;
  bool check;
  int idPardakhtKonande;
  int idDaryaftKonande;
  String dbName;

  TreasuryDaryaftAndPardakhtRepRequest(this.persianFromDate,
      this.persianToDate,
      this.naghdi,
      this.havale,
      this.kart,
      this.check,
      this.idPardakhtKonande,
      this.idDaryaftKonande,
      this.dbName);
}

class TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest {
  String persianFromDate;
  String persianToDate;
  String dbName;

  TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest(
      this.persianFromDate, this.persianToDate, this.dbName);
}

class FinancialBedBesRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  List<int>? goroohTafsiliList;
  bool bedehkar;
  bool bestankar;
  bool bihesab;
  int bedFrom;
  int bedTo;
  int besFrom;
  int besTo;
  String dbName;

  FinancialBedBesRepRequest(this.persianFromStrDate,
      this.persianToStrDate,
      this.goroohTafsiliList,
      this.bedehkar,
      this.bestankar,
      this.bihesab,
      this.bedFrom,
      this.bedTo,
      this.besFrom,
      this.besTo,
      this.dbName);
}

class FinancialGozareshHesabRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  int hesabTafsili;
  List<int> moinList;
  bool showMandeHesabGhabli;
  bool showRizFactor;
  bool showKerayeHaml;
  String dbName;

  FinancialGozareshHesabRepRequest(this.persianFromStrDate,
      this.persianToStrDate,
      this.hesabTafsili,
      this.moinList,
      this.showMandeHesabGhabli,
      this.showRizFactor,
      this.showKerayeHaml,
      this.dbName);
}

class PlateReaderDetailedRepRequest {
  String persianFromDate;
  String persianToDate;
  String fromTime;
  String toTime;
  String username;
  int p1;
  String p2;
  int p3;
  int p4;
  int instanceId;
  bool showReserves;

  PlateReaderDetailedRepRequest(this.persianFromDate,
      this.persianToDate,
      this.fromTime,
      this.toTime,
      this.username,
      this.p1,
      this.p2,
      this.p3,
      this.p4,
      this.instanceId,
      this.showReserves);
}

class ConcreteOrdersInDayRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  int workStatus;
  String dbName;

  ConcreteOrdersInDayRepRequest(this.persianFromStrDate, this.persianToStrDate, this.workStatus,
      this.dbName);
}

class ConcreteSaleDetailedRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  List<int> productIds;
  int customerId;
  int carId;
  String driverName;
  String dbName;

  ConcreteSaleDetailedRepRequest(this.persianFromStrDate,
      this.persianToStrDate,
      this.productIds,
      this.customerId,
      this.carId,
      this.driverName,
      this.dbName);
}

class ConcreteReportByCustomerAndProductRequest {
  String persianFromStrDate;
  String persianToStrDate;
  List<int> productIds;
  int customerId;
  String dbName;

  ConcreteReportByCustomerAndProductRequest(this.persianFromStrDate,
      this.persianToStrDate, this.productIds, this.customerId, this.dbName);
}

class ConcreteSalesByProductRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  List<int> productIds;
  String dbName;

  ConcreteSalesByProductRepRequest(this.persianFromStrDate,
      this.persianToStrDate, this.productIds, this.dbName);
}

class ConcreteSalesDailyTotaledRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  String dbName;

  ConcreteSalesDailyTotaledRepRequest(this.persianFromStrDate,
      this.persianToStrDate, this.dbName);
}

class ConcreteMixerDailyCumulativeRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  int carId;
  String driverName;
  String dbName;

  ConcreteMixerDailyCumulativeRepRequest(this.persianFromStrDate,
      this.persianToStrDate, this.carId, this.driverName, this.dbName);
}

class ConcreteMixerDriverDetailedRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  int customerId;
  String driverName;
  String dbName;

  ConcreteMixerDriverDetailedRepRequest(this.persianFromStrDate,
      this.persianToStrDate, this.customerId, this.driverName, this.dbName);
}

class ConcretePompKarkardPompRepRequest {
  String persianFromStrDate;
  String persianToStrDate;
  int pompId;
  String dbName;

  ConcretePompKarkardPompRepRequest(this.persianFromStrDate,
      this.persianToStrDate, this.pompId, this.dbName);
}


class ManagementLockHesabRequest {
  String lockDate;
  String dbName;

  ManagementLockHesabRequest(this.lockDate, this.dbName);
}

class ManagementSetHesabLockConditionsRequest {
  String lockDate;
  bool lockAutomatic;
  int lockDayLength;
  String dbName;

  ManagementSetHesabLockConditionsRequest(this.lockDate, this.lockAutomatic,
      this.lockDayLength, this.dbName);
}

class ConcreteAddOrderRequest {
  String persianDate;
  String time;
  String address;
  String workType;
  String dbName;
  int customerId;
  int productId;
  int pompId;
  double meghdar;
  double tolerance;
  int controlType;

  ConcreteAddOrderRequest(
      this.persianDate,
      this.time,
      this.address,
      this.workType,
      this.dbName,
      this.customerId,
      this.productId,
      this.pompId,
      this.meghdar,
      this.tolerance,
      this.controlType);
}

class PlateReaderDetailedAndDailyTotaledRepRequest {
  String fromDate;
  String toDate;
  int p1;
  String p2;
  int p3;
  int p4;
  int instanceId;
  bool showReserves;
  int pageNumber;
  int pageSize;

  PlateReaderDetailedAndDailyTotaledRepRequest(
      this.fromDate,
      this.toDate,
      this.p1,
      this.p2,
      this.p3,
      this.p4,
      this.instanceId,
      this.showReserves,
      this.pageNumber,
      this.pageSize);
}
