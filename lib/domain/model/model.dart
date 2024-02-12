import 'dart:ui';
import 'package:json_annotation/json_annotation.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

part 'model.g.dart';

class DeviceInfo {
  String deviceName;
  String identifier;
  String version;
  int deviceType;

  DeviceInfo(this.deviceName, this.identifier, this.version, this.deviceType);
}

class Company {
  final int id;
  final int customerId;
  final String customerName;
  final String serverAddress;
  final String serverPassword;
  final String serverDbName;
  final String description;
  final bool accountingAccess;
  final bool treasuryAccess;
  final bool saleAccess;
  final bool storeAccess;
  final bool salaryAccess;
  final bool concreteAccess;
  final bool sanadAccess;
  final bool weightAccess;
  final bool plateReaderAccess;
  final bool sandAccess;
  final bool managementAccess;

  Company(
      this.id,
      this.customerId,
      this.customerName,
      this.serverAddress,
      this.serverPassword,
      this.serverDbName,
      this.description,
      this.accountingAccess,
      this.treasuryAccess,
      this.saleAccess,
      this.storeAccess,
      this.salaryAccess,
      this.concreteAccess,
      this.sanadAccess,
      this.weightAccess,
      this.plateReaderAccess,
      this.sandAccess,
      this.managementAccess);
}

class FiscalYear {
  String dbName;
  String description;
  String startDate;
  String endDate;

  FiscalYear(this.dbName, this.description, this.startDate, this.endDate);
}

@JsonSerializable()
class FiscalYearLoginData {
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "dbName")
  String dbName;

  FiscalYearLoginData(this.username, this.password, this.dbName);

  factory FiscalYearLoginData.fromJson(Map<String, dynamic> json) =>
      _$FiscalYearLoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$FiscalYearLoginDataToJson(this);
}

class MaterialBillRep {
  final String persianDate;
  final String billNumber;
  final String customerName;
  final String time;
  final String productName;
  final String weight;
  final String unitPrice;
  final String totalPrice;
  final String customerFare;
  final String truckFare;
  final String receivedPrice;
  final String cash;
  final String card;
  final String remaining;
  final String plateNumber;
  final String address;
  final String driverName;
  final String discount;
  final String amount;

  MaterialBillRep(
      this.persianDate,
      this.billNumber,
      this.customerName,
      this.time,
      this.productName,
      this.weight,
      this.unitPrice,
      this.totalPrice,
      this.customerFare,
      this.truckFare,
      this.receivedPrice,
      this.cash,
      this.card,
      this.remaining,
      this.plateNumber,
      this.address,
      this.driverName,
      this.discount,
      this.amount);
}

class MaterialBillRepByCustomer {
  final int customerCode;
  final String customerName;
  final String serviceCount;
  final double totalJamKol;
  final String totalJamKolStr;
  final double totalProductWeight;
  final int totalServiceCount;
  final int productCount;
  final List<MaterialBillProduct> products;

  MaterialBillRepByCustomer(
      this.customerCode,
      this.customerName,
      this.serviceCount,
      this.totalJamKol,
      this.totalJamKolStr,
      this.totalProductWeight,
      this.totalServiceCount,
      this.productCount,
      this.products);
}

class MaterialBillProduct {
  final int productCode;
  final String productName;
  final double weight;
  final int serviceCount;
  final double jamKol;
  final String jamKolStr;

  MaterialBillProduct(this.productCode, this.productName, this.weight,
      this.serviceCount, this.jamKol, this.jamKolStr);
}

class MaterialDailySummaryRep {
  final List<ChartList> cardList;
  final List<ChartList> chartList;

  MaterialDailySummaryRep(this.cardList, this.chartList);
}

class ConcreteDailySummaryRep {
  final List<ChartList> cardList;
  final List<ChartList> chartList;

  ConcreteDailySummaryRep(this.cardList, this.chartList);
}

class SaleDailySummaryRep {
  final List<ChartList> cardList;
  final List<ChartList> chartList;

  SaleDailySummaryRep(this.cardList, this.chartList);
}

class PlateDailySummaryRep {
  final List<ChartList> cardList;

  PlateDailySummaryRep(this.cardList);
}

class BasculeDailySummaryRep {
  final List<ChartList> cardList;

