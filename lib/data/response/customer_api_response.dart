import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
import 'package:kiano/data/response/base_api_response.dart';
import 'package:kiano/domain/model/model.dart';

part 'customer_api_response.g.dart';

@JsonSerializable()
class FiscalYearResponse {
  @JsonKey(name: "dbName")
  final String dbName;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "startDate")
  final String startDate;
  @JsonKey(name: "endDate")
  final String endDate;

  FiscalYearResponse(
      this.dbName, this.description, this.startDate, this.endDate);

  factory FiscalYearResponse.fromJson(Map<String, dynamic> json) =>
      _$FiscalYearResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FiscalYearResponseToJson(this);
}

@JsonSerializable()
class MaterialDailySummaryRepResponse {
  @JsonKey(name: "cardList")
  final List<CardListItemResponse> cardList;
  @JsonKey(name: "chartList")
  final List<ChartListItemResponse> chartList;

  MaterialDailySummaryRepResponse(this.cardList, this.chartList);

  factory MaterialDailySummaryRepResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialDailySummaryRepResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaterialDailySummaryRepResponseToJson(this);
}

@JsonSerializable()
class ConcreteDailySummaryRepResponse {
  @JsonKey(name: "cardList")
  final List<CardListItemResponse> cardList;
  @JsonKey(name: "chartList")
  final List<ChartListItemResponse> chartList;

  ConcreteDailySummaryRepResponse(this.cardList, this.chartList);

  factory ConcreteDailySummaryRepResponse.fromJson(Map<String, dynamic> json) =>
      _$ConcreteDailySummaryRepResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConcreteDailySummaryRepResponseToJson(this);
}

@JsonSerializable()
class SaleDailySummaryRepResponse {
  @JsonKey(name: "cardList")
  final List<SaleCardListItemResponse> cardList;
  @JsonKey(name: "chartList")
  final List<ChartListItemResponse> chartList;

  SaleDailySummaryRepResponse(this.cardList, this.chartList);

  factory SaleDailySummaryRepResponse.fromJson(Map<String, dynamic> json) =>
      _$SaleDailySummaryRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaleDailySummaryRepResponseToJson(this);
}

@JsonSerializable()
class PlateDailySummaryRepResponse {
  @JsonKey(name: "cardList")
  final List<CardListItemResponse> cardList;

  PlateDailySummaryRepResponse(this.cardList);

  factory PlateDailySummaryRepResponse.fromJson(Map<String, dynamic> json) =>
      _$PlateDailySummaryRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlateDailySummaryRepResponseToJson(this);
}

@JsonSerializable()
class BasculeDailySummaryRepResponse {
  @JsonKey(name: "cardList")
  final List<CardListItemResponse> cardList;

  BasculeDailySummaryRepResponse(this.cardList);

  factory BasculeDailySummaryRepResponse.fromJson(Map<String, dynamic> json) =>
      _$BasculeDailySummaryRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BasculeDailySummaryRepResponseToJson(this);
}

@JsonSerializable()
class TreasuryDailySummaryRepResponse {
  @JsonKey(name: "cardList")
  final List<CardListItemResponse> cardList;

  TreasuryDailySummaryRepResponse(this.cardList);

  factory TreasuryDailySummaryRepResponse.fromJson(Map<String, dynamic> json) =>
      _$TreasuryDailySummaryRepResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TreasuryDailySummaryRepResponseToJson(this);
}

@JsonSerializable()
class FinanceDailySummaryRepResponse {
  @JsonKey(name: "cardList")
  final List<CardListItemResponse> cardList;

  FinanceDailySummaryRepResponse(this.cardList);

  factory FinanceDailySummaryRepResponse.fromJson(Map<String, dynamic> json) =>
      _$FinanceDailySummaryRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FinanceDailySummaryRepResponseToJson(this);
}

@JsonSerializable()
class ChartListItemResponse {
  @JsonKey(name: "uniqueId")
  final int uniqueId;
  @JsonKey(name: "chartTitle")
  final String title;
  @JsonKey(name: "show")
  final bool show;
  @JsonKey(name: "chartData")
  final List<ChartItemResponse> data;

  ChartListItemResponse(this.uniqueId, this.title, this.show, this.data);

  factory ChartListItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ChartListItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChartListItemResponseToJson(this);
}

@JsonSerializable()
class SaleCardListItemResponse {
  @JsonKey(name: "uniqueId")
  final int uniqueId;
  @JsonKey(name: "cardTitle")
  final String title;
  @JsonKey(name: "show")
  final bool show;
  @JsonKey(name: "cardData")
  final List<ChartItemResponse> data;

  SaleCardListItemResponse(this.uniqueId, this.title, this.show, this.data);

  factory SaleCardListItemResponse.fromJson(Map<String, dynamic> json) =>
      _$SaleCardListItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaleCardListItemResponseToJson(this);
}

@JsonSerializable()
class CardListItemResponse {
  @JsonKey(name: "uniqueId")
  final int uniqueId;
  @JsonKey(name: "cardTitle")
  final String title;
  @JsonKey(name: "show")
  final bool show;
  @JsonKey(name: "cardData")
  final List<CardItemResponse> data;

  CardListItemResponse(this.uniqueId, this.title, this.show, this.data);

  factory CardListItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CardListItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CardListItemResponseToJson(this);
}

@JsonSerializable()
class ChartItemResponse {
  @JsonKey(name: "key")
  final String key;
  @JsonKey(name: "value")
  final double value;
  @JsonKey(name: "stringValue")
  final String stringValue;

  ChartItemResponse(this.key, this.value, this.stringValue);

