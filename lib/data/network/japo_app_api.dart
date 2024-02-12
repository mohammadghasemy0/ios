import 'package:dio/dio.dart';
import '../response/base_api_response.dart';
import '../response/customer_api_response.dart';
import '/app/constant.dart';
import 'package:retrofit/retrofit.dart';
import '../response/japo_api_response.dart';

part 'japo_app_api.g.dart';

@RestApi(baseUrl: Constant.japoBaseUrl)
abstract class JapoAppServiceClient {
  factory JapoAppServiceClient(Dio dio, {String baseUrl}) =
      _JapoAppServiceClient;

  @POST("/api/kiano/Auth/AppLogin")
  Future<BaseAPIResponse<AppLoginResponse>> appLogin(
    @Field("phoneNumber") String phoneNumber,
  );

  @POST("/api/kiano/Users/SendVerificationCode")
  Future<BaseAPIResponse<SendVerificationCodeResponse>> sendVerificationCode(
    @Field("phoneNumber") String phoneNumber,
    @Field("phoneModel") String phoneModel,
    @Field("macAddress") String macAddress,
    @Field("deviceType") int deviceType,
  );

  @POST("/api/kiano/Users/CheckConfirmCode")
  Future<BaseAPIResponse<String>> checkConfirmCode(
    @Field("phoneNumber") String phoneNumber,
    @Field("verificationCode") String verificationCode,
  );

  @POST("/api/kiano/Users/SendChangeDeviceCode")
  Future<BaseAPIResponse<String>> sendChangeDeviceCode(
    @Field("phoneNumber") String phoneNumber,
    @Field("macAddress") String macAddress,
    @Field("deviceName") String deviceName,
    @Field("deviceType") int deviceType,
  );
}

@RestApi(baseUrl: Constant.kianoBaseUrl)
abstract class KianoAppServiceClient {
  factory KianoAppServiceClient(Dio dio, {String baseUrl}) =
      _KianoAppServiceClient;

  @GET("/api/Customers/GetKianoAccessList")
  Future<BaseAPIResponse<KianoAccessListResponse>> getKianoAccessList(
    @Query("PhoneNumber") String phoneNumber,
  );
}

@RestApi()
abstract class CustomerAppServiceClient {
  factory CustomerAppServiceClient(Dio dio, {String baseUrl}) =
      _CustomerAppServiceClient;

  @GET("/api/Other/GetDbList")
  Future<BaseAPIResponse<List<FiscalYearResponse>>> getCompanyFiscalYear(
    @Query("ApiPass") String apiPass,
  );

  @GET("/api/Other/CheckApi")
  Future<int> getCheckServer();

  @POST("/api/Other/DbAuth")
  Future<BaseAPIResponse<String>> dbAuth(@Field("username") String username,
      @Field("password") String password, @Field("dbName") String dbName);

  @GET("/api/Material/Reports/Sale/DetailedReportByDate")
  Future<BaseAPIResponse<List<MaterialBillRepResponse>>> materialBillRep(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("DbName") String dbName,
    @Query("CustomerId") int customerId,
    @Query("IdMarkazHazine") int costCenterId,
    @Query("CarId") int carId,
    @Query("DriverName") String driverName,
    @Query("ProductIds") List<int> productIds,
  );

  @GET("/api/Material/Reports/Sale/ReportByProduct")
  Future<BaseAPIResponse<List<MaterialBillRepByProductResponse>>>
      materialBillRepByProduct(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("DbName") String dbName,
    @Query("IdMarkazHazine") int costCenterId,
    @Query("ProductIds") List<int> productIds,
  );

  @POST("/api/Material/Reports/Sale/ReportByCustomerAndProduct")
  Future<BaseAPIResponse<List<MaterialBillRepByCustomerResponse>>>
      materialBillRepByCustomer(
    @Field("persianFromStrDate") String persianFromStrDate,
    @Field("persianToStrDate") String persianToStrDate,
    @Field("dbName") String dbName,
    @Field("sellerId") int customerId,
    @Field("idMarkazHazine") int costCenterId,
    @Field("productIds") List<int> productIds,
  );