  BasculeDailySummaryRep(this.cardList);
}

class TreasuryDailySummaryRep {
  final List<ChartList> cardList;

  TreasuryDailySummaryRep(this.cardList);
}

class FinanceDailySummaryRep {
  final List<ChartList> cardList;

  FinanceDailySummaryRep(this.cardList);
}

class ChartList {
  final int uniqueId;
  final String title;
  final bool show;
  final List<ChartCardItem> data;

  ChartList(this.uniqueId, this.title, this.show, this.data);
}

class ChartCardItem {
  final String key;
  final String value;
  final String stringValue;

  ChartCardItem(this.key, this.value, this.stringValue);
}

class MaterialBillRepByProduct {
  final String productCode;
  final String productName;
  final String amount;
  final String unitPrice;
  final String salePrice;
  final String discount;
  final String tax;
  final String totalPrice;
  final String serviceCount;

  MaterialBillRepByProduct(
      this.productCode,
      this.productName,
      this.amount,
      this.unitPrice,
      this.salePrice,
      this.discount,
      this.tax,
      this.totalPrice,
      this.serviceCount);
}

class MaterialBillRepByCar {
  final String plateNumber;
  final String serviceCount;
  final String totalAmount;

  MaterialBillRepByCar(this.plateNumber, this.serviceCount, this.totalAmount);
}

class MaterialDetailedIncomingRep {
  final String date;
  final String time;
  final String ticketNumber;
  final String noeKala;
  final String amount;
  final String plateNumber;
  final String driverName;
  final int registrationType;
  final String registrationTypeName;
  final String unitPrice;
  final int customerId;
  final String customerName;
  final String netPrice;
  final String totalPrice;
  final String billNumber;
  final String billDate;
  final String emptyScale;
  final String fullScale;
  final String carType;
  final String description;

  MaterialDetailedIncomingRep(
      this.date,
      this.time,
      this.ticketNumber,
      this.noeKala,
      this.amount,
      this.plateNumber,
      this.driverName,
      this.registrationType,
      this.registrationTypeName,
      this.unitPrice,
      this.customerId,
      this.customerName,
      this.netPrice,
      this.totalPrice,
      this.billNumber,
      this.billDate,
      this.emptyScale,
      this.fullScale,
      this.carType,
      this.description);
}

class MaterialIncomingRepByProduct {
  final String productType;
  final String productName;
  final String serviceCount;
  final String totalAmount;

  MaterialIncomingRepByProduct(
      this.productType, this.productName, this.serviceCount, this.totalAmount);
}

class MaterialIncomingRepByCar {
  final String plateNumber;
  final String serviceCount;
  final String meghdarKol;

  MaterialIncomingRepByCar(
      this.plateNumber, this.serviceCount, this.meghdarKol);
}

class MaterialIncomingRepByCustomer {
  final String customerName;
  final String serviceCount;
  final String meghdarKol;

  MaterialIncomingRepByCustomer(
      this.customerName, this.serviceCount, this.meghdarKol);
}

class MaterialIncomingRepByCustomerAndProduct {
  final int customerCode;
  final String customerName;
  final double totalProductWeight;
  final int totalServiceCount;
  final int productCount;
  final List<MaterialIncomingRepByCustomerAndProductProductItem> products;

  MaterialIncomingRepByCustomerAndProduct(
      this.customerCode,
      this.customerName,
      this.totalProductWeight,
      this.totalServiceCount,
      this.productCount,
      this.products);
}

class MaterialIncomingRepByCustomerAndProductProductItem {
  final int productCode;
  final String productName;
  final double weight;
  final int serviceCount;

  MaterialIncomingRepByCustomerAndProductProductItem(
      this.productCode, this.productName, this.weight, this.serviceCount);
}

class MaterialMineDailyRep {
  final String date;
  final String serviceCount;
  final String meghdar;
  final String loadingTotalPrice;
  final String jamKerayeHaml;
  final String factorTotalPrice;

  MaterialMineDailyRep(this.date, this.serviceCount, this.meghdar,
      this.loadingTotalPrice, this.jamKerayeHaml, this.factorTotalPrice);
}

class MaterialMineMonthlyRep {
  final String monthName;
  final String serviceCount;
  final String meghdar;
  final String jamMablaghBargiri;
  final String jamKerayeKar;
  final String factorTotalPrice;