  factory ChartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ChartItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChartItemResponseToJson(this);
}

@JsonSerializable()
class CardItemResponse {
  @JsonKey(name: "key")
  final String key;
  @JsonKey(name: "value")
  final String value;
  @JsonKey(name: "stringValue")
  final String stringValue;

  CardItemResponse(this.key, this.value, this.stringValue);

  factory CardItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CardItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CardItemResponseToJson(this);
}

@JsonSerializable()
class MaterialBillRepResponse {
  @JsonKey(name: "persianDate")
  final String persianDate;
  @JsonKey(name: "shomareGhabz")
  final String billNumber;
  @JsonKey(name: "customerName")
  final String customerName;
  @JsonKey(name: "time")
  final String time;
  @JsonKey(name: "productName")
  final String productName;
  @JsonKey(name: "weight")
  final String weight;
  @JsonKey(name: "unitPrice")
  final String unitPrice;
  @JsonKey(name: "totalPrice")
  final String totalPrice;
  @JsonKey(name: "kerayeMoshtari")
  final String customerFare;
  @JsonKey(name: "kerayeKamiyoon")
  final String truckFare;
  @JsonKey(name: "receivedPrice")
  final String receivedPrice;
  @JsonKey(name: "naghdi")
  final String cash;
  @JsonKey(name: "card")
  final String card;
  @JsonKey(name: "mande")
  final String remaining;
  @JsonKey(name: "plateNumber")
  final String plateNumber;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "driverName")
  final String driverName;
  @JsonKey(name: "takhfif")
  final String discount;
  @JsonKey(name: "meghdar")
  final String amount;

  MaterialBillRepResponse(
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

  factory MaterialBillRepResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialBillRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialBillRepResponseToJson(this);
}

@JsonSerializable()
class MaterialBillRepByCustomerResponse {
  @JsonKey(name: "customerCode")
  final int customerCode;
  @JsonKey(name: "customerName")
  final String customerName;
  @JsonKey(name: "products")
  final List<MaterialBillProductResponse> products;
  @JsonKey(name: "totalProductWeight")
  final double totalProductWeight;
  @JsonKey(name: "totalServiceCount")
  final int totalServiceCount;
  @JsonKey(name: "productCount")
  final int productCount;
  @JsonKey(name: "serviceCount")
  final String? serviceCount;
  @JsonKey(name: "totalJamKol")
  final double? totalJamKol;
  @JsonKey(name: "totalJamKolStr")
  final String? totalJamKolStr;

  MaterialBillRepByCustomerResponse(
      this.customerCode,
      this.customerName,
      this.serviceCount,
      this.totalJamKol,
      this.totalJamKolStr,
      this.totalProductWeight,
      this.totalServiceCount,
      this.productCount,
      this.products);

  factory MaterialBillRepByCustomerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MaterialBillRepByCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaterialBillRepByCustomerResponseToJson(this);
}

@JsonSerializable()
class MaterialBillProductResponse {
  @JsonKey(name: "productCode")
  final int productCode;
  @JsonKey(name: "productName")
  final String productName;
  @JsonKey(name: "weight")
  final double weight;
  @JsonKey(name: "serviceCount")
  final int serviceCount;
  @JsonKey(name: "jamKol")
  final double? jamKol;
  @JsonKey(name: "jamKolStr")
  final String? jamKolStr;

  MaterialBillProductResponse(this.productCode, this.productName, this.weight,
      this.serviceCount, this.jamKol, this.jamKolStr);

  factory MaterialBillProductResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialBillProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialBillProductResponseToJson(this);
}

@JsonSerializable()
class MaterialBillRepByProductResponse {
  @JsonKey(name: "productCode")
  final String productCode;
  @JsonKey(name: "productName")
  final String productName;
  @JsonKey(name: "meghdar")
  final String amount;
  @JsonKey(name: "unitPrice")
  final String unitPrice;
  @JsonKey(name: "salePrice")
  final String salePrice;
  @JsonKey(name: "discount")
  final String discount;
  @JsonKey(name: "maliat")
  final String tax;
  @JsonKey(name: "totalPrice")
  final String totalPrice;
  @JsonKey(name: "serviceCount")
  final String serviceCount;

  MaterialBillRepByProductResponse(
      this.productCode,
      this.productName,
      this.amount,
      this.unitPrice,
      this.salePrice,
      this.discount,
      this.tax,
      this.totalPrice,
      this.serviceCount);

  factory MaterialBillRepByProductResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MaterialBillRepByProductResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaterialBillRepByProductResponseToJson(this);
}

@JsonSerializable()
class MaterialBillRepByCarResponse {
  @JsonKey(name: "plateNumber")
  final String plateNumber;
  @JsonKey(name: "serviceCount")
  final String serviceCount;
  @JsonKey(name: "meghdarKol")
  final String totalAmount;

  MaterialBillRepByCarResponse(
      this.plateNumber, this.serviceCount, this.totalAmount);

  factory MaterialBillRepByCarResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialBillRepByCarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialBillRepByCarResponseToJson(this);
}