  @POST("/api/Material/Reports/Sale/SaleByCar")
  Future<BaseAPIResponse<List<MaterialBillRepByCarResponse>>>
      materialBillRepByCar(
    @Field("PersianFromStrDate") String persianFromStrDate,
    @Field("PersianToStrDate") String persianToStrDate,
    @Field("DbName") String dbName,
    @Field("IdMarkazHazine") int costCenterId,
    @Field("sellerId") int customerId,
  );

  @POST("/api/Material/Reports/Voroodi/VoroodiDetailedReport")
  Future<BaseAPIResponse<List<MaterialDetailedIncomingRepResponse>>>
      materialDetailedIncomingRep(
    @Field("persianFromStrDate") String persianFromStrDate,
    @Field("persianToStrDate") String persianToStrDate,
    @Field("dbName") String dbName,
    @Field("idMarkazHazine") int costCenterId,
    @Field("carId") int carId,
    @Field("sellerId") int customerId,
    @Field("productList") List<int> productIds,
  );

  @POST("/api/Material/Reports/Voroodi/VoroodiByKala")
  Future<BaseAPIResponse<List<MaterialIncomingRepByProductResponse>>>
      materialIncomingRepByProduct(
    @Field("persianFromStrDate") String persianFromStrDate,
    @Field("persianToStrDate") String persianToStrDate,
    @Field("dbName") String dbName,
    @Field("idMarkazHazine") int costCenterId,
    @Field("productIds") List<int> productIds,
  );

  @POST("/api/Material/Reports/Voroodi/VoroodiByCar")
  Future<BaseAPIResponse<List<MaterialIncomingRepByCarResponse>>>
      materialIncomingRepByCar(
    @Field("persianFromStrDate") String persianFromStrDate,
    @Field("persianToStrDate") String persianToStrDate,
    @Field("dbName") String dbName,
    @Field("idMarkazHazine") int costCenterId,
    @Field("sellerId") int customerId,
  );

  @POST("/api/Material/Reports/Voroodi/CumulativeReportBySeller")
  Future<BaseAPIResponse<List<MaterialIncomingRepByCustomerResponse>>>
      materialIncomingRepByCustomer(
    @Field("PersianFromStrDate") String persianFromStrDate,
    @Field("PersianToStrDate") String persianToStrDate,
    @Field("DbName") String dbName,
    @Field("IdMarkazHazine") int costCenterId,
    @Field("sellerId") int customerId,
  );

  @POST("/api/Material/Reports/Voroodi/ReportByCustomerAndProduct")
  Future<BaseAPIResponse<List<MaterialIncomingRepByCustomerAndProductResponse>>>
      materialIncomingRepByCustomerAndProduct(
    @Field("PersianFromStrDate") String persianFromStrDate,
    @Field("PersianToStrDate") String persianToStrDate,
    @Field("DbName") String dbName,
    @Field("IdMarkazHazine") int costCenterId,
    @Field("sellerId") int customerId,
    @Field("productIds") List<int> productIds,
  );

  @GET("/api/Material/Reports/Mine/MineDailyReport")
  Future<BaseAPIResponse<List<MaterialMineDailyRepResponse>>>
      materialMineDailyRep(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("DbName") String dbName,
    @Query("IdMarkazHazine") int costCenterId,
  );

  @GET("/api/Material/Reports/Mine/MineMonthlyReport")
  Future<BaseAPIResponse<List<MaterialMineMonthlyRepResponse>>>
      materialMineMonthlyRep(
    @Query("Year") String year,
    @Query("DbName") String dbName,
    @Query("IdMarkazHazine") int costCenterId,
  );

  @GET("/api/Material/Reports/Mine/MostCarrierReport")
  Future<BaseAPIResponse<List<MaterialMostCarrierRepResponse>>>
      materialMostCarrierRep(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("DbName") String dbName,
    @Query("IdMarkazHazine") int costCenterId,
  );