  MaterialMineMonthlyRep(this.monthName, this.serviceCount, this.meghdar,
      this.jamMablaghBargiri, this.jamKerayeKar, this.factorTotalPrice);
}

class MaterialMineMostCarrierRep {
  final String carCode;
  final String plateNumber;
  final String serviceCount;
  final String meghdar;
  final String jamKerayeHaml;

  MaterialMineMostCarrierRep(this.carCode, this.plateNumber, this.serviceCount,
      this.meghdar, this.jamKerayeHaml);
}

class MaterialMineTransportToSaleRatioReport {
  final double saleAmount;
  final double transportAmount;
  final String ratio;
  final String ratioStr;

  MaterialMineTransportToSaleRatioReport(
      this.saleAmount, this.transportAmount, this.ratio, this.ratioStr);
}

///////////////////////////// khazaneh dari ///////////////////////////

class TreasuryDaryaftAndPardakhtRep {
  String date;
  String radif;
  String pardakhtKonande;
  String daryaftKonande;
  String mablagh;
  String noe;
  String serial;
  String description;

  TreasuryDaryaftAndPardakhtRep(
      this.date,
      this.radif,
      this.pardakhtKonande,
      this.daryaftKonande,
      this.mablagh,
      this.noe,
      this.serial,
      this.description);
}

class TreasuryDaryaftAndPardakhtBeTafkikHesabRep {
  String hesab;
  String mablagh;

  TreasuryDaryaftAndPardakhtBeTafkikHesabRep(this.hesab, this.mablagh);
}

class TreasuryGoTajmiDaryaftAndPardakhtRep {
  String naghdi;
  String check;
  String havale;
  String kartKhan;

  TreasuryGoTajmiDaryaftAndPardakhtRep(
      this.naghdi, this.check, this.havale, this.kartKhan);
}

///////////////////////////// khazaneh dari ///////////////////////////

/////////////////////////////

class ReportItemDataField {
  final String key;
  final String value;
  final Color? color;
  final List<ReportItemData>? list;

  ReportItemDataField(this.key, this.value, {this.color, this.list});
}

class ReportItemData {
  final String? imageUrl;
  final String? imageUrl2;
  final List<ReportItemDataField> items;
  final String title;
  final ReportItemDataField? header;
  final ReportItemDataField? footer;

  ReportItemData(
      {this.imageUrl,
      this.imageUrl2,
      required this.items,
      required this.title,
      this.header,
      this.footer});
}

class ChartItemDataField {
  final String key;
  final double value;
  final Color? color;

  ChartItemDataField(this.key, this.value, {this.color});
}

class ChartItemData {
  List<ChartItemDataField> chartItemDataList;
  final String title;

  ChartItemData({required this.chartItemDataList, required this.title});
}

class ReportListViewItem {
  final ReportModule type;
  final String name;
  final String image;

  ReportListViewItem(this.name, this.image, this.type);
}

class ReportListViewData {
  final String title;
  final List<ReportListViewItem> items;

  ReportListViewData({required this.title, required this.items});
}

//////////////////////////////////////////////////////////////////////////

class CacheParams {
  final List<CacheParamValueMadan> madan;
  final List<CacheParamValueAnbar> anbar;
  final List<CacheParamValueGoroohTafsili> goroohTafsili;
  final List<CacheParamValueMarkazHazineh> markazHazineh;
  final List<CacheParamValueMoin> moin;
  final List<CacheParamValueCustomers> customer;
  final List<CacheParamValueProducts> product;
  final List<CacheParamValueCarList> car;
  final List<CacheParamValuePomp> pomp;
  final List<CacheParamValueBetonWorkType> betonWorkType;
  final List<CacheParamValueShrayetMohitiBeton> betonSharayetMohiti;

  CacheParams(
      this.madan,
      this.anbar,
      this.goroohTafsili,
      this.markazHazineh,
      this.moin,
      this.customer,
      this.product,
      this.car,
      this.pomp,
      this.betonWorkType,
      this.betonSharayetMohiti);
}

class Tafsili {
  int idTafsili;
  int codTafsili;
  int idGoroTafsili;
  String nameTafsili;
  String nameGoroTafsili;
  String dbName;