@JsonSerializable()
class MaterialDetailedIncomingRepResponse {
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "time")
  final String time;
  @JsonKey(name: "shomareGhabz")
  final String ticketNumber;
  @JsonKey(name: "noeKala")
  final String noeKala;
  @JsonKey(name: "meghdar")
  final String amount;
  @JsonKey(name: "pelak")
  final String plateNumber;
  @JsonKey(name: "driverName")
  final String driverName;
  @JsonKey(name: "noeSabt")
  final int registrationType;
  @JsonKey(name: "nameNoeSabt")
  final String registrationTypeName;
  @JsonKey(name: "mabVahed")
  final String unitPrice;
  @JsonKey(name: "idForooshande")
  final int customerId;
  @JsonKey(name: "nameForooshande")
  final String customerName;
  @JsonKey(name: "mabKhales")
  final String netPrice;
  @JsonKey(name: "mabKol")
  final String totalPrice;
  @JsonKey(name: "shomareBarname")
  final String billNumber;
  @JsonKey(name: "dateBarname")
  final String billDate;
  @JsonKey(name: "emptyScale")
  final String emptyScale;
  @JsonKey(name: "fullScale")
  final String fullScale;
  @JsonKey(name: "typeCar")
  final String carType;
  @JsonKey(name: "tozi")
  final String description;

  MaterialDetailedIncomingRepResponse(
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

  factory MaterialDetailedIncomingRepResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MaterialDetailedIncomingRepResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaterialDetailedIncomingRepResponseToJson(this);
}

@JsonSerializable()
class MaterialIncomingRepByProductResponse {
  @JsonKey(name: "noeKala")
  final String productType;
  @JsonKey(name: "nameKala")
  final String productName;
  @JsonKey(name: "serviceCount")
  final String serviceCount;
  @JsonKey(name: "meghdarKol")
  final String totalAmount;

  MaterialIncomingRepByProductResponse(
      this.productType, this.productName, this.serviceCount, this.totalAmount);

  factory MaterialIncomingRepByProductResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MaterialIncomingRepByProductResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaterialIncomingRepByProductResponseToJson(this);
}

@JsonSerializable()
class MaterialIncomingRepByCarResponse {
  @JsonKey(name: "plateNumber")
  final String plateNumber;
  @JsonKey(name: "serviceCount")
  final String serviceCount;
  @JsonKey(name: "meghdarKol")
  final String meghdarKol;

  MaterialIncomingRepByCarResponse(
      this.plateNumber, this.serviceCount, this.meghdarKol);

  factory MaterialIncomingRepByCarResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MaterialIncomingRepByCarResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaterialIncomingRepByCarResponseToJson(this);
}

@JsonSerializable()
class MaterialIncomingRepByCustomerResponse {
  @JsonKey(name: "sellerName")
  final String customerName;
  @JsonKey(name: "serviceCount")
  final String serviceCount;
  @JsonKey(name: "meghdarKol")
  final String meghdarKol;

  MaterialIncomingRepByCustomerResponse(
      this.customerName, this.serviceCount, this.meghdarKol);

  factory MaterialIncomingRepByCustomerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MaterialIncomingRepByCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaterialIncomingRepByCustomerResponseToJson(this);
}

@JsonSerializable()
class MaterialIncomingRepByCustomerAndProductResponse {
  @JsonKey(name: "customerCode")
  final int customerCode;
  @JsonKey(name: "customerName")
  final String customerName;
  @JsonKey(name: "totalProductWeight")
  final double totalProductWeight;
  @JsonKey(name: "totalServiceCount")
  final int totalServiceCount;
  @JsonKey(name: "productCount")
  final int productCount;
  @JsonKey(name: "products")
  final List<MaterialIncomingRepByCustomerAndProductProductItemResponse>
      products;

  MaterialIncomingRepByCustomerAndProductResponse(
      this.customerCode,
      this.customerName,
      this.totalProductWeight,
      this.totalServiceCount,
      this.productCount,
      this.products);

  factory MaterialIncomingRepByCustomerAndProductResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MaterialIncomingRepByCustomerAndProductResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaterialIncomingRepByCustomerAndProductResponseToJson(this);
}

@JsonSerializable()
class MaterialIncomingRepByCustomerAndProductProductItemResponse {
  @JsonKey(name: "productCode")
  final int productCode;
  @JsonKey(name: "productName")
  final String productName;
  @JsonKey(name: "weight")
  final double weight;
  @JsonKey(name: "serviceCount")
  final int serviceCount;

  MaterialIncomingRepByCustomerAndProductProductItemResponse(
      this.productCode, this.productName, this.weight, this.serviceCount);

  factory MaterialIncomingRepByCustomerAndProductProductItemResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MaterialIncomingRepByCustomerAndProductProductItemResponseFromJson(
          json);

  Map<String, dynamic> toJson() =>
      _$MaterialIncomingRepByCustomerAndProductProductItemResponseToJson(this);
}

@JsonSerializable()
class MaterialMineDailyRepResponse {
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "serviceCount")
  final String serviceCount;
  @JsonKey(name: "meghdar")
  final String meghdar;
  @JsonKey(name: "loadingTotalPrice")
  final String loadingTotalPrice;
  @JsonKey(name: "jamKerayeHaml")
  final String jamKerayeHaml;
  @JsonKey(name: "factorTotalPrice")
  final String factorTotalPrice;

  MaterialMineDailyRepResponse(this.date, this.serviceCount, this.meghdar,
      this.loadingTotalPrice, this.jamKerayeHaml, this.factorTotalPrice);

  factory MaterialMineDailyRepResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialMineDailyRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialMineDailyRepResponseToJson(this);
}

@JsonSerializable()
class MaterialMineMonthlyRepResponse {
  @JsonKey(name: "monthName")
  final String monthName;
  @JsonKey(name: "serviceCount")
  final String serviceCount;
  @JsonKey(name: "meghdar")
  final String meghdar;
  @JsonKey(name: "jamMablaghBargiri")
  final String jamMablaghBargiri;
  @JsonKey(name: "jamKerayeKar")
  final String jamKerayeKar;
  @JsonKey(name: "factorTotalPrice")
  final String factorTotalPrice;