  @GET("/api/Material/Reports/Mine/TransportToSaleRatioReport")
  Future<BaseAPIResponse<MaterialMineTransportToSaleRatioReportResponse>>
      materialMineTransportToSaleRatioReport(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("DbName") String dbName,
    @Query("IdMarkazHazine") int costCenterId,
  );

  @POST("/api/SharedParams/GetCacheParams")
  Future<BaseAPIResponse<CacheParamsResponse>> getCacheParams(
    @Field("cacheKeys") List<String> cacheKeys,
    @Field("dbName") String dbName,
  );

  @POST("/api/SharedParams/GetHesabTafsiliList")
  Future<BaseAPIResponse<List<TafsiliResponse>>> getHesabTafsiliList(
    @Field("idTaf") List<int> idTaf,
    @Field("idGoroTaf") List<int> idGoroTaf,
    @Field("dbName") String dbName,
  );

  @GET("/api/Sale/Reports/Summary/DailySummaryReport")
  Future<BaseAPIResponse<SaleDailySummaryRepResponse>> saleDailySummaryRep(
    @Query("Date") String date,
    @Query("DbName") String dbName,
  );

  @GET("/api/PlateReader/reports/DailySummary")
  Future<BaseAPIResponse<PlateDailySummaryRepResponse>> plateDailySummaryRep(
    @Query("Date") String date,
  );

  @GET("/api/Treasury/Reports/Summary/DailySummaryReport")
  Future<BaseAPIResponse<TreasuryDailySummaryRepResponse>>
      treasuryDailySummaryRep(
    @Query("PersianDate") String date,
    @Query("DbName") String dbName,
  );

  @GET("/api/Finance/Reports/Summary/DailySummary")
  Future<BaseAPIResponse<FinanceDailySummaryRepResponse>>
      financeDailySummaryRep(
    @Query("Date") String date,
    @Query("DbName") String dbName,
  );

  @GET("/api/Material/Reports/Summary/DailySummary")
  Future<BaseAPIResponse<MaterialDailySummaryRepResponse>>
      materialDailySummaryRep(
    @Query("Date") String date,
    @Query("DbName") String dbName,
    @Query("IdMarkazHazine") int costCenterId,
  );

  @POST("/api/Concrete/Reports/Summary/DailySummary")
  Future<BaseAPIResponse<ConcreteDailySummaryRepResponse>>
      concreteDailySummaryRep(
    @Field("Date") String date,
    @Field("DbName") String dbName,
  );

  @GET("/api/Bascule/Reports/Summary/DailySummaryReport")
  Future<BaseAPIResponse<BasculeDailySummaryRepResponse>>
      basculeDailySummaryRep(
    @Query("Date") String date,
    @Query("DbName") String dbName,
  );

  @POST("/api/Treasury/Reports/Other/Daryaft")
  Future<BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>?>>
      treasuryDaryaftRep(
    @Field("persianFromDate") String persianFromDate,
    @Field("persianToDate") String persianToDate,
    @Field("naghdi") bool naghdi,
    @Field("havale") bool havale,
    @Field("kart") bool kart,
    @Field("check") bool check,
    @Field("idPardakhtKonande") int idPardakhtKonande,
    @Field("idDaryaftKonande") int idDaryaftKonande,
    @Field("dbName") String dbName,
  );

  @POST("/api/Treasury/Reports/Other/DaryaftBeTafkikHesab")
  Future<
          BaseAPIResponse<
              List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>?>>
      treasuryDaryaftBeTafkikHesabRep(
    @Field("persianFromDate") String persianFromDate,
    @Field("persianToDate") String persianToDate,
    @Field("dbName") String dbName,
  );

  @POST("/api/Treasury/Reports/Other/GoTajmiDaryaft")
  Future<BaseAPIResponse<List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>?>>
      treasuryGoTajmiDaryaftRep(
    @Field("persianFromDate") String persianFromDate,
    @Field("persianToDate") String persianToDate,
    @Field("dbName") String dbName,
  );

  @POST("/api/Treasury/Reports/Other/GoTajmiPardakht")
  Future<BaseAPIResponse<List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse>?>>
      treasuryGoTajmiPardakhtRep(
    @Field("persianFromDate") String persianFromDate,
    @Field("persianToDate") String persianToDate,
    @Field("dbName") String dbName,
  );