  Tafsili(this.idTafsili, this.codTafsili, this.nameTafsili, this.idGoroTafsili,
      this.nameGoroTafsili, this.dbName);
}

abstract class CacheParamValue {}

class CacheParamValueBetonWorkType extends CacheParamValue {
  int id;
  String workType;

  CacheParamValueBetonWorkType(this.id, this.workType);
}

class CacheParamValueShrayetMohitiBeton extends CacheParamValue {
  int id;
  String name;
  String value;

  CacheParamValueShrayetMohitiBeton(this.id, this.name, this.value);
}

class CacheParamValueMadan extends CacheParamValue {
  int id;
  String name;

  CacheParamValueMadan(this.id, this.name);
}

class CacheParamValueAnbar extends CacheParamValue {
  int id;
  String name;

  CacheParamValueAnbar(this.id, this.name);
}

class CacheParamValueGoroohTafsili extends CacheParamValue {
  int id;
  String name;

  CacheParamValueGoroohTafsili(this.id, this.name);
}

class CacheParamValueMarkazHazineh extends CacheParamValue {
  String key;
  int value;
  String stringValue;

  CacheParamValueMarkazHazineh(this.key, this.value, this.stringValue);
}

class CacheParamValueMoin extends CacheParamValue {
  int id;
  String codeMali;
  String nameHesab;
  String codMaliKol;
  String nameHesabKol;

  CacheParamValueMoin(this.id, this.codeMali, this.nameHesab, this.codMaliKol,
      this.nameHesabKol);
}

class CacheParamValueCustomers extends CacheParamValue {
  int customerId;
  String customerCode;
  String customerName;
  String customerTitle;
  String categoryName;

  CacheParamValueCustomers(this.customerId, this.customerCode,
      this.customerName, this.customerTitle, this.categoryName);
}

class CacheParamValueProducts extends CacheParamValue {
  int productId;
  String productCode;
  String productName;
  String productUnit;

  CacheParamValueProducts(
      this.productId, this.productCode, this.productName, this.productUnit);
}

class CacheParamValueCarList extends CacheParamValue {
  int carId;
  String carCode;
  String plateNumber;
  String plateP1;
  String plateP2;
  String plateP3;
  String plateP4;
  String driverName;
  String carOwner;
  String carModelName;

  CacheParamValueCarList(
      this.carId,
      this.carCode,
      this.plateNumber,
      this.plateP1,
      this.plateP2,
      this.plateP3,
      this.plateP4,
      this.driverName,
      this.carOwner,
      this.carModelName);
}

class CacheParamValuePomp extends CacheParamValue {
  int id;
  String code;
  String pompDriver;

  CacheParamValuePomp(this.id, this.code, this.pompDriver);
}

class GetHesabLockConditions {
  String lockDate;
  bool lockAutomatic;
  int lockDayLength;

  GetHesabLockConditions(this.lockDate, this.lockAutomatic, this.lockDayLength);
}
////////////////////////////////////////////////////////////////////////////////

class ConcreteOrdersInDayRep {
  int id;
  String date;
  String time;
  int customerId;
  String customerName;
  String address;
  int pompId;
  String pompCode;
  String pompDriver;
  double meghdar;
  double meghdarBargashti;
  String tolerance;
  double meghdarErsali;
  double meghdarMande;
  String productCode;
  String productName;
  int controlType;
  String controlTypeName;
  String processStatusName;
  String workTypeName;
  String workStatusName;
  String workStatusDescription;
  int workStatus;
  int processStatus;
  String finalStatusOrder;

  ConcreteOrdersInDayRep(
      this.id,
      this.date,
      this.time,
      this.customerId,
      this.customerName,
      this.address,
      this.pompId,
      this.pompCode,
      this.pompDriver,
      this.meghdar,
      this.meghdarBargashti,
      this.tolerance,
      this.meghdarErsali,
      this.meghdarMande,
      this.productCode,
      this.productName,
      this.controlType,
      this.controlTypeName,
      this.processStatusName,
      this.workTypeName,
      this.workStatusName,
      this.workStatusDescription,
      this.workStatus,
      this.processStatus,
      this.finalStatusOrder);
}