  MaterialMineMonthlyRepResponse(
      this.monthName,
      this.serviceCount,
      this.meghdar,
      this.jamMablaghBargiri,
      this.jamKerayeKar,
      this.factorTotalPrice);

  factory MaterialMineMonthlyRepResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialMineMonthlyRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialMineMonthlyRepResponseToJson(this);
}

@JsonSerializable()
class MaterialMostCarrierRepResponse {
  @JsonKey(name: "carCode")
  final String carCode;
  @JsonKey(name: "plateNumber")
  final String plateNumber;
  @JsonKey(name: "serviceCount")
  final String serviceCount;
  @JsonKey(name: "meghdar")
  final String meghdar;
  @JsonKey(name: "jamKerayeHaml")
  final String jamKerayeHaml;

  MaterialMostCarrierRepResponse(this.carCode, this.plateNumber,
      this.serviceCount, this.meghdar, this.jamKerayeHaml);

  factory MaterialMostCarrierRepResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialMostCarrierRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialMostCarrierRepResponseToJson(this);
}

@JsonSerializable()
class MaterialMineTransportToSaleRatioReportResponse {
  @JsonKey(name: "saleAmount")
  final double saleAmount;
  @JsonKey(name: "transportAmount")
  final double transportAmount;
  @JsonKey(name: "ratio")
  final String ratio;
  @JsonKey(name: "ratioStr")
  final String ratioStr;

  MaterialMineTransportToSaleRatioReportResponse(
      this.saleAmount, this.transportAmount, this.ratio, this.ratioStr);

  factory MaterialMineTransportToSaleRatioReportResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MaterialMineTransportToSaleRatioReportResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MaterialMineTransportToSaleRatioReportResponseToJson(this);
}

@JsonSerializable()
class CacheParamsResponse {
  @JsonKey(name: "madan")
  final List<CacheParamValueMadanResponse>? madan;
  @JsonKey(name: "anbar")
  final List<CacheParamValueAnbarResponse>? anbar;
  @JsonKey(name: "goroohTafsili")
  final List<CacheParamValueGoroohTafsiliResponse>? goroohTafsili;
  @JsonKey(name: "markazHazineh")
  final List<CacheParamValueMarkazHazinehResponse>? markazHazineh;
  @JsonKey(name: "moin")
  final List<CacheParamValueMoinResponse>? moin;
  @JsonKey(name: "customer")
  final List<CacheParamValueCustomersResponse>? customer;
  @JsonKey(name: "product")
  final List<CacheParamValueProductsResponse>? product;
  @JsonKey(name: "car")
  final List<CacheParamValueCarListResponse>? car;
  @JsonKey(name: "pomp")
  final List<CacheParamValuePompResponse>? pomp;
  @JsonKey(name: "workType")
  final List<CacheParamValueBetonWorkTypeResponse>? betonWorkType;
  @JsonKey(name: "sharayetMohiti")
  final List<CacheParamValueShrayetMohitiBetonResponse>? betonSharayetMohiti;

  CacheParamsResponse(
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

  factory CacheParamsResponse.fromJson(Map<String, dynamic> json) =>
      _$CacheParamsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CacheParamsResponseToJson(this);
}

@JsonSerializable()
class TafsiliResponse {

  @JsonKey(name: "idTafsili")
  final int idTafsili;
  @JsonKey(name: "codTafsili")
  final int codTafsili;
  @JsonKey(name: "nameTafsili")
  final String nameTafsili;
  @JsonKey(name: "idGoroTafsili")
  final int idGoroTafsili;
  @JsonKey(name: "nameGoroTafsili")
  final String nameGoroTafsili;
  @JsonKey(name: "dbName")
  final String dbName;


  TafsiliResponse(this.idTafsili, this.codTafsili, this.nameTafsili,
      this.idGoroTafsili, this.nameGoroTafsili, this.dbName);

  factory TafsiliResponse.fromJson(Map<String, dynamic> json) =>
      _$TafsiliResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TafsiliResponseToJson(this);
}

abstract class CacheParamValueResponse {}

@JsonSerializable()
class CacheParamValueBetonWorkTypeResponse extends CacheParamValueResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "workType")
  String workType;

  CacheParamValueBetonWorkTypeResponse(this.id, this.workType);

  factory CacheParamValueBetonWorkTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$CacheParamValueBetonWorkTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CacheParamValueBetonWorkTypeResponseToJson(this);
}

@JsonSerializable()
class CacheParamValueShrayetMohitiBetonResponse extends CacheParamValueResponse {
  @JsonKey(name: "key")
  int id;
  @JsonKey(name: "stringValue")
  String name;
  @JsonKey(name: "value")
  String? value;

  CacheParamValueShrayetMohitiBetonResponse(this.id, this.name, this.value);

  factory CacheParamValueShrayetMohitiBetonResponse.fromJson(Map<String, dynamic> json) =>
      _$CacheParamValueShrayetMohitiBetonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CacheParamValueShrayetMohitiBetonResponseToJson(this);
}

@JsonSerializable()
class CacheParamValueMadanResponse extends CacheParamValueResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "nameMadan")
  String name;

  CacheParamValueMadanResponse(this.id, this.name);

  factory CacheParamValueMadanResponse.fromJson(Map<String, dynamic> json) =>
      _$CacheParamValueMadanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CacheParamValueMadanResponseToJson(this);
}

@JsonSerializable()
class CacheParamValueAnbarResponse extends CacheParamValueResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "nameAnbar")
  String name;

  CacheParamValueAnbarResponse(this.id, this.name);

  factory CacheParamValueAnbarResponse.fromJson(Map<String, dynamic> json) =>
      _$CacheParamValueAnbarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CacheParamValueAnbarResponseToJson(this);
}