  @POST("/api/Treasury/Reports/Other/Pardakht")
  Future<BaseAPIResponse<List<TreasuryDaryaftAndPardakhtRepResponse>?>>
      treasuryPardakhtRep(
    @Field("persianFromDate") String persianFromDate,
    @Field("persianToDate") String persianToDate,
    @Field("dbName") String dbName,
    @Field("naghdi") bool naghdi,
    @Field("havale") bool havale,
    @Field("kart") bool kart,
    @Field("check") bool check,
    @Field("idPardakhtKonande") int idPardakhtKonande,
    @Field("idDaryaftKonande") int idDaryaftKonande,
  );

  @POST("/api/Treasury/Reports/Other/PardakhtBeTafkikHesab")
  Future<
          BaseAPIResponse<
              List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse>?>>
      treasuryPardakhtBeTafkikHesabRep(
    @Field("persianFromDate") String persianFromDate,
    @Field("persianToDate") String persianToDate,
    @Field("dbName") String dbName,
  );

  @GET("/api/Finance/Reports/Financial/BedBesReport")
  Future<BaseAPIResponse<FinancialBedBesResponse?>>
      financialBedBesReport(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("GoroohTafsiliList") List<int>? goroohTafsiliList,
    @Query("Bedehkar") bool bedehkar,
    @Query("Bestankar") bool bestankar,
    @Query("Bihesab") bool bihesab,
    @Query("BedFrom") int bedFrom,
    @Query("BedTo") int bedTo,
    @Query("BesFrom") int besFrom,
    @Query("BesTo") int besTo,
    @Query("DbName") String dbName,
  );

  @GET("/api/Finance/Reports/Financial/GozareshHesab")
  Future<BaseAPIResponse<List<FinancialGozareshHesabRepResponse>?>>
      financialGozareshHesabReport(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("HesabTafsili") int hesabTafsili,
    @Query("MoinList") List<int> moinList,
    @Query("ShowMandeHesabGhabli") bool showMandeHesabGhabli,
    @Query("ShowRizFactor") bool showRizFactor,
    @Query("ShowKerayeHaml") bool showKerayeHaml,
    @Query("DbName") String dbName,
  );

  @GET("/api/Concrete/ConcreteOrder/GetOrdersInDay")
  Future<BaseAPIResponse<List<ConcreteOrdersInDayRepResponse>?>>
      concreteOrdersInDayReport(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("workStatus") int workStatus,
    @Query("DbName") String dbName,
  );

  @POST("/api/Concrete/Reports/Customers/ConcreteSaleDetailedReport")
  Future<BaseAPIResponse<List<ConcreteSaleDetailedRepResponse>?>>
      concreteSaleDetailedReport(
    @Field("persianFromStrDate") String persianFromStrDate,
    @Field("persianToStrDate") String persianToStrDate,
    @Field("productIds") List<int> productIds,
    @Field("customerId") int customerId,
    @Field("carId") int carId,
    @Field("driverName") String driverName,
    @Field("dbName") String dbName,
  );

  @GET("/api/Concrete/Reports/Customers/ReportByCustomerAndProduct")
  Future<BaseAPIResponse<List<ConcreteReportByCustomerAndProductResponse>?>>
      concreteReportByCustomerAndProduct(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("ProductIds") List<int> productIds,
    @Query("CustomerId") int customerId,
    @Query("DbName") String dbName,
  );

  @POST("/api/Concrete/Reports/Sales/ByProduct")
  Future<BaseAPIResponse<List<ConcreteSalesByProductRepResponse>?>>
      concreteSalesByProductRep(
    @Field("persianFromStrDate") String persianFromStrDate,
    @Field("persianToStrDate") String persianToStrDate,
    @Field("productIds") List<int> productIds,
    @Field("dbName") String dbName,
  );

  @GET("/api/Concrete/Reports/Sales/DailyTotaled")
  Future<BaseAPIResponse<List<ConcreteSalesDailyTotaledRepResponse>?>>
      concreteSalesDailyTotaledRep(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("DbName") String dbName,
  );