class ConcreteSaleDetailedRep {
  String date;
  String shomareGhabz;
  String time;
  String customerCode;
  String customerName;
  String productCode;
  String productName;
  String ayar;
  int totalWeight;
  int pureWeight;
  String ersali;
  String daryafti;
  String meghdar;
  String mablaghJoz;
  String productPrice;
  String driverName;
  String plateNumber;
  String pompOperator;
  String pompType;
  String anbar;
  String address;
  String workType;

  ConcreteSaleDetailedRep(
      this.date,
      this.shomareGhabz,
      this.time,
      this.customerCode,
      this.customerName,
      this.productCode,
      this.productName,
      this.ayar,
      this.totalWeight,
      this.pureWeight,
      this.ersali,
      this.daryafti,
      this.meghdar,
      this.mablaghJoz,
      this.productPrice,
      this.driverName,
      this.plateNumber,
      this.pompOperator,
      this.pompType,
      this.anbar,
      this.address,
      this.workType);
}

class ConcreteReportByCustomerAndProduct {
  String? customerCode;
  String? customerName;
  String? productCode;
  String? productName;
  String? pureWeight;
  String? serviceCount;
  String? mablaghJoz;
  String? unitPrice;
  String? totalPrice;
  String? keraye;

  ConcreteReportByCustomerAndProduct(
      this.customerCode,
      this.customerName,
      this.productCode,
      this.productName,
      this.pureWeight,
      this.serviceCount,
      this.mablaghJoz,
      this.unitPrice,
      this.totalPrice,
      this.keraye);
}

class ConcreteSalesByProductRep {
  String productName;
  String productCode;
  String meghdar;
  String serviceCount;
  double unitPrice;
  double salePrice;

  ConcreteSalesByProductRep(this.productName, this.productCode, this.meghdar,
      this.serviceCount, this.unitPrice, this.salePrice);
}

class ConcreteSalesDailyTotaledRep {
  String date;
  String serviceCount;
  String meghdar;
  String totalPrice;

  ConcreteSalesDailyTotaledRep(
      this.date, this.serviceCount, this.meghdar, this.totalPrice);
}

////////////////////////////////////////////////////////////////////////////////

class ConcreteMixerDailyCumulativeRep {
  String date;
  String driver;
  String plateNumber;
  int carId;
  String serviceCount;
  String hamlShode;
  String meghdarBeton;

  ConcreteMixerDailyCumulativeRep(this.date, this.driver, this.plateNumber,
      this.carId, this.serviceCount, this.hamlShode, this.meghdarBeton);
}

class ConcreteMixerDriverDetailedRep {
  String date;
  String time;
  int shomareGhabz;
  String customerCode;
  String customerName;
  int driverId;
  String driverName;
  String hamlShode;
  String mixerReward;
  String mixerTotalReward;

  ConcreteMixerDriverDetailedRep(
      this.date,
      this.time,
      this.shomareGhabz,
      this.customerCode,
      this.customerName,
      this.driverId,
      this.driverName,
      this.hamlShode,
      this.mixerReward,
      this.mixerTotalReward);
}

class ConcretePompKarkardPompRep {
  String date;
  String codePomp;
  String namePomp;
  String tedadIstgah;
  String jamPompazh;
  String tedadMixer;

  ConcretePompKarkardPompRep(this.date, this.codePomp, this.namePomp,
      this.tedadIstgah, this.jamPompazh, this.tedadMixer);
}

class FinancialBedBesRep {
  List<FinancialBedBesRepDetail> details;
  String totalMandeBedStr;
  String totalMandeBesStr;
  int totalMandeBed;
  int totalMandeBes;

  FinancialBedBesRep(this.details, this.totalMandeBedStr, this.totalMandeBesStr,
      this.totalMandeBed, this.totalMandeBes);
}

class FinancialBedBesRepDetail {
  String codHesab;
  String nameHesab;
  String title2;
  String mabBedStr;
  int mabBed;
  String mabBesStr;
  int mabBes;
  String mandeBedStr;
  int mandeBed;
  String mandeBesStr;
  int mandeBes;
  String mobile1;
  String mobile2;
  String address;