@JsonSerializable()
class CacheParamValueGoroohTafsiliResponse extends CacheParamValueResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;

  CacheParamValueGoroohTafsiliResponse(this.id, this.name);

  factory CacheParamValueGoroohTafsiliResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CacheParamValueGoroohTafsiliResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CacheParamValueGoroohTafsiliResponseToJson(this);
}

@JsonSerializable()
class CacheParamValueMarkazHazinehResponse extends CacheParamValueResponse {
  @JsonKey(name: "key")
  String key;
  @JsonKey(name: "value")
  int value;
  @JsonKey(name: "stringValue")
  String stringValue;

  CacheParamValueMarkazHazinehResponse(this.key, this.value, this.stringValue);

  factory CacheParamValueMarkazHazinehResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CacheParamValueMarkazHazinehResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CacheParamValueMarkazHazinehResponseToJson(this);
}

@JsonSerializable()
class CacheParamValueMoinResponse extends CacheParamValueResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "codeMali")
  String codeMali;
  @JsonKey(name: "nameHesab")
  String nameHesab;
  @JsonKey(name: "codMaliKol")
  String codMaliKol;
  @JsonKey(name: "nameHesabKol")
  String nameHesabKol;

  CacheParamValueMoinResponse(this.id, this.codeMali, this.nameHesab,
      this.codMaliKol, this.nameHesabKol);

  factory CacheParamValueMoinResponse.fromJson(Map<String, dynamic> json) =>
      _$CacheParamValueMoinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CacheParamValueMoinResponseToJson(this);
}

@JsonSerializable()
class CacheParamValueCustomersResponse extends CacheParamValueResponse {
  @JsonKey(name: "customerId")
  int customerId;
  @JsonKey(name: "customerCode")
  String customerCode;
  @JsonKey(name: "customerName")
  String customerName;
  @JsonKey(name: "customerTitle")
  String customerTitle;
  @JsonKey(name: "categoryName")
  String categoryName;

  CacheParamValueCustomersResponse(this.customerId, this.customerCode,
      this.customerName, this.customerTitle, this.categoryName);

  factory CacheParamValueCustomersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CacheParamValueCustomersResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CacheParamValueCustomersResponseToJson(this);
}

@JsonSerializable()
class CacheParamValueProductsResponse extends CacheParamValueResponse {
  @JsonKey(name: "productId")
  int productId;
  @JsonKey(name: "productCode")
  String productCode;
  @JsonKey(name: "productName")
  String productName;
  @JsonKey(name: "productUnit")
  String productUnit;

  CacheParamValueProductsResponse(
      this.productId, this.productCode, this.productName, this.productUnit);

  factory CacheParamValueProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$CacheParamValueProductsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CacheParamValueProductsResponseToJson(this);
}

@JsonSerializable()
class CacheParamValueCarListResponse extends CacheParamValueResponse {
  @JsonKey(name: "carId")
  int carId;
  @JsonKey(name: "carCode")
  String carCode;
  @JsonKey(name: "plateNumber")
  String plateNumber;
  @JsonKey(name: "plateP1")
  String plateP1;
  @JsonKey(name: "plateP2")
  String plateP2;
  @JsonKey(name: "plateP3")
  String plateP3;
  @JsonKey(name: "plateP4")
  String plateP4;
  @JsonKey(name: "driverName")
  String driverName;
  @JsonKey(name: "carOwner")
  String carOwner;
  @JsonKey(name: "carModelName")
  String carModelName;

  CacheParamValueCarListResponse(
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

  factory CacheParamValueCarListResponse.fromJson(Map<String, dynamic> json) =>
      _$CacheParamValueCarListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CacheParamValueCarListResponseToJson(this);
}

@JsonSerializable()
class CacheParamValuePompResponse extends CacheParamValueResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "pompDriver")
  String pompDriver;

  CacheParamValuePompResponse(this.id, this.code, this.pompDriver);

  factory CacheParamValuePompResponse.fromJson(Map<String, dynamic> json) =>
      _$CacheParamValuePompResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CacheParamValuePompResponseToJson(this);
}

@JsonSerializable()
class ManagementGetHesabLockConditionsResponse {
  @JsonKey(name: "lockDate")
  String lockDate;
  @JsonKey(name: "lockAutomatic")
  bool lockAutomatic;
  @JsonKey(name: "lockDayLength")
  int lockDayLength;

  ManagementGetHesabLockConditionsResponse(
      this.lockDate, this.lockAutomatic, this.lockDayLength);

  factory ManagementGetHesabLockConditionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ManagementGetHesabLockConditionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ManagementGetHesabLockConditionsResponseToJson(this);
}

@JsonSerializable()
class TreasuryDaryaftAndPardakhtRepResponse {
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "radif")
  String? radif;
  @JsonKey(name: "pardakhtKonande")
  String? pardakhtKonande;
  @JsonKey(name: "daryaftKonande")
  String? daryaftKonande;
  @JsonKey(name: "mablagh")
  String? mablagh;
  @JsonKey(name: "noe")
  String? noe;
  @JsonKey(name: "serial")
  String? serial;
  @JsonKey(name: "description")
  String? description;

  TreasuryDaryaftAndPardakhtRepResponse(
      this.date,
      this.radif,
      this.pardakhtKonande,
      this.daryaftKonande,
      this.mablagh,
      this.noe,
      this.serial,
      this.description);

  factory TreasuryDaryaftAndPardakhtRepResponse.fromJson(Map<String, dynamic> json) =>
      _$TreasuryDaryaftAndPardakhtRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TreasuryDaryaftAndPardakhtRepResponseToJson(this);
}