  @GET("/api/Concrete/Reports/Mixer/DailyCumulativeReport")
  Future<BaseAPIResponse<List<ConcreteMixerDailyCumulativeRepResponse>?>>
      concreteMixerDailyCumulativeRep(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("CarId") int carId,
    @Query("DriverName") String driverName,
    @Query("DbName") String dbName,
  );

  @GET("/api/Concrete/Reports/Mixer/DriverDetailedReport")
  Future<BaseAPIResponse<List<ConcreteMixerDriverDetailedRepResponse>?>>
      concreteMixerDriverDetailedRep(
    @Query("PersianFromStrDate") String persianFromStrDate,
    @Query("PersianToStrDate") String persianToStrDate,
    @Query("CustomerId") int customerId,
    @Query("DriverName") String driverName,
    @Query("DbName") String dbName,
  );

  @POST("/api/Concrete/Reports/Pomp/KarkardPomp")
  Future<BaseAPIResponse<List<ConcretePompKarkardPompRepResponse>?>>
      concretePompKarkardPompRep(
    @Field("persianFromStrDate") String persianFromStrDate,
    @Field("persianToStrDate") String persianToStrDate,
    @Field("pompId") int pompId,
    @Field("dbName") String dbName,
  );

  @POST("/api/Management/LockHesab")
  Future<BaseAPIResponse<String?>> managementLockHesab(
    @Field("lockDate") String lockDate,
    @Field("dbName") String dbName,
  );

  @POST("/api/Management/SetHesabLockConditions")
  Future<BaseAPIResponse<String?>> managementSetHesabLockConditions(
    @Field("lockDate") String lockDate,
    @Field("lockAutomatic") bool lockAutomatic,
    @Field("lockDayLength") int lockDayLength,
    @Field("dbName") String dbName,
  );

  @POST("/api/Concrete/ConcreteOrder/AddOrder")
  Future<BaseAPIResponse<String?>> concreteAddOrder(
    @Field("persianDate") String persianDate,
    @Field("time") String time,
    @Field("address") String address,
    @Field("workType") String workType,
    @Field("dbName") String dbName,
    @Field("customerId") int customerId,
    @Field("productId") int productId,
    @Field("pompId") int pompId,
    @Field("meghdar") double meghdar,
    @Field("tolerance") double tolerance,
    @Field("controlType") int controlType,
  );

  @GET("/api/Management/GetHesabLockConditions")
  Future<BaseAPIResponse<ManagementGetHesabLockConditionsResponse>>
      managementGetHesabLockConditions(
    @Query("DbName") String dbName,
  );

  @POST("/api/PlateReader/reports/DailyTotaledReport")
  Future<
      BaseAPIResponse<
          List<PlateReaderDailyTotaledAndTotaledRepRepResponse>?>>
  plateReaderDailyTotaledRep(
      @Field("fromDate") String fromDate,
      @Field("toDate") String toDate,
      @Field("p1") int p1,
      @Field("p2") String p2,
      @Field("p3") int p3,
      @Field("p4") int p4,
      @Field("instanceId") int instanceId,
      @Field("showReserves") bool showReserves,
      @Field("pageNumber") int pageNumber,
      @Field("pageSize") int pageSize,
      );

  @POST("/api/PlateReader/reports/DetailedReport")
  Future<BaseAPIResponse<List<PlateReaderDetailedRepResponse>?>>
  plateReaderDetailedRep(
      @Field("fromDate") String fromDate,
      @Field("toDate") String toDate,
      @Field("p1") int p1,
      @Field("p2") String p2,
      @Field("p3") int p3,
      @Field("p4") int p4,
      @Field("instanceId") int instanceId,
      @Field("showReserves") bool showReserves,
      @Field("pageNumber") int pageNumber,
      @Field("pageSize") int pageSize,
      );