  FinancialBedBesRepDetail(
      this.codHesab,
      this.nameHesab,
      this.title2,
      this.mabBedStr,
      this.mabBed,
      this.mabBesStr,
      this.mabBes,
      this.mandeBed,
      this.mandeBedStr,
      this.mandeBes,
      this.mandeBesStr,
      this.mobile1,
      this.mobile2,
      this.address);
}

class FinancialGozareshHesabRep {
  String date;
  String noeBarge;
  String strNoeBarge;
  String shBarge;
  String description;
  String bed;
  String bes;
  String mandeh;
  String tashkhis;

  FinancialGozareshHesabRep(
      this.date,
      this.noeBarge,
      this.strNoeBarge,
      this.shBarge,
      this.description,
      this.bed,
      this.bes,
      this.mandeh,
      this.tashkhis);
}

class PlateReaderDailyTotaledAndTotaledRep {
  int rowNum;
  int p1;
  String p2;
  int p3;
  int p4;
  String plateStr;
  int instanceId;
  String instanceName;
  String readDate;
  int trafficCount;
  int totalRec;

  PlateReaderDailyTotaledAndTotaledRep(
      this.rowNum,
      this.p1,
      this.p2,
      this.p3,
      this.p4,
      this.plateStr,
      this.instanceId,
      this.instanceName,
      this.readDate,
      this.trafficCount,
      this.totalRec);
}

class PlateReaderDetailedRep {
  int rowNum;
  int p1;
  String p2;
  int p3;
  int p4;
  String plateStr;
  int instanceId;
  String instanceName;
  String readDate;
  int totalRec;
  int codedPlateNumber;
  double confidence;
  String confidenceStr;
  String carImageAddress;
  String carImageLink;
  String plateImageAddress;
  String plateImageLink;
  String loadImageAddress;
  String loadImageLink;
  int direction;
  String liveWeight;
  bool isReserved;
  String isReservedStr;
  bool isValid;
  String isValidStr;
  bool hasCarImage;
  bool hasPlateImage;
  bool hasLoadImage;
  String readTime;

  PlateReaderDetailedRep(
      this.rowNum,
      this.p1,
      this.p2,
      this.p3,
      this.p4,
      this.plateStr,
      this.instanceId,
      this.instanceName,
      this.readDate,
      this.totalRec,
      this.codedPlateNumber,
      this.confidence,
      this.confidenceStr,
      this.carImageAddress,
      this.carImageLink,
      this.plateImageAddress,
      this.plateImageLink,
      this.loadImageAddress,
      this.loadImageLink,
      this.direction,
      this.liveWeight,
      this.isReserved,
      this.isReservedStr,
      this.isValid,
      this.isValidStr,
      this.hasCarImage,
      this.hasPlateImage,
      this.hasLoadImage,
      this.readTime);
}

class PlateReaderInstanceList {
  int instanceId;
  int sendPlateDelaySeconds;
  String serviceBusAddress;
  String videoPath;
  String aiFilePath;
  String description;
  bool showBasculeWeight;
  double confidenceLimit;

  PlateReaderInstanceList(
      this.instanceId,
      this.sendPlateDelaySeconds,
      this.serviceBusAddress,
      this.videoPath,
      this.aiFilePath,
      this.description,
      this.showBasculeWeight,
      this.confidenceLimit);
}

class CustomButtonData {
  String name;
  String image;
  String routeName;

  CustomButtonData(this.name, this.image, this.routeName);
}

class CarPlate {
  int p1;
  String p2;
  int p3;
  int p4;

  CarPlate(this.p1, this.p2, this.p3, this.p4);

  @override
  String toString() => "$p1 $p2 $p3 $p4 ایران ";
}

class PdfModel {
  final String title;
  final String? subTitle;
  final String? rightText1;
  final String? rightText2;
  final String? rightText3;
  final String? rightText4;
  final String? leftText1;
  final String? leftText2;
  final String? leftText3;

  final Map<String, String> headers;
  final List<dynamic> data;
  final List<int> columnsWidth;
  final Map<String, int> bottomRow;

  PdfModel(
      {this.subTitle,
      this.rightText1,
      this.rightText2,
      this.rightText3,
      this.rightText4,
      this.leftText1,
      this.leftText2,
      this.leftText3,
      required this.columnsWidth,
      required this.title,
      required this.headers,
      required this.data,
      required this.bottomRow});
}