@JsonSerializable()
class TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse {
  @JsonKey(name: "hesab")
  String hesab;
  @JsonKey(name: "mablagh")
  String mablagh;

  TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse(this.hesab, this.mablagh);

  factory TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponseToJson(this);
}

@JsonSerializable()
class TreasuryGoTajmiDaryaftAndPardakhtRepResponse {
  @JsonKey(name: "naghdi")
  String naghdi;
  @JsonKey(name: "check")
  String check;
  @JsonKey(name: "havale")
  String havale;
  @JsonKey(name: "kartKhan")
  String kartKhan;

  TreasuryGoTajmiDaryaftAndPardakhtRepResponse(
      this.naghdi, this.check, this.havale, this.kartKhan);

  factory TreasuryGoTajmiDaryaftAndPardakhtRepResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TreasuryGoTajmiDaryaftAndPardakhtRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TreasuryGoTajmiDaryaftAndPardakhtRepResponseToJson(this);
}

@JsonSerializable()
class FinancialBedBesResponse {
  @JsonKey(name: "details")
  List<FinancialBedBesRepResponseDetail>? details;
  @JsonKey(name: "totalMandeBedStr")
  String totalMandeBedStr;
  @JsonKey(name: "totalMandeBesStr")
  String totalMandeBesStr;
  @JsonKey(name: "totalMandeBed")
  int totalMandeBed;
  @JsonKey(name: "totalMandeBes")
  int totalMandeBes;

  FinancialBedBesResponse(this.details, this.totalMandeBedStr,
      this.totalMandeBesStr, this.totalMandeBed, this.totalMandeBes);


  factory FinancialBedBesResponse.fromJson(
      Map<String, dynamic> json) =>
      _$FinancialBedBesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FinancialBedBesResponseToJson(this);
}

@JsonSerializable()
class FinancialBedBesRepResponseDetail {
  @JsonKey(name: "codHesab")
  String codHesab;
  @JsonKey(name: "nameHesab")
  String nameHesab;
  @JsonKey(name: "title2")
  String title2;
  @JsonKey(name: "mabBedStr")
  String mabBedStr;
  @JsonKey(name: "mabBed")
  int mabBed;
  @JsonKey(name: "mabBesStr")
  String mabBesStr;
  @JsonKey(name: "mabBes")
  int mabBes;
  @JsonKey(name: "mandeBedStr")
  String mandeBedStr;
  @JsonKey(name: "mandeBed")
  int mandeBed;
  @JsonKey(name: "mandeBesStr")
  String mandeBesStr;
  @JsonKey(name: "mandeBes")
  int mandeBes;
  @JsonKey(name: "mobile1")
  String mobile1;
  @JsonKey(name: "mobile2")
  String mobile2;
  @JsonKey(name: "address")
  String address;


  FinancialBedBesRepResponseDetail(
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

  factory FinancialBedBesRepResponseDetail.fromJson(
  Map<String, dynamic> json) =>
  _$FinancialBedBesRepResponseDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FinancialBedBesRepResponseDetailToJson(this);
}

@JsonSerializable()
class FinancialGozareshHesabRepResponse {
  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "noeBarge")
  String noeBarge;
  @JsonKey(name: "strNoeBarge")
  String strNoeBarge;
  @JsonKey(name: "shBarge")
  String shBarge;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "bed")
  String bed;
  @JsonKey(name: "bes")
  String bes;
  @JsonKey(name: "mandeh")
  String mandeh;
  @JsonKey(name: "tashkhis")
  String tashkhis;


  FinancialGozareshHesabRepResponse(
      this.date,
      this.noeBarge,
      this.strNoeBarge,
      this.shBarge,
      this.description,
      this.bed,
      this.bes,
      this.mandeh,
      this.tashkhis);

  factory FinancialGozareshHesabRepResponse.fromJson(
      Map<String, dynamic> json) =>
      _$FinancialGozareshHesabRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FinancialGozareshHesabRepResponseToJson(this);
}

@JsonSerializable()
class PlateReaderDailyTotaledAndTotaledRepRepResponse {
  @JsonKey(name: "rowNum")
  int rowNum;
  @JsonKey(name: "p1")
  int p1;
  @JsonKey(name: "p2")
  String p2;
  @JsonKey(name: "p3")
  int p3;
  @JsonKey(name: "p4")
  int p4;
  @JsonKey(name: "plateStr")
  String plateStr;
  @JsonKey(name: "instanceId")
  int instanceId;
  @JsonKey(name: "instanceName")
  String instanceName;
  @JsonKey(name: "readDate")
  String? readDate;
  @JsonKey(name: "trafficCount")
  int trafficCount;
  @JsonKey(name: "totalRec")
  int totalRec;

  PlateReaderDailyTotaledAndTotaledRepRepResponse(
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

  factory PlateReaderDailyTotaledAndTotaledRepRepResponse.fromJson(
      Map<String, dynamic> json) =>
      _$PlateReaderDailyTotaledAndTotaledRepRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlateReaderDailyTotaledAndTotaledRepRepResponseToJson(this);
}

@JsonSerializable()
class PlateReaderInstanceListResponse {
  @JsonKey(name: "instanceId")
  int instanceId;
  @JsonKey(name: "sendPlateDelaySeconds")
  int sendPlateDelaySeconds;
  @JsonKey(name: "serviceBusAddress")
  String serviceBusAddress;
  @JsonKey(name: "videoPath")
  String videoPath;
  @JsonKey(name: "aiFilePath")
  String aiFilePath;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "showBasculeWeight")
  bool showBasculeWeight;
  @JsonKey(name: "confidenceLimit")
  double confidenceLimit;