  @POST("/api/PlateReader/reports/TotaledReport")
  Future<
      BaseAPIResponse<
          List<PlateReaderDailyTotaledAndTotaledRepRepResponse>?>>
  plateReaderTotaledRep(
      @Field("fromDate") String fromDate,
      @Field("toDate") String toDate,
      @Field("p1") int p1,
      @Field("p2") String p2,
      @Field("p3") int p3,
      @Field("p4") int p4,
      @Field("instanceId") int instanceId,
      @Field("showReserves") bool showReserves,
      @Field("pageNumber") int pageNumber,
      @Field("pageSize") int pageSize,
      );


  @GET("/api/PlateReader/reports/GetInstanceList")
  Future<
          BaseAPIResponse<
              List<PlateReaderInstanceListResponse>?>>
      plateReaderGetInstanceList();

}

// flutter pub run build_runner build --delete-conflicting-outputs

// concrete Amade
/// sefaresh concrete
//// /api/Concrete/ConcreteOrder/GetOrdersInDay // usecase ok

/// gozareshat concrete
//// /api/Concrete/Reports/Customers/ConcreteSaleDetailedReport //ok
//// /api/Concrete/Reports/Customers/ReportByCustomerAndProduct //ok
//// /api/Concrete/Reports/Sales/ByProduct //usecase ok
//// /api/Concrete/Reports/Sales/DailyTotaled // usecase ok

/// gozareshat voroodi
//// /api/Material/Reports/Voroodi/VoroodiDetailedReport //ok
//// /api/Material/Reports/Voroodi/VoroodiByKala //ok
//// /api/Material/Reports/Voroodi/VoroodiByCar //ok
//// /api/Material/Reports/Voroodi/CumulativeReportBySeller //ok
//// /api/Material/Reports/Voroodi/ReportByCustomerAndProduct //ok

/// gozareshat mixer
//// /api/Concrete/Reports/Mixer/DailyCumulativeReport //ok
//// /api/Concrete/Reports/Mixer/DriverDetailedReport //ok

/// gozareshat pomp
//// /api/Concrete/Reports/Mixer/DriverDetailedReport //ok
//// /api/Concrete/Reports/Pomp/KarkardPomp //customer ok

//mali
// /api/Finance/Reports/Financial/BedBesReport  //ok
// /api/Finance/Reports/Financial/GozareshHesab  //ok

//pelakkhan
// /api/PlateReader/reports/DetailedReport // ok
// /api/PlateReader/reports/DailyTotaledReport // ok
// /api/PlateReader/reports/TotaledReport

// modirayat
// http://37.156.14.41:2050/api/Management/LockHesab  //customer ok
// /api/Management/GetHesabLockConditions  //ok
// /api/Management/SetHesabLockConditions  //ok

//summary
// http://2.180.16.13:2050/api/Sale/Reports/Summary/DailySummaryReport?Date=1402%2F01%2F29&DbName=Kia1400 //ok
// http://2.180.16.13:2050/api/Treasury/Reports/Summary/DailySummaryReport?PersianDate=1402%2F01%2F29&DbName=Kia1400 // ok
// http://2.180.16.13:2050/api/Finance/Reports/Summary/DailySummary?Date=1402%2F01%2F29&DbName=Kia1400 // ok
// http://2.180.16.13:2050/api/Material/Reports/Summary/DailySummary?Date=1402%2F01%2F29&DbName=Kia1400 // ok
// http://2.180.16.13:2050/api/PlateReader/reports/DailySummary?Date=1402%2F01%2F29&DbName=Kia1400 // ok
// concrete amade name/api/Concrete/Reports/Summary/DailySummary //ok
// bascule jade api/Bascule/Reports/Summary/DailySummaryReport?Date=1402%2F01%2F29&DbName=kia6 //ok

// khazane
// /api/Treasury/Reports/Other/Daryaft //ok
// /api/Treasury/Reports/Other/DaryaftBeTafkikHesab //ok
// /api/Treasury/Reports/Other/GoTajmiDaryaft //ok
// /api/Treasury/Reports/Other/GoTajmiPardakht //ok
// /api/Treasury/Reports/Other/Pardakht //ok
// /api/Treasury/Reports/Other/PardakhtBeTafkikHesab //ok
