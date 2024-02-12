// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiscalYearResponse _$FiscalYearResponseFromJson(Map<String, dynamic> json) =>
    FiscalYearResponse(
      json['dbName'] as String,
      json['description'] as String,
      json['startDate'] as String,
      json['endDate'] as String,
    );

Map<String, dynamic> _$FiscalYearResponseToJson(FiscalYearResponse instance) =>
    <String, dynamic>{
      'dbName': instance.dbName,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

MaterialDailySummaryRepResponse _$MaterialDailySummaryRepResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialDailySummaryRepResponse(
      (json['cardList'] as List<dynamic>)
          .map((e) => CardListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['chartList'] as List<dynamic>)
          .map((e) => ChartListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaterialDailySummaryRepResponseToJson(
        MaterialDailySummaryRepResponse instance) =>
    <String, dynamic>{
      'cardList': instance.cardList,
      'chartList': instance.chartList,
    };

ConcreteDailySummaryRepResponse _$ConcreteDailySummaryRepResponseFromJson(
        Map<String, dynamic> json) =>
    ConcreteDailySummaryRepResponse(
      (json['cardList'] as List<dynamic>)
          .map((e) => CardListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['chartList'] as List<dynamic>)
          .map((e) => ChartListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConcreteDailySummaryRepResponseToJson(
        ConcreteDailySummaryRepResponse instance) =>
    <String, dynamic>{
      'cardList': instance.cardList,
      'chartList': instance.chartList,
    };

SaleDailySummaryRepResponse _$SaleDailySummaryRepResponseFromJson(
        Map<String, dynamic> json) =>
    SaleDailySummaryRepResponse(
      (json['cardList'] as List<dynamic>)
          .map((e) =>
              SaleCardListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['chartList'] as List<dynamic>)
          .map((e) => ChartListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleDailySummaryRepResponseToJson(
        SaleDailySummaryRepResponse instance) =>
    <String, dynamic>{
      'cardList': instance.cardList,
      'chartList': instance.chartList,
    };

PlateDailySummaryRepResponse _$PlateDailySummaryRepResponseFromJson(
        Map<String, dynamic> json) =>
    PlateDailySummaryRepResponse(
      (json['cardList'] as List<dynamic>)
          .map((e) => CardListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlateDailySummaryRepResponseToJson(
        PlateDailySummaryRepResponse instance) =>
    <String, dynamic>{
      'cardList': instance.cardList,
    };

BasculeDailySummaryRepResponse _$BasculeDailySummaryRepResponseFromJson(
        Map<String, dynamic> json) =>
    BasculeDailySummaryRepResponse(
      (json['cardList'] as List<dynamic>)
          .map((e) => CardListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BasculeDailySummaryRepResponseToJson(
        BasculeDailySummaryRepResponse instance) =>
    <String, dynamic>{
      'cardList': instance.cardList,
    };

TreasuryDailySummaryRepResponse _$TreasuryDailySummaryRepResponseFromJson(
        Map<String, dynamic> json) =>
    TreasuryDailySummaryRepResponse(
      (json['cardList'] as List<dynamic>)
          .map((e) => CardListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TreasuryDailySummaryRepResponseToJson(
        TreasuryDailySummaryRepResponse instance) =>
    <String, dynamic>{
      'cardList': instance.cardList,
    };

FinanceDailySummaryRepResponse _$FinanceDailySummaryRepResponseFromJson(
        Map<String, dynamic> json) =>
    FinanceDailySummaryRepResponse(
      (json['cardList'] as List<dynamic>)
          .map((e) => CardListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FinanceDailySummaryRepResponseToJson(
        FinanceDailySummaryRepResponse instance) =>
    <String, dynamic>{
      'cardList': instance.cardList,
    };

ChartListItemResponse _$ChartListItemResponseFromJson(
        Map<String, dynamic> json) =>
    ChartListItemResponse(
      json['uniqueId'] as int,
      json['chartTitle'] as String,
      json['show'] as bool,
      (json['chartData'] as List<dynamic>)
          .map((e) => ChartItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChartListItemResponseToJson(
        ChartListItemResponse instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'chartTitle': instance.title,
      'show': instance.show,
      'chartData': instance.data,
    };

SaleCardListItemResponse _$SaleCardListItemResponseFromJson(
        Map<String, dynamic> json) =>
    SaleCardListItemResponse(
      json['uniqueId'] as int,
      json['cardTitle'] as String,
      json['show'] as bool,
      (json['cardData'] as List<dynamic>)
          .map((e) => ChartItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleCardListItemResponseToJson(
        SaleCardListItemResponse instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'cardTitle': instance.title,
      'show': instance.show,
      'cardData': instance.data,
    };

CardListItemResponse _$CardListItemResponseFromJson(
        Map<String, dynamic> json) =>
    CardListItemResponse(
      json['uniqueId'] as int,
      json['cardTitle'] as String,
      json['show'] as bool,
      (json['cardData'] as List<dynamic>)
          .map((e) => CardItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardListItemResponseToJson(
        CardListItemResponse instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'cardTitle': instance.title,
      'show': instance.show,
      'cardData': instance.data,
    };

ChartItemResponse _$ChartItemResponseFromJson(Map<String, dynamic> json) =>
    ChartItemResponse(
      json['key'] as String,
      (json['value'] as num).toDouble(),
      json['stringValue'] as String,
    );

Map<String, dynamic> _$ChartItemResponseToJson(ChartItemResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'stringValue': instance.stringValue,
    };

CardItemResponse _$CardItemResponseFromJson(Map<String, dynamic> json) =>
    CardItemResponse(
      json['key'] as String,
      json['value'] as String,
      json['stringValue'] as String,
    );

Map<String, dynamic> _$CardItemResponseToJson(CardItemResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'stringValue': instance.stringValue,
    };

MaterialBillRepResponse _$MaterialBillRepResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialBillRepResponse(
      json['persianDate'] as String,
      json['shomareGhabz'] as String,
      json['customerName'] as String,
      json['time'] as String,
      json['productName'] as String,
      json['weight'] as String,
      json['unitPrice'] as String,
      json['totalPrice'] as String,
      json['kerayeMoshtari'] as String,
      json['kerayeKamiyoon'] as String,
      json['receivedPrice'] as String,
      json['naghdi'] as String,
      json['card'] as String,
      json['mande'] as String,
      json['plateNumber'] as String,
      json['address'] as String,
      json['driverName'] as String,
      json['takhfif'] as String,
      json['meghdar'] as String,
    );

Map<String, dynamic> _$MaterialBillRepResponseToJson(
        MaterialBillRepResponse instance) =>
    <String, dynamic>{
      'persianDate': instance.persianDate,
      'shomareGhabz': instance.billNumber,
      'customerName': instance.customerName,
      'time': instance.time,
      'productName': instance.productName,
      'weight': instance.weight,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'kerayeMoshtari': instance.customerFare,
      'kerayeKamiyoon': instance.truckFare,
      'receivedPrice': instance.receivedPrice,
      'naghdi': instance.cash,
      'card': instance.card,
      'mande': instance.remaining,
      'plateNumber': instance.plateNumber,
      'address': instance.address,
      'driverName': instance.driverName,
      'takhfif': instance.discount,
      'meghdar': instance.amount,
    };

MaterialBillRepByCustomerResponse _$MaterialBillRepByCustomerResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialBillRepByCustomerResponse(
      json['customerCode'] as int,
      json['customerName'] as String,
      json['serviceCount'] as String?,
      (json['totalJamKol'] as num?)?.toDouble(),
      json['totalJamKolStr'] as String?,
      (json['totalProductWeight'] as num).toDouble(),
      json['totalServiceCount'] as int,
      json['productCount'] as int,
      (json['products'] as List<dynamic>)
          .map((e) =>
              MaterialBillProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaterialBillRepByCustomerResponseToJson(
        MaterialBillRepByCustomerResponse instance) =>
    <String, dynamic>{
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'products': instance.products,
      'totalProductWeight': instance.totalProductWeight,
      'totalServiceCount': instance.totalServiceCount,
      'productCount': instance.productCount,
      'serviceCount': instance.serviceCount,
      'totalJamKol': instance.totalJamKol,
      'totalJamKolStr': instance.totalJamKolStr,
    };

MaterialBillProductResponse _$MaterialBillProductResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialBillProductResponse(
      json['productCode'] as int,
      json['productName'] as String,
      (json['weight'] as num).toDouble(),
      json['serviceCount'] as int,
      (json['jamKol'] as num?)?.toDouble(),
      json['jamKolStr'] as String?,
    );

Map<String, dynamic> _$MaterialBillProductResponseToJson(
        MaterialBillProductResponse instance) =>
    <String, dynamic>{
      'productCode': instance.productCode,
      'productName': instance.productName,
      'weight': instance.weight,
      'serviceCount': instance.serviceCount,
      'jamKol': instance.jamKol,
      'jamKolStr': instance.jamKolStr,
    };

MaterialBillRepByProductResponse _$MaterialBillRepByProductResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialBillRepByProductResponse(
      json['productCode'] as String,
      json['productName'] as String,
      json['meghdar'] as String,
      json['unitPrice'] as String,
      json['salePrice'] as String,
      json['discount'] as String,
      json['maliat'] as String,
      json['totalPrice'] as String,
      json['serviceCount'] as String,
    );

Map<String, dynamic> _$MaterialBillRepByProductResponseToJson(
        MaterialBillRepByProductResponse instance) =>
    <String, dynamic>{
      'productCode': instance.productCode,
      'productName': instance.productName,
      'meghdar': instance.amount,
      'unitPrice': instance.unitPrice,
      'salePrice': instance.salePrice,
      'discount': instance.discount,
      'maliat': instance.tax,
      'totalPrice': instance.totalPrice,
      'serviceCount': instance.serviceCount,
    };

MaterialBillRepByCarResponse _$MaterialBillRepByCarResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialBillRepByCarResponse(
      json['plateNumber'] as String,
      json['serviceCount'] as String,
      json['meghdarKol'] as String,
    );

Map<String, dynamic> _$MaterialBillRepByCarResponseToJson(
        MaterialBillRepByCarResponse instance) =>
    <String, dynamic>{
      'plateNumber': instance.plateNumber,
      'serviceCount': instance.serviceCount,
      'meghdarKol': instance.totalAmount,
    };

MaterialDetailedIncomingRepResponse
    _$MaterialDetailedIncomingRepResponseFromJson(Map<String, dynamic> json) =>
        MaterialDetailedIncomingRepResponse(
          json['date'] as String,
          json['time'] as String,
          json['shomareGhabz'] as String,
          json['noeKala'] as String,
          json['meghdar'] as String,
          json['pelak'] as String,
          json['driverName'] as String,
          json['noeSabt'] as int,
          json['nameNoeSabt'] as String,
          json['mabVahed'] as String,
          json['idForooshande'] as int,
          json['nameForooshande'] as String,
          json['mabKhales'] as String,
          json['mabKol'] as String,
          json['shomareBarname'] as String,
          json['dateBarname'] as String,
          json['emptyScale'] as String,
          json['fullScale'] as String,
          json['typeCar'] as String,
          json['tozi'] as String,
        );

Map<String, dynamic> _$MaterialDetailedIncomingRepResponseToJson(
        MaterialDetailedIncomingRepResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
      'shomareGhabz': instance.ticketNumber,
      'noeKala': instance.noeKala,
      'meghdar': instance.amount,
      'pelak': instance.plateNumber,
      'driverName': instance.driverName,
      'noeSabt': instance.registrationType,
      'nameNoeSabt': instance.registrationTypeName,
      'mabVahed': instance.unitPrice,
      'idForooshande': instance.customerId,
      'nameForooshande': instance.customerName,
      'mabKhales': instance.netPrice,
      'mabKol': instance.totalPrice,
      'shomareBarname': instance.billNumber,
      'dateBarname': instance.billDate,
      'emptyScale': instance.emptyScale,
      'fullScale': instance.fullScale,
      'typeCar': instance.carType,
      'tozi': instance.description,
    };

MaterialIncomingRepByProductResponse
    _$MaterialIncomingRepByProductResponseFromJson(Map<String, dynamic> json) =>
        MaterialIncomingRepByProductResponse(
          json['noeKala'] as String,
          json['nameKala'] as String,
          json['serviceCount'] as String,
          json['meghdarKol'] as String,
        );

Map<String, dynamic> _$MaterialIncomingRepByProductResponseToJson(
        MaterialIncomingRepByProductResponse instance) =>
    <String, dynamic>{
      'noeKala': instance.productType,
      'nameKala': instance.productName,
      'serviceCount': instance.serviceCount,
      'meghdarKol': instance.totalAmount,
    };

MaterialIncomingRepByCarResponse _$MaterialIncomingRepByCarResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialIncomingRepByCarResponse(
      json['plateNumber'] as String,
      json['serviceCount'] as String,
      json['meghdarKol'] as String,
    );

Map<String, dynamic> _$MaterialIncomingRepByCarResponseToJson(
        MaterialIncomingRepByCarResponse instance) =>
    <String, dynamic>{
      'plateNumber': instance.plateNumber,
      'serviceCount': instance.serviceCount,
      'meghdarKol': instance.meghdarKol,
    };

MaterialIncomingRepByCustomerResponse
    _$MaterialIncomingRepByCustomerResponseFromJson(
            Map<String, dynamic> json) =>
        MaterialIncomingRepByCustomerResponse(
          json['sellerName'] as String,
          json['serviceCount'] as String,
          json['meghdarKol'] as String,
        );

Map<String, dynamic> _$MaterialIncomingRepByCustomerResponseToJson(
        MaterialIncomingRepByCustomerResponse instance) =>
    <String, dynamic>{
      'sellerName': instance.customerName,
      'serviceCount': instance.serviceCount,
      'meghdarKol': instance.meghdarKol,
    };

MaterialIncomingRepByCustomerAndProductResponse
    _$MaterialIncomingRepByCustomerAndProductResponseFromJson(
            Map<String, dynamic> json) =>
        MaterialIncomingRepByCustomerAndProductResponse(
          json['customerCode'] as int,
          json['customerName'] as String,
          (json['totalProductWeight'] as num).toDouble(),
          json['totalServiceCount'] as int,
          json['productCount'] as int,
          (json['products'] as List<dynamic>)
              .map((e) =>
                  MaterialIncomingRepByCustomerAndProductProductItemResponse
                      .fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$MaterialIncomingRepByCustomerAndProductResponseToJson(
        MaterialIncomingRepByCustomerAndProductResponse instance) =>
    <String, dynamic>{
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'totalProductWeight': instance.totalProductWeight,
      'totalServiceCount': instance.totalServiceCount,
      'productCount': instance.productCount,
      'products': instance.products,
    };

MaterialIncomingRepByCustomerAndProductProductItemResponse
    _$MaterialIncomingRepByCustomerAndProductProductItemResponseFromJson(
            Map<String, dynamic> json) =>
        MaterialIncomingRepByCustomerAndProductProductItemResponse(
          json['productCode'] as int,
          json['productName'] as String,
          (json['weight'] as num).toDouble(),
          json['serviceCount'] as int,
        );

Map<String,
    dynamic> _$MaterialIncomingRepByCustomerAndProductProductItemResponseToJson(
        MaterialIncomingRepByCustomerAndProductProductItemResponse instance) =>
    <String, dynamic>{
      'productCode': instance.productCode,
      'productName': instance.productName,
      'weight': instance.weight,
      'serviceCount': instance.serviceCount,
    };

MaterialMineDailyRepResponse _$MaterialMineDailyRepResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialMineDailyRepResponse(
      json['date'] as String,
      json['serviceCount'] as String,
      json['meghdar'] as String,
      json['loadingTotalPrice'] as String,
      json['jamKerayeHaml'] as String,
      json['factorTotalPrice'] as String,
    );

Map<String, dynamic> _$MaterialMineDailyRepResponseToJson(
        MaterialMineDailyRepResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'serviceCount': instance.serviceCount,
      'meghdar': instance.meghdar,
      'loadingTotalPrice': instance.loadingTotalPrice,
      'jamKerayeHaml': instance.jamKerayeHaml,
      'factorTotalPrice': instance.factorTotalPrice,
    };

MaterialMineMonthlyRepResponse _$MaterialMineMonthlyRepResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialMineMonthlyRepResponse(
      json['monthName'] as String,
      json['serviceCount'] as String,
      json['meghdar'] as String,
      json['jamMablaghBargiri'] as String,
      json['jamKerayeKar'] as String,
      json['factorTotalPrice'] as String,
    );

Map<String, dynamic> _$MaterialMineMonthlyRepResponseToJson(
        MaterialMineMonthlyRepResponse instance) =>
    <String, dynamic>{
      'monthName': instance.monthName,
      'serviceCount': instance.serviceCount,
      'meghdar': instance.meghdar,
      'jamMablaghBargiri': instance.jamMablaghBargiri,
      'jamKerayeKar': instance.jamKerayeKar,
      'factorTotalPrice': instance.factorTotalPrice,
    };

MaterialMostCarrierRepResponse _$MaterialMostCarrierRepResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialMostCarrierRepResponse(
      json['carCode'] as String,
      json['plateNumber'] as String,
      json['serviceCount'] as String,
      json['meghdar'] as String,
      json['jamKerayeHaml'] as String,
    );

Map<String, dynamic> _$MaterialMostCarrierRepResponseToJson(
        MaterialMostCarrierRepResponse instance) =>
    <String, dynamic>{
      'carCode': instance.carCode,
      'plateNumber': instance.plateNumber,
      'serviceCount': instance.serviceCount,
      'meghdar': instance.meghdar,
      'jamKerayeHaml': instance.jamKerayeHaml,
    };

MaterialMineTransportToSaleRatioReportResponse
    _$MaterialMineTransportToSaleRatioReportResponseFromJson(
            Map<String, dynamic> json) =>
        MaterialMineTransportToSaleRatioReportResponse(
          (json['saleAmount'] as num).toDouble(),
          (json['transportAmount'] as num).toDouble(),
          json['ratio'] as String,
          json['ratioStr'] as String,
        );

Map<String, dynamic> _$MaterialMineTransportToSaleRatioReportResponseToJson(
        MaterialMineTransportToSaleRatioReportResponse instance) =>
    <String, dynamic>{
      'saleAmount': instance.saleAmount,
      'transportAmount': instance.transportAmount,
      'ratio': instance.ratio,
      'ratioStr': instance.ratioStr,
    };

CacheParamsResponse _$CacheParamsResponseFromJson(Map<String, dynamic> json) =>
    CacheParamsResponse(
      (json['madan'] as List<dynamic>?)
          ?.map((e) =>
              CacheParamValueMadanResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['anbar'] as List<dynamic>?)
          ?.map((e) =>
              CacheParamValueAnbarResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['goroohTafsili'] as List<dynamic>?)
          ?.map((e) => CacheParamValueGoroohTafsiliResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      (json['markazHazineh'] as List<dynamic>?)
          ?.map((e) => CacheParamValueMarkazHazinehResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      (json['moin'] as List<dynamic>?)
          ?.map((e) =>
              CacheParamValueMoinResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['customer'] as List<dynamic>?)
          ?.map((e) => CacheParamValueCustomersResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      (json['product'] as List<dynamic>?)
          ?.map((e) => CacheParamValueProductsResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      (json['car'] as List<dynamic>?)
          ?.map((e) => CacheParamValueCarListResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      (json['pomp'] as List<dynamic>?)
          ?.map((e) =>
              CacheParamValuePompResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['workType'] as List<dynamic>?)
          ?.map((e) => CacheParamValueBetonWorkTypeResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      (json['sharayetMohiti'] as List<dynamic>?)
          ?.map((e) => CacheParamValueShrayetMohitiBetonResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CacheParamsResponseToJson(
        CacheParamsResponse instance) =>
    <String, dynamic>{
      'madan': instance.madan,
      'anbar': instance.anbar,
      'goroohTafsili': instance.goroohTafsili,
      'markazHazineh': instance.markazHazineh,
      'moin': instance.moin,
      'customer': instance.customer,
      'product': instance.product,
      'car': instance.car,
      'pomp': instance.pomp,
      'workType': instance.betonWorkType,
      'sharayetMohiti': instance.betonSharayetMohiti,
    };

TafsiliResponse _$TafsiliResponseFromJson(Map<String, dynamic> json) =>
    TafsiliResponse(
      json['idTafsili'] as int,
      json['codTafsili'] as int,
      json['nameTafsili'] as String,
      json['idGoroTafsili'] as int,
      json['nameGoroTafsili'] as String,
      json['dbName'] as String,
    );

Map<String, dynamic> _$TafsiliResponseToJson(TafsiliResponse instance) =>
    <String, dynamic>{
      'idTafsili': instance.idTafsili,
      'codTafsili': instance.codTafsili,
      'nameTafsili': instance.nameTafsili,
      'idGoroTafsili': instance.idGoroTafsili,
      'nameGoroTafsili': instance.nameGoroTafsili,
      'dbName': instance.dbName,
    };

CacheParamValueBetonWorkTypeResponse
    _$CacheParamValueBetonWorkTypeResponseFromJson(Map<String, dynamic> json) =>
        CacheParamValueBetonWorkTypeResponse(
          json['id'] as int,
          json['workType'] as String,
        );

Map<String, dynamic> _$CacheParamValueBetonWorkTypeResponseToJson(
        CacheParamValueBetonWorkTypeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workType': instance.workType,
    };

CacheParamValueShrayetMohitiBetonResponse
    _$CacheParamValueShrayetMohitiBetonResponseFromJson(
            Map<String, dynamic> json) =>
        CacheParamValueShrayetMohitiBetonResponse(
          json['key'] as int,
          json['stringValue'] as String,
          json['value'] as String?,
        );

Map<String, dynamic> _$CacheParamValueShrayetMohitiBetonResponseToJson(
        CacheParamValueShrayetMohitiBetonResponse instance) =>
    <String, dynamic>{
      'key': instance.id,
      'stringValue': instance.name,
      'value': instance.value,
    };

CacheParamValueMadanResponse _$CacheParamValueMadanResponseFromJson(
        Map<String, dynamic> json) =>
    CacheParamValueMadanResponse(
      json['id'] as int,
      json['nameMadan'] as String,
    );

Map<String, dynamic> _$CacheParamValueMadanResponseToJson(
        CacheParamValueMadanResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameMadan': instance.name,
    };

CacheParamValueAnbarResponse _$CacheParamValueAnbarResponseFromJson(
        Map<String, dynamic> json) =>
    CacheParamValueAnbarResponse(
      json['id'] as int,
      json['nameAnbar'] as String,
    );

Map<String, dynamic> _$CacheParamValueAnbarResponseToJson(
        CacheParamValueAnbarResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameAnbar': instance.name,
    };

CacheParamValueGoroohTafsiliResponse
    _$CacheParamValueGoroohTafsiliResponseFromJson(Map<String, dynamic> json) =>
        CacheParamValueGoroohTafsiliResponse(
          json['id'] as int,
          json['name'] as String,
        );

Map<String, dynamic> _$CacheParamValueGoroohTafsiliResponseToJson(
        CacheParamValueGoroohTafsiliResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CacheParamValueMarkazHazinehResponse
    _$CacheParamValueMarkazHazinehResponseFromJson(Map<String, dynamic> json) =>
        CacheParamValueMarkazHazinehResponse(
          json['key'] as String,
          json['value'] as int,
          json['stringValue'] as String,
        );

Map<String, dynamic> _$CacheParamValueMarkazHazinehResponseToJson(
        CacheParamValueMarkazHazinehResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'stringValue': instance.stringValue,
    };

CacheParamValueMoinResponse _$CacheParamValueMoinResponseFromJson(
        Map<String, dynamic> json) =>
    CacheParamValueMoinResponse(
      json['id'] as int,
      json['codeMali'] as String,
      json['nameHesab'] as String,
      json['codMaliKol'] as String,
      json['nameHesabKol'] as String,
    );

Map<String, dynamic> _$CacheParamValueMoinResponseToJson(
        CacheParamValueMoinResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codeMali': instance.codeMali,
      'nameHesab': instance.nameHesab,
      'codMaliKol': instance.codMaliKol,
      'nameHesabKol': instance.nameHesabKol,
    };

CacheParamValueCustomersResponse _$CacheParamValueCustomersResponseFromJson(
        Map<String, dynamic> json) =>
    CacheParamValueCustomersResponse(
      json['customerId'] as int,
      json['customerCode'] as String,
      json['customerName'] as String,
      json['customerTitle'] as String,
      json['categoryName'] as String,
    );

Map<String, dynamic> _$CacheParamValueCustomersResponseToJson(
        CacheParamValueCustomersResponse instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'customerTitle': instance.customerTitle,
      'categoryName': instance.categoryName,
    };

CacheParamValueProductsResponse _$CacheParamValueProductsResponseFromJson(
        Map<String, dynamic> json) =>
    CacheParamValueProductsResponse(
      json['productId'] as int,
      json['productCode'] as String,
      json['productName'] as String,
      json['productUnit'] as String,
    );

Map<String, dynamic> _$CacheParamValueProductsResponseToJson(
        CacheParamValueProductsResponse instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'productUnit': instance.productUnit,
    };

CacheParamValueCarListResponse _$CacheParamValueCarListResponseFromJson(
        Map<String, dynamic> json) =>
    CacheParamValueCarListResponse(
      json['carId'] as int,
      json['carCode'] as String,
      json['plateNumber'] as String,
      json['plateP1'] as String,
      json['plateP2'] as String,
      json['plateP3'] as String,
      json['plateP4'] as String,
      json['driverName'] as String,
      json['carOwner'] as String,
      json['carModelName'] as String,
    );

Map<String, dynamic> _$CacheParamValueCarListResponseToJson(
        CacheParamValueCarListResponse instance) =>
    <String, dynamic>{
      'carId': instance.carId,
      'carCode': instance.carCode,
      'plateNumber': instance.plateNumber,
      'plateP1': instance.plateP1,
      'plateP2': instance.plateP2,
      'plateP3': instance.plateP3,
      'plateP4': instance.plateP4,
      'driverName': instance.driverName,
      'carOwner': instance.carOwner,
      'carModelName': instance.carModelName,
    };

CacheParamValuePompResponse _$CacheParamValuePompResponseFromJson(
        Map<String, dynamic> json) =>
    CacheParamValuePompResponse(
      json['id'] as int,
      json['code'] as String,
      json['pompDriver'] as String,
    );

Map<String, dynamic> _$CacheParamValuePompResponseToJson(
        CacheParamValuePompResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'pompDriver': instance.pompDriver,
    };

ManagementGetHesabLockConditionsResponse
    _$ManagementGetHesabLockConditionsResponseFromJson(
            Map<String, dynamic> json) =>
        ManagementGetHesabLockConditionsResponse(
          json['lockDate'] as String,
          json['lockAutomatic'] as bool,
          json['lockDayLength'] as int,
        );

Map<String, dynamic> _$ManagementGetHesabLockConditionsResponseToJson(
        ManagementGetHesabLockConditionsResponse instance) =>
    <String, dynamic>{
      'lockDate': instance.lockDate,
      'lockAutomatic': instance.lockAutomatic,
      'lockDayLength': instance.lockDayLength,
    };

TreasuryDaryaftAndPardakhtRepResponse
    _$TreasuryDaryaftAndPardakhtRepResponseFromJson(
            Map<String, dynamic> json) =>
        TreasuryDaryaftAndPardakhtRepResponse(
          json['date'] as String?,
          json['radif'] as String?,
          json['pardakhtKonande'] as String?,
          json['daryaftKonande'] as String?,
          json['mablagh'] as String?,
          json['noe'] as String?,
          json['serial'] as String?,
          json['description'] as String?,
        );

Map<String, dynamic> _$TreasuryDaryaftAndPardakhtRepResponseToJson(
        TreasuryDaryaftAndPardakhtRepResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'radif': instance.radif,
      'pardakhtKonande': instance.pardakhtKonande,
      'daryaftKonande': instance.daryaftKonande,
      'mablagh': instance.mablagh,
      'noe': instance.noe,
      'serial': instance.serial,
      'description': instance.description,
    };

TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse
    _$TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponseFromJson(
            Map<String, dynamic> json) =>
        TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse(
          json['hesab'] as String,
          json['mablagh'] as String,
        );

Map<String, dynamic> _$TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponseToJson(
        TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse instance) =>
    <String, dynamic>{
      'hesab': instance.hesab,
      'mablagh': instance.mablagh,
    };

TreasuryGoTajmiDaryaftAndPardakhtRepResponse
    _$TreasuryGoTajmiDaryaftAndPardakhtRepResponseFromJson(
            Map<String, dynamic> json) =>
        TreasuryGoTajmiDaryaftAndPardakhtRepResponse(
          json['naghdi'] as String,
          json['check'] as String,
          json['havale'] as String,
          json['kartKhan'] as String,
        );

Map<String, dynamic> _$TreasuryGoTajmiDaryaftAndPardakhtRepResponseToJson(
        TreasuryGoTajmiDaryaftAndPardakhtRepResponse instance) =>
    <String, dynamic>{
      'naghdi': instance.naghdi,
      'check': instance.check,
      'havale': instance.havale,
      'kartKhan': instance.kartKhan,
    };

FinancialBedBesResponse _$FinancialBedBesResponseFromJson(
        Map<String, dynamic> json) =>
    FinancialBedBesResponse(
      (json['details'] as List<dynamic>?)
          ?.map((e) => FinancialBedBesRepResponseDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['totalMandeBedStr'] as String,
      json['totalMandeBesStr'] as String,
      json['totalMandeBed'] as int,
      json['totalMandeBes'] as int,
    );

Map<String, dynamic> _$FinancialBedBesResponseToJson(
        FinancialBedBesResponse instance) =>
    <String, dynamic>{
      'details': instance.details,
      'totalMandeBedStr': instance.totalMandeBedStr,
      'totalMandeBesStr': instance.totalMandeBesStr,
      'totalMandeBed': instance.totalMandeBed,
      'totalMandeBes': instance.totalMandeBes,
    };

FinancialBedBesRepResponseDetail _$FinancialBedBesRepResponseDetailFromJson(
        Map<String, dynamic> json) =>
    FinancialBedBesRepResponseDetail(
      json['codHesab'] as String,
      json['nameHesab'] as String,
      json['title2'] as String,
      json['mabBedStr'] as String,
      json['mabBed'] as int,
      json['mabBesStr'] as String,
      json['mabBes'] as int,
      json['mandeBed'] as int,
      json['mandeBedStr'] as String,
      json['mandeBes'] as int,
      json['mandeBesStr'] as String,
      json['mobile1'] as String,
      json['mobile2'] as String,
      json['address'] as String,
    );

Map<String, dynamic> _$FinancialBedBesRepResponseDetailToJson(
        FinancialBedBesRepResponseDetail instance) =>
    <String, dynamic>{
      'codHesab': instance.codHesab,
      'nameHesab': instance.nameHesab,
      'title2': instance.title2,
      'mabBedStr': instance.mabBedStr,
      'mabBed': instance.mabBed,
      'mabBesStr': instance.mabBesStr,
      'mabBes': instance.mabBes,
      'mandeBedStr': instance.mandeBedStr,
      'mandeBed': instance.mandeBed,
      'mandeBesStr': instance.mandeBesStr,
      'mandeBes': instance.mandeBes,
      'mobile1': instance.mobile1,
      'mobile2': instance.mobile2,
      'address': instance.address,
    };

FinancialGozareshHesabRepResponse _$FinancialGozareshHesabRepResponseFromJson(
        Map<String, dynamic> json) =>
    FinancialGozareshHesabRepResponse(
      json['date'] as String,
      json['noeBarge'] as String,
      json['strNoeBarge'] as String,
      json['shBarge'] as String,
      json['description'] as String,
      json['bed'] as String,
      json['bes'] as String,
      json['mandeh'] as String,
      json['tashkhis'] as String,
    );

Map<String, dynamic> _$FinancialGozareshHesabRepResponseToJson(
        FinancialGozareshHesabRepResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'noeBarge': instance.noeBarge,
      'strNoeBarge': instance.strNoeBarge,
      'shBarge': instance.shBarge,
      'description': instance.description,
      'bed': instance.bed,
      'bes': instance.bes,
      'mandeh': instance.mandeh,
      'tashkhis': instance.tashkhis,
    };

PlateReaderDailyTotaledAndTotaledRepRepResponse
    _$PlateReaderDailyTotaledAndTotaledRepRepResponseFromJson(
            Map<String, dynamic> json) =>
        PlateReaderDailyTotaledAndTotaledRepRepResponse(
          json['rowNum'] as int,
          json['p1'] as int,
          json['p2'] as String,
          json['p3'] as int,
          json['p4'] as int,
          json['plateStr'] as String,
          json['instanceId'] as int,
          json['instanceName'] as String,
          json['readDate'] as String?,
          json['trafficCount'] as int,
          json['totalRec'] as int,
        );

Map<String, dynamic> _$PlateReaderDailyTotaledAndTotaledRepRepResponseToJson(
        PlateReaderDailyTotaledAndTotaledRepRepResponse instance) =>
    <String, dynamic>{
      'rowNum': instance.rowNum,
      'p1': instance.p1,
      'p2': instance.p2,
      'p3': instance.p3,
      'p4': instance.p4,
      'plateStr': instance.plateStr,
      'instanceId': instance.instanceId,
      'instanceName': instance.instanceName,
      'readDate': instance.readDate,
      'trafficCount': instance.trafficCount,
      'totalRec': instance.totalRec,
    };

PlateReaderInstanceListResponse _$PlateReaderInstanceListResponseFromJson(
        Map<String, dynamic> json) =>
    PlateReaderInstanceListResponse(
      json['instanceId'] as int,
      json['sendPlateDelaySeconds'] as int,
      json['serviceBusAddress'] as String,
      json['videoPath'] as String,
      json['aiFilePath'] as String,
      json['description'] as String,
      json['showBasculeWeight'] as bool,
      (json['confidenceLimit'] as num).toDouble(),
    );

Map<String, dynamic> _$PlateReaderInstanceListResponseToJson(
        PlateReaderInstanceListResponse instance) =>
    <String, dynamic>{
      'instanceId': instance.instanceId,
      'sendPlateDelaySeconds': instance.sendPlateDelaySeconds,
      'serviceBusAddress': instance.serviceBusAddress,
      'videoPath': instance.videoPath,
      'aiFilePath': instance.aiFilePath,
      'description': instance.description,
      'showBasculeWeight': instance.showBasculeWeight,
      'confidenceLimit': instance.confidenceLimit,
    };

PlateReaderDetailedRepResponse _$PlateReaderDetailedRepResponseFromJson(
        Map<String, dynamic> json) =>
    PlateReaderDetailedRepResponse(
      json['rowNum'] as int,
      json['p1'] as int,
      json['p2'] as String,
      json['p3'] as int,
      json['p4'] as int,
      json['plateStr'] as String,
      json['instanceId'] as int,
      json['instanceName'] as String,
      json['readDate'] as String,
      json['totalRec'] as int,
      json['codedPlateNumber'] as int,
      (json['confidence'] as num).toDouble(),
      json['confidenceStr'] as String,
      json['carImageAddress'] as String,
      json['carImageLink'] as String,
      json['plateImageAddress'] as String,
      json['plateImageLink'] as String,
      json['loadImageAddress'] as String,
      json['loadImageLink'] as String,
      json['direction'] as int,
      json['liveWeight'] as String,
      json['isReserved'] as bool,
      json['isReservedStr'] as String,
      json['isValid'] as bool,
      json['isValidStr'] as String,
      json['hasCarImage'] as bool,
      json['hasPlateImage'] as bool,
      json['hasLoadImage'] as bool,
      json['readTime'] as String,
    );

Map<String, dynamic> _$PlateReaderDetailedRepResponseToJson(
        PlateReaderDetailedRepResponse instance) =>
    <String, dynamic>{
      'rowNum': instance.rowNum,
      'p1': instance.p1,
      'p2': instance.p2,
      'p3': instance.p3,
      'p4': instance.p4,
      'plateStr': instance.plateStr,
      'instanceId': instance.instanceId,
      'instanceName': instance.instanceName,
      'readDate': instance.readDate,
      'totalRec': instance.totalRec,
      'codedPlateNumber': instance.codedPlateNumber,
      'confidence': instance.confidence,
      'confidenceStr': instance.confidenceStr,
      'carImageAddress': instance.carImageAddress,
      'carImageLink': instance.carImageLink,
      'plateImageAddress': instance.plateImageAddress,
      'plateImageLink': instance.plateImageLink,
      'loadImageAddress': instance.loadImageAddress,
      'loadImageLink': instance.loadImageLink,
      'direction': instance.direction,
      'liveWeight': instance.liveWeight,
      'isReserved': instance.isReserved,
      'isReservedStr': instance.isReservedStr,
      'isValid': instance.isValid,
      'isValidStr': instance.isValidStr,
      'hasCarImage': instance.hasCarImage,
      'hasPlateImage': instance.hasPlateImage,
      'hasLoadImage': instance.hasLoadImage,
      'readTime': instance.readTime,
    };

ConcreteOrdersInDayRepResponse _$ConcreteOrdersInDayRepResponseFromJson(
        Map<String, dynamic> json) =>
    ConcreteOrdersInDayRepResponse(
      json['id'] as int,
      json['date'] as String,
      json['time'] as String,
      json['customerId'] as int,
      json['customerName'] as String,
      json['address'] as String,
      json['pompId'] as int,
      json['pompCode'] as String,
      json['pompDriver'] as String,
      (json['meghdar'] as num).toDouble(),
      (json['meghdarBargashti'] as num).toDouble(),
      json['tolerance'] as String,
      (json['meghdarErsali'] as num).toDouble(),
      (json['meghdarMande'] as num).toDouble(),
      json['productCode'] as String,
      json['productName'] as String,
      json['controlType'] as int,
      json['controlTypeName'] as String,
      json['processStatusName'] as String,
      json['workTypeName'] as String,
      json['workStatusName'] as String,
      json['workStatusDescription'] as String,
      json['workStatus'] as int,
      json['processStatus'] as int,
      json['finalStatusOrder'] as String,
    );

Map<String, dynamic> _$ConcreteOrdersInDayRepResponseToJson(
        ConcreteOrdersInDayRepResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'address': instance.address,
      'pompId': instance.pompId,
      'pompCode': instance.pompCode,
      'pompDriver': instance.pompDriver,
      'meghdar': instance.meghdar,
      'meghdarBargashti': instance.meghdarBargashti,
      'tolerance': instance.tolerance,
      'meghdarErsali': instance.meghdarErsali,
      'meghdarMande': instance.meghdarMande,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'controlType': instance.controlType,
      'controlTypeName': instance.controlTypeName,
      'processStatusName': instance.processStatusName,
      'workTypeName': instance.workTypeName,
      'workStatusName': instance.workStatusName,
      'workStatusDescription': instance.workStatusDescription,
      'workStatus': instance.workStatus,
      'processStatus': instance.processStatus,
      'finalStatusOrder': instance.finalStatusOrder,
    };

ConcreteSaleDetailedRepResponse _$ConcreteSaleDetailedRepResponseFromJson(
        Map<String, dynamic> json) =>
    ConcreteSaleDetailedRepResponse(
      json['date'] as String,
      json['shomareGhabz'] as String,
      json['time'] as String,
      json['customerCode'] as String,
      json['customerName'] as String,
      json['productCode'] as String,
      json['productName'] as String,
      json['ayar'] as String,
      json['totalWeight'] as int,
      json['pureWeight'] as int,
      json['ersali'] as String,
      json['daryafti'] as String,
      json['meghdar'] as String,
      json['mablaghJoz'] as String,
      json['productPrice'] as String,
      json['driverName'] as String,
      json['plateNumber'] as String,
      json['pompOperator'] as String,
      json['pompType'] as String,
      json['anbar'] as String,
      json['address'] as String,
      json['workType'] as String,
    );

Map<String, dynamic> _$ConcreteSaleDetailedRepResponseToJson(
        ConcreteSaleDetailedRepResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'shomareGhabz': instance.shomareGhabz,
      'time': instance.time,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'ayar': instance.ayar,
      'totalWeight': instance.totalWeight,
      'pureWeight': instance.pureWeight,
      'ersali': instance.ersali,
      'daryafti': instance.daryafti,
      'meghdar': instance.meghdar,
      'mablaghJoz': instance.mablaghJoz,
      'productPrice': instance.productPrice,
      'driverName': instance.driverName,
      'plateNumber': instance.plateNumber,
      'pompOperator': instance.pompOperator,
      'pompType': instance.pompType,
      'anbar': instance.anbar,
      'address': instance.address,
      'workType': instance.workType,
    };

ConcreteReportByCustomerAndProductResponse
    _$ConcreteReportByCustomerAndProductResponseFromJson(
            Map<String, dynamic> json) =>
        ConcreteReportByCustomerAndProductResponse(
          json['customerCode'] as String?,
          json['customerName'] as String?,
          json['productCode'] as String?,
          json['productName'] as String?,
          json['pureWeight'] as String?,
          json['serviceCount'] as String?,
          json['mablaghJoz'] as String?,
          json['unitPrice'] as String?,
          json['totalPrice'] as String?,
          json['keraye'] as String?,
        );

Map<String, dynamic> _$ConcreteReportByCustomerAndProductResponseToJson(
        ConcreteReportByCustomerAndProductResponse instance) =>
    <String, dynamic>{
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'pureWeight': instance.pureWeight,
      'serviceCount': instance.serviceCount,
      'mablaghJoz': instance.mablaghJoz,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'keraye': instance.keraye,
    };

ConcreteSalesByProductRepResponse _$ConcreteSalesByProductRepResponseFromJson(
        Map<String, dynamic> json) =>
    ConcreteSalesByProductRepResponse(
      json['productName'] as String,
      json['productCode'] as String,
      json['meghdar'] as String,
      json['serviceCount'] as String,
      (json['unitPrice'] as num?)?.toDouble(),
      (json['salePrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ConcreteSalesByProductRepResponseToJson(
        ConcreteSalesByProductRepResponse instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productCode': instance.productCode,
      'meghdar': instance.meghdar,
      'serviceCount': instance.serviceCount,
      'unitPrice': instance.unitPrice,
      'salePrice': instance.salePrice,
    };

ConcreteSalesDailyTotaledRepResponse
    _$ConcreteSalesDailyTotaledRepResponseFromJson(Map<String, dynamic> json) =>
        ConcreteSalesDailyTotaledRepResponse(
          json['date'] as String,
          json['serviceCount'] as String,
          json['meghdar'] as String,
          json['totalPrice'] as String,
        );

Map<String, dynamic> _$ConcreteSalesDailyTotaledRepResponseToJson(
        ConcreteSalesDailyTotaledRepResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'serviceCount': instance.serviceCount,
      'meghdar': instance.meghdar,
      'totalPrice': instance.totalPrice,
    };

ConcreteMixerDailyCumulativeRepResponse
    _$ConcreteMixerDailyCumulativeRepResponseFromJson(
            Map<String, dynamic> json) =>
        ConcreteMixerDailyCumulativeRepResponse(
          json['date'] as String,
          json['driver'] as String,
          json['plateNumber'] as String,
          json['carId'] as int,
          json['serviceCount'] as String,
          json['hamlShode'] as String,
          json['meghdarBeton'] as String,
        );

Map<String, dynamic> _$ConcreteMixerDailyCumulativeRepResponseToJson(
        ConcreteMixerDailyCumulativeRepResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'driver': instance.driver,
      'plateNumber': instance.plateNumber,
      'carId': instance.carId,
      'serviceCount': instance.serviceCount,
      'hamlShode': instance.hamlShode,
      'meghdarBeton': instance.meghdarBeton,
    };

ConcreteMixerDriverDetailedRepResponse
    _$ConcreteMixerDriverDetailedRepResponseFromJson(
            Map<String, dynamic> json) =>
        ConcreteMixerDriverDetailedRepResponse(
          json['date'] as String,
          json['time'] as String,
          json['shomareGhabz'] as int,
          json['customerCode'] as String,
          json['customerName'] as String,
          json['driverId'] as int,
          json['driverName'] as String,
          json['hamlShode'] as String,
          json['mixerReward'] as String,
          json['mixerTotalReward'] as String,
        );

Map<String, dynamic> _$ConcreteMixerDriverDetailedRepResponseToJson(
        ConcreteMixerDriverDetailedRepResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
      'shomareGhabz': instance.shomareGhabz,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'hamlShode': instance.hamlShode,
      'mixerReward': instance.mixerReward,
      'mixerTotalReward': instance.mixerTotalReward,
    };

ConcretePompKarkardPompRepResponse _$ConcretePompKarkardPompRepResponseFromJson(
        Map<String, dynamic> json) =>
    ConcretePompKarkardPompRepResponse(
      json['date'] as String,
      json['codePomp'] as String,
      json['namePomp'] as String,
      json['tedadIstgah'] as String,
      json['jamPompazh'] as String,
      json['tedadMixer'] as String,
    );

Map<String, dynamic> _$ConcretePompKarkardPompRepResponseToJson(
        ConcretePompKarkardPompRepResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'codePomp': instance.codePomp,
      'namePomp': instance.namePomp,
      'tedadIstgah': instance.tedadIstgah,
      'jamPompazh': instance.jamPompazh,
      'tedadMixer': instance.tedadMixer,
    };