  PlateReaderInstanceListResponse(
      this.instanceId,
      this.sendPlateDelaySeconds,
      this.serviceBusAddress,
      this.videoPath,
      this.aiFilePath,
      this.description,
      this.showBasculeWeight,
      this.confidenceLimit);

  factory PlateReaderInstanceListResponse.fromJson(
      Map<String, dynamic> json) =>
      _$PlateReaderInstanceListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlateReaderInstanceListResponseToJson(this);
}

@JsonSerializable()
class PlateReaderDetailedRepResponse {
  @JsonKey(name: "rowNum")
  int rowNum;
  @JsonKey(name: "p1")
  int p1;
  @JsonKey(name: "p2")
  String p2;
  @JsonKey(name: "p3")
  int p3;
  @JsonKey(name: "p4")
  int p4;
  @JsonKey(name: "plateStr")
  String plateStr;
  @JsonKey(name: "instanceId")
  int instanceId;
  @JsonKey(name: "instanceName")
  String instanceName;
  @JsonKey(name: "readDate")
  String readDate;
  @JsonKey(name: "totalRec")
  int totalRec;
  @JsonKey(name: "codedPlateNumber")
  int codedPlateNumber;
  @JsonKey(name: "confidence")
  double confidence;
  @JsonKey(name: "confidenceStr")
  String confidenceStr;
  @JsonKey(name: "carImageAddress")
  String carImageAddress;
  @JsonKey(name: "carImageLink")
  String carImageLink;
  @JsonKey(name: "plateImageAddress")
  String plateImageAddress;
  @JsonKey(name: "plateImageLink")
  String plateImageLink;
  @JsonKey(name: "loadImageAddress")
  String loadImageAddress;
  @JsonKey(name: "loadImageLink")
  String loadImageLink;
  @JsonKey(name: "direction")
  int direction;
  @JsonKey(name: "liveWeight")
  String liveWeight;
  @JsonKey(name: "isReserved")
  bool isReserved;
  @JsonKey(name: "isReservedStr")
  String isReservedStr;
  @JsonKey(name: "isValid")
  bool isValid;
  @JsonKey(name: "isValidStr")
  String isValidStr;
  @JsonKey(name: "hasCarImage")
  bool hasCarImage;
  @JsonKey(name: "hasPlateImage")
  bool hasPlateImage;
  @JsonKey(name: "hasLoadImage")
  bool hasLoadImage;
  @JsonKey(name: "readTime")
  String readTime;


  PlateReaderDetailedRepResponse(
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

  factory PlateReaderDetailedRepResponse.fromJson(
      Map<String, dynamic> json) =>
      _$PlateReaderDetailedRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlateReaderDetailedRepResponseToJson(this);
}

@JsonSerializable()
class ConcreteOrdersInDayRepResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "time")
  String time;
  @JsonKey(name: "customerId")
  int customerId;
  @JsonKey(name: "customerName")
  String customerName;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "pompId")
  int pompId;
  @JsonKey(name: "pompCode")
  String pompCode;
  @JsonKey(name: "pompDriver")
  String pompDriver;
  @JsonKey(name: "meghdar")
  double meghdar;
  @JsonKey(name: "meghdarBargashti")
  double meghdarBargashti;
  @JsonKey(name: "tolerance")
  String tolerance;
  @JsonKey(name: "meghdarErsali")
  double meghdarErsali;
  @JsonKey(name: "meghdarMande")
  double meghdarMande;
  @JsonKey(name: "productCode")
  String productCode;
  @JsonKey(name: "productName")
  String productName;
  @JsonKey(name: "controlType")
  int controlType;
  @JsonKey(name: "controlTypeName")
  String controlTypeName;
  @JsonKey(name: "processStatusName")
  String processStatusName;
  @JsonKey(name: "workTypeName")
  String workTypeName;
  @JsonKey(name: "workStatusName")
  String workStatusName;
  @JsonKey(name: "workStatusDescription")
  String workStatusDescription;
  @JsonKey(name: "workStatus")
  int workStatus;
  @JsonKey(name: "processStatus")
  int processStatus;
  @JsonKey(name: "finalStatusOrder")
  String finalStatusOrder;


  ConcreteOrdersInDayRepResponse(
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

  factory ConcreteOrdersInDayRepResponse.fromJson(
      Map<String, dynamic> json) =>
      _$ConcreteOrdersInDayRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConcreteOrdersInDayRepResponseToJson(this);
}

@JsonSerializable()
class ConcreteSaleDetailedRepResponse {
  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "shomareGhabz")
  String shomareGhabz;
  @JsonKey(name: "time")
  String time;
  @JsonKey(name: "customerCode")
  String customerCode;
  @JsonKey(name: "customerName")
  String customerName;
  @JsonKey(name: "productCode")
  String productCode;
  @JsonKey(name: "productName")
  String productName;
  @JsonKey(name: "ayar")
  String ayar;
  @JsonKey(name: "totalWeight")
  int totalWeight;
  @JsonKey(name: "pureWeight")
  int pureWeight;
  @JsonKey(name: "ersali")
  String ersali;
  @JsonKey(name: "daryafti")
  String daryafti;
  @JsonKey(name: "meghdar")
  String meghdar;
  @JsonKey(name: "mablaghJoz")
  String mablaghJoz;
  @JsonKey(name: "productPrice")
  String productPrice;
  @JsonKey(name: "driverName")
  String driverName;
  @JsonKey(name: "plateNumber")
  String plateNumber;
  @JsonKey(name: "pompOperator")
  String pompOperator;
  @JsonKey(name: "pompType")
  String pompType;
  @JsonKey(name: "anbar")
  String anbar;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "workType")
  String workType;


  ConcreteSaleDetailedRepResponse(
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

  factory ConcreteSaleDetailedRepResponse.fromJson(
  Map<String, dynamic> json) =>
  _$ConcreteSaleDetailedRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConcreteSaleDetailedRepResponseToJson(this);
}

@JsonSerializable()
class ConcreteReportByCustomerAndProductResponse {
  @JsonKey(name: "customerCode")
  String? customerCode;
  @JsonKey(name: "customerName")
  String? customerName;
  @JsonKey(name: "productCode")
  String? productCode;
  @JsonKey(name: "productName")
  String? productName;
  @JsonKey(name: "pureWeight")
  String? pureWeight;
  @JsonKey(name: "serviceCount")
  String? serviceCount;
  @JsonKey(name: "mablaghJoz")
  String? mablaghJoz;
  @JsonKey(name: "unitPrice")
  String? unitPrice;
  @JsonKey(name: "totalPrice")
  String? totalPrice;
  @JsonKey(name: "keraye")
  String? keraye;


  ConcreteReportByCustomerAndProductResponse(
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

  factory ConcreteReportByCustomerAndProductResponse.fromJson(
  Map<String, dynamic> json) =>
  _$ConcreteReportByCustomerAndProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConcreteReportByCustomerAndProductResponseToJson(this);
}

@JsonSerializable()
class ConcreteSalesByProductRepResponse {

  @JsonKey(name: "productName")
  String productName;
  @JsonKey(name: "productCode")
  String productCode;
  @JsonKey(name: "meghdar")
  String meghdar;
  @JsonKey(name: "serviceCount")
  String serviceCount;
  @JsonKey(name: "unitPrice")
  double? unitPrice;
  @JsonKey(name: "salePrice")
  double? salePrice;


  ConcreteSalesByProductRepResponse(this.productName, this.productCode,
      this.meghdar, this.serviceCount, this.unitPrice, this.salePrice);

  factory ConcreteSalesByProductRepResponse.fromJson(
      Map<String, dynamic> json) =>
      _$ConcreteSalesByProductRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConcreteSalesByProductRepResponseToJson(this);
}

@JsonSerializable()
class ConcreteSalesDailyTotaledRepResponse {

  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "serviceCount")
  String serviceCount;
  @JsonKey(name: "meghdar")
  String meghdar;
  @JsonKey(name: "totalPrice")
  String totalPrice;


  ConcreteSalesDailyTotaledRepResponse(
      this.date, this.serviceCount, this.meghdar, this.totalPrice);

  factory ConcreteSalesDailyTotaledRepResponse.fromJson(
      Map<String, dynamic> json) =>
      _$ConcreteSalesDailyTotaledRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConcreteSalesDailyTotaledRepResponseToJson(this);
}

@JsonSerializable()
class ConcreteMixerDailyCumulativeRepResponse {

  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "driver")
  String driver;
  @JsonKey(name: "plateNumber")
  String plateNumber;
  @JsonKey(name: "carId")
  int carId;
  @JsonKey(name: "serviceCount")
  String serviceCount;
  @JsonKey(name: "hamlShode")
  String hamlShode;
  @JsonKey(name: "meghdarBeton")
  String meghdarBeton;


  ConcreteMixerDailyCumulativeRepResponse(
      this.date,
      this.driver,
      this.plateNumber,
      this.carId,
      this.serviceCount,
      this.hamlShode,
      this.meghdarBeton);

  factory ConcreteMixerDailyCumulativeRepResponse.fromJson(
      Map<String, dynamic> json) =>
      _$ConcreteMixerDailyCumulativeRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConcreteMixerDailyCumulativeRepResponseToJson(this);
}

@JsonSerializable()
class ConcreteMixerDriverDetailedRepResponse {

  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "time")
  String time;
  @JsonKey(name: "shomareGhabz")
  int shomareGhabz;
  @JsonKey(name: "customerCode")
  String customerCode;
  @JsonKey(name: "customerName")
  String customerName;
  @JsonKey(name: "driverId")
  int driverId;
  @JsonKey(name: "driverName")
  String driverName;
  @JsonKey(name: "hamlShode")
  String hamlShode;
  @JsonKey(name: "mixerReward")
  String mixerReward;
  @JsonKey(name: "mixerTotalReward")
  String mixerTotalReward;


  ConcreteMixerDriverDetailedRepResponse(
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

  factory ConcreteMixerDriverDetailedRepResponse.fromJson(
      Map<String, dynamic> json) =>
      _$ConcreteMixerDriverDetailedRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConcreteMixerDriverDetailedRepResponseToJson(this);
}

@JsonSerializable()
class ConcretePompKarkardPompRepResponse {

  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "codePomp")
  String codePomp;
  @JsonKey(name: "namePomp")
  String namePomp;
  @JsonKey(name: "tedadIstgah")
  String tedadIstgah;
  @JsonKey(name: "jamPompazh")
  String jamPompazh;
  @JsonKey(name: "tedadMixer")
  String tedadMixer;


  ConcretePompKarkardPompRepResponse(this.date, this.codePomp, this.namePomp,
      this.tedadIstgah, this.jamPompazh, this.tedadMixer);

  factory ConcretePompKarkardPompRepResponse.fromJson(
      Map<String, dynamic> json) =>
      _$ConcretePompKarkardPompRepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConcretePompKarkardPompRepResponseToJson(this);
}

