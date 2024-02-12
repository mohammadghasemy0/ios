import '/app/extension.dart';
import '/app/functions.dart';
import '/data/response/customer_api_response.dart';
import '/data/response/japo_api_response.dart';
import '/domain/model/model.dart';

extension KianoAccessListMapper on KianoAccessListResponse {
  List<Company> toDomain() => accessList.map((e) => e.toDomain()).toList();
}

extension KianoAccessListItemMapper on AccessListCompanyItemResponse {
  Company toDomain() => Company(
      id,
      customerId,
      customerName,
      serverAddress,
      serverPassword,
      serverDbName,
      description,
      accountingAccess,
      treasuryAccess,
      saleAccess,
      storeAccess,
      salaryAccess,
      concreteAccess,
      sanadAccess,
      weightAccess,
      plateReaderAccess,
      sandAccess,
      managementAccess);
}

extension FiscalYearListMapper on List<FiscalYearResponse> {
  List<FiscalYear> toDomain() => map((e) => e.toDomain()).toList();
}

extension FiscalYearMapper on FiscalYearResponse {
  FiscalYear toDomain() => FiscalYear(dbName, description, startDate, endDate);
}

extension MaterialBillRepMapper on MaterialBillRepResponse {
  MaterialBillRep toDomain() => MaterialBillRep(
      persianDate,
      billNumber,
      customerName,
      time,
      productName,
      weight,
      unitPrice,
      totalPrice,
      customerFare,
      truckFare,
      receivedPrice,
      cash,
      card,
      remaining,
      plateNumber,
      address,
      driverName,
      discount,
      amount);
}

extension MaterialBillRepListMapper on List<MaterialBillRepResponse> {
  List<MaterialBillRep> toDomain() => map((e) => e.toDomain()).toList();
}

extension MaterialBillRepByCustomerMapper on MaterialBillRepByCustomerResponse {
  MaterialBillRepByCustomer toDomain() => MaterialBillRepByCustomer(
      customerCode,
      customerName,
      serviceCount.orEmpty(),
      totalJamKol ?? 0,
      totalJamKolStr.orEmpty(),
      totalProductWeight,
      totalServiceCount,
      productCount,
      products.toDomain());
}

extension MaterialBillRepByCustomerListListMapper
    on List<MaterialBillRepByCustomerResponse> {
  List<MaterialBillRepByCustomer> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension MaterialBillProductMapper on MaterialBillProductResponse {
  MaterialBillProduct toDomain() => MaterialBillProduct(productCode,
      productName, weight, serviceCount, jamKol ?? 0, jamKolStr.orEmpty());
}

extension MaterialBillProductListMapper on List<MaterialBillProductResponse> {
  List<MaterialBillProduct> toDomain() => map((e) => e.toDomain()).toList();
}

extension CardItemMapper on CardItemResponse {
  ChartCardItem toDomain() => ChartCardItem(key, value, stringValue);
}

extension CardItemListMapper on List<CardItemResponse> {
  List<ChartCardItem> toDomain() => map((e) => e.toDomain()).toList();
}

extension ChartItemMapper on ChartItemResponse {
  ChartCardItem toDomain() => ChartCardItem(key, value.toString(), stringValue);
}

extension ChartItemListMapper on List<ChartItemResponse> {
  List<ChartCardItem> toDomain() => map((e) => e.toDomain()).toList();
}

extension ChartListItemMapper on ChartListItemResponse {
  ChartList toDomain() => ChartList(uniqueId, title, show, data.toDomain());
}

extension ChartListItemListMapper on List<ChartListItemResponse> {
  List<ChartList> toDomain() => map((e) => e.toDomain()).toList();
}

extension CardListItemMapper on CardListItemResponse {
  ChartList toDomain() => ChartList(uniqueId, title, show, data.toDomain());
}

extension CardListItemListMapper on List<CardListItemResponse> {
  List<ChartList> toDomain() => map((e) => e.toDomain()).toList();
}

extension SaleCardListItemMapper on SaleCardListItemResponse {
  ChartList toDomain() => ChartList(uniqueId, title, show, data.toDomain());
}

extension SaleCardListItemListMapper on List<SaleCardListItemResponse> {
  List<ChartList> toDomain() => map((e) => e.toDomain()).toList();
}

extension MaterialDailySummaryRepMapper on MaterialDailySummaryRepResponse {
  MaterialDailySummaryRep toDomain() =>
      MaterialDailySummaryRep(cardList.toDomain(), chartList.toDomain());
}

extension ConcreteDailySummaryRepMapper on ConcreteDailySummaryRepResponse {
  ConcreteDailySummaryRep toDomain() =>
      ConcreteDailySummaryRep(cardList.toDomain(), chartList.toDomain());
}

extension SaleDailySummaryRepMapper on SaleDailySummaryRepResponse {
  SaleDailySummaryRep toDomain() =>
      SaleDailySummaryRep(cardList.toDomain(), chartList.toDomain());
}

extension PlateDailySummaryRepMapper on PlateDailySummaryRepResponse {
  PlateDailySummaryRep toDomain() => PlateDailySummaryRep(cardList.toDomain());
}

extension BasculeDailySummaryRepMapper on BasculeDailySummaryRepResponse {
  BasculeDailySummaryRep toDomain() =>
      BasculeDailySummaryRep(cardList.toDomain());
}

extension TreasuryDailySummaryRepMapper on TreasuryDailySummaryRepResponse {
  TreasuryDailySummaryRep toDomain() =>
      TreasuryDailySummaryRep(cardList.toDomain());
}

extension FinanceDailySummaryRepMapper on FinanceDailySummaryRepResponse {
  FinanceDailySummaryRep toDomain() =>
      FinanceDailySummaryRep(cardList.toDomain());
}

extension MaterialDetailedIncomingRepListMapper
    on List<MaterialDetailedIncomingRepResponse> {
  List<MaterialDetailedIncomingRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension MaterialDetailedIncomingRepMapper
    on MaterialDetailedIncomingRepResponse {
  MaterialDetailedIncomingRep toDomain() => MaterialDetailedIncomingRep(
      date,
      time,
      ticketNumber,
      noeKala,
      amount,
      plateNumber,
      driverName,
      registrationType,
      registrationTypeName,
      unitPrice,
      customerId,
      customerName,
      netPrice,
      totalPrice,
      billNumber,
      billDate,
      emptyScale,
      fullScale,
      carType,
      description);
}

extension MaterialBillRepByCarListMapper on List<MaterialBillRepByCarResponse> {
  List<MaterialBillRepByCar> toDomain() => map((e) => e.toDomain()).toList();
}

extension MaterialBillRepByCarRepMapper on MaterialBillRepByCarResponse {
  MaterialBillRepByCar toDomain() =>
      MaterialBillRepByCar(plateNumber, serviceCount, totalAmount);
}

extension MaterialBillRepByProductListMapper
    on List<MaterialBillRepByProductResponse> {
  List<MaterialBillRepByProduct> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension MaterialBillRepByProductMapper on MaterialBillRepByProductResponse {
  MaterialBillRepByProduct toDomain() => MaterialBillRepByProduct(
      productCode,
      productName,
      amount,
      unitPrice,
      salePrice,
      discount,
      tax,
      totalPrice,
      serviceCount);
}

extension MaterialIncomingRepByCarListMapper
    on List<MaterialIncomingRepByCarResponse> {
  List<MaterialIncomingRepByCar> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension MaterialIncomingRepByCarMapper on MaterialIncomingRepByCarResponse {
  MaterialIncomingRepByCar toDomain() =>
      MaterialIncomingRepByCar(plateNumber, serviceCount, meghdarKol);
}

extension MaterialIncomingRepByProductListMapper
    on List<MaterialIncomingRepByProductResponse> {
  List<MaterialIncomingRepByProduct> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension MaterialIncomingRepByProductMapper
    on MaterialIncomingRepByProductResponse {
  MaterialIncomingRepByProduct toDomain() => MaterialIncomingRepByProduct(
      productType, productName, serviceCount, totalAmount);
}

extension MaterialIncomingRepByCustomerListMapper
    on List<MaterialIncomingRepByCustomerResponse> {
  List<MaterialIncomingRepByCustomer> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension MaterialIncomingRepByCustomerMapper
    on MaterialIncomingRepByCustomerResponse {
  MaterialIncomingRepByCustomer toDomain() =>
      MaterialIncomingRepByCustomer(customerName, serviceCount, meghdarKol);
}

extension MaterialIncomingRepByCustomerAndProductListListMapper
    on List<MaterialIncomingRepByCustomerAndProductResponse> {
  List<MaterialIncomingRepByCustomerAndProduct> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension MaterialIncomingRepByCustomerAndProductMapper
    on MaterialIncomingRepByCustomerAndProductResponse {
  MaterialIncomingRepByCustomerAndProduct toDomain() =>
      MaterialIncomingRepByCustomerAndProduct(
          customerCode,
          customerName,
          totalProductWeight,
          totalServiceCount,
          productCount,
          products.toDomain());
}

extension MaterialIncomingRepByCustomerAndProductProductItemListMapper
    on List<MaterialIncomingRepByCustomerAndProductProductItemResponse> {
  List<MaterialIncomingRepByCustomerAndProductProductItem> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension MaterialIncomingRepByCustomerAndProductProductItemMapper
    on MaterialIncomingRepByCustomerAndProductProductItemResponse {
  MaterialIncomingRepByCustomerAndProductProductItem toDomain() =>
      MaterialIncomingRepByCustomerAndProductProductItem(
          productCode, productName, weight, serviceCount);
}

extension MaterialMineDailyRepListMapper on List<MaterialMineDailyRepResponse> {
  List<MaterialMineDailyRep> toDomain() => map((e) => e.toDomain()).toList();
}

extension MaterialMineDailyRepMapper on MaterialMineDailyRepResponse {
  MaterialMineDailyRep toDomain() => MaterialMineDailyRep(date, serviceCount,
      meghdar, loadingTotalPrice, jamKerayeHaml, factorTotalPrice);
}

extension MaterialMineMonthlyRepListMapper
    on List<MaterialMineMonthlyRepResponse> {
  List<MaterialMineMonthlyRep> toDomain() => map((e) => e.toDomain()).toList();
}

extension MaterialMineMonthlyRepMapper on MaterialMineMonthlyRepResponse {
  MaterialMineMonthlyRep toDomain() => MaterialMineMonthlyRep(monthName,
      serviceCount, meghdar, jamMablaghBargiri, jamKerayeKar, factorTotalPrice);
}

extension MaterialMostCarrierRepListMapper
    on List<MaterialMostCarrierRepResponse> {
  List<MaterialMineMostCarrierRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension MaterialMostCarrierRepMapper on MaterialMostCarrierRepResponse {
  MaterialMineMostCarrierRep toDomain() => MaterialMineMostCarrierRep(
      carCode, plateNumber, serviceCount, meghdar, jamKerayeHaml);
}

extension MaterialMineTransportToSaleRatioReportListMapper
    on List<MaterialMineTransportToSaleRatioReportResponse> {
  List<MaterialMineTransportToSaleRatioReport> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension MaterialMineTransportToSaleRatioReportMapper
    on MaterialMineTransportToSaleRatioReportResponse {
  MaterialMineTransportToSaleRatioReport toDomain() =>
      MaterialMineTransportToSaleRatioReport(
          saleAmount, transportAmount, ratio, ratioStr);
}

/////////////////////////////////////////////////////////////

// class ReportItemData {
//   final List<ReportItemDataField> items;
//   final String title;
//   final ReportItemDataField? header;
//   final ReportItemDataField? footer;
//
//   ReportItemData(
//       {required this.items,
//         required this.title,
//         this.header,
//         this.footer});
// }
//
// class CardList {
//   final int uniqueId;
//   final String cardTitle;
//   final bool show;
//   final List<ChartCardItem> cardData;
//
//   CardList(this.uniqueId, this.cardTitle, this.show, this.cardData);
// }

extension CardListItemListToReportItemDataListMapper on List<ChartList> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension CardListItemToReportItemDataMapper on ChartList {
  ReportItemData toReportItemData() => ReportItemData(
      items: data.map((e) => e.toReportItemDataField()).toList(), title: title);
}

extension ChartCardItemToReportItemDataFieldMapper on ChartCardItem {
  ReportItemDataField toReportItemDataField() =>
      ReportItemDataField(key, value);
}

///////////////////////////////////////////////////////////////
extension ChartListItemListToChartItemDataListMapper on List<ChartList> {
  List<ChartItemData> toChartItemDataList() =>
      map((e) => e.toChartItemData()).toList();
}

extension ChartListItemToReportItemDataMapper on ChartList {
  ChartItemData toChartItemData() => ChartItemData(
      chartItemDataList: data.map((e) => e.toChartItemDataField()).toList(),
      title: title);
}

extension ChartCardItemToChartItemDataFieldMapper on ChartCardItem {
  ChartItemDataField toChartItemDataField() =>
      ChartItemDataField(key, double.parse(value));
}

extension MaterialBillRepListToReportItemDataListMapper
    on List<MaterialBillRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

// 'persianDate'
// 'billNumber'
// 'customerName'
// 'time'
// 'productName'
// 'weight'
// 'unitPrice'
// 'totalPrice'
// 'customerFare'
// 'truckFare'
// 'receivedPrice'
// 'cash'
// 'card'
// 'remaining'
// 'plateNumber'
// 'address'
// 'driverName'
// 'discount'
// 'amount'

extension MaterialBillRepToReportItemDataMapper on MaterialBillRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تاریخ و زمان', "$time $persianDate"),
        ReportItemDataField('مشتری', customerName),
        ReportItemDataField('آدرس', address),
        ReportItemDataField('پلاک', plateNumber),
        ReportItemDataField('راننده', driverName),
        ReportItemDataField('محصول', productName),
        ReportItemDataField('قیمت واحد', unitPrice),
        ReportItemDataField('وزن', weight),
        ReportItemDataField('قیمت کل', totalPrice),
        ReportItemDataField('کرایه مشتری', customerFare),
        ReportItemDataField('کرایه خودرو', truckFare),
        ReportItemDataField('تخفیف', discount),
        ReportItemDataField('مبلغ دریافتی', receivedPrice),
        ReportItemDataField('نقدی', cash),
        ReportItemDataField('کارت', card),
        ReportItemDataField('باقی مانده', remaining),
      ], title: "فاکتور $billNumber");
}

extension MaterialBillRepByCarToReportItemDataMapper on MaterialBillRepByCar {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تعداد', serviceCount),
        ReportItemDataField('مقدار کل', totalAmount),
      ], title: plateNumber);
}

extension MaterialBillRepByCarListToReportItemDataListMapper
    on List<MaterialBillRepByCar> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialBillRepByCustomerToReportItemDataMapper
    on MaterialBillRepByCustomer {
  ReportItemData toReportItemData() => ReportItemData(
        items: [
          ReportItemDataField('تعداد', serviceCount),
          ReportItemDataField('جمع کل', totalJamKol.toStringAsFixed(3)),
          ReportItemDataField(
              'مقدار کل', totalProductWeight.toStringAsFixed(3)),
          ReportItemDataField('جمع کل سرویس', totalServiceCount.toString()),
          ReportItemDataField('محصولات', productCount.toString(),
              list: products.toReportItemDataList()),
        ],
        title: "$customerName $customerCode",
      );
}

extension MaterialBillProductListToReportItemDataListMapper
    on List<MaterialBillProduct> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialBillProductToReportItemDataMapper on MaterialBillProduct {
  ReportItemData toReportItemData() => ReportItemData(
        items: [
          ReportItemDataField('تعداد', "$serviceCount"),
          ReportItemDataField('مقدار کل', weight.toStringAsFixed(3)),
          ReportItemDataField('جمع کل', doubleFormatter(jamKol)
  ),
  //
        ],
        title: "$productName $productCode",
      );
}

// final List<MaterialBillProduct> products;
extension MaterialBillRepByCustomerListToReportItemDataListMapper
    on List<MaterialBillRepByCustomer> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialBillRepByProductToReportItemDataMapper
    on MaterialBillRepByProduct {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تعداد', amount),
        ReportItemDataField('جمع کل', unitPrice),
        ReportItemDataField('مقدار کل', salePrice),
        ReportItemDataField('جمع کل سرویس', discount),
        ReportItemDataField('تعداد محصول', tax),
        ReportItemDataField('تعداد محصول', totalPrice),
        ReportItemDataField('تعداد محصول', serviceCount),
      ], title: "$productName $productCode");
}

extension MaterialBillRepByProductListToReportItemDataListMapper
    on List<MaterialBillRepByProduct> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialDetailedIncomingToReportItemDataMapper
    on MaterialDetailedIncomingRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('شماره قبض', ticketNumber),
        ReportItemDataField('تاریخ', "$time - $date"),
        ReportItemDataField('نوع کالا', noeKala),
        ReportItemDataField('مقدار', amount),
        ReportItemDataField('قیمت واحد', unitPrice),
        ReportItemDataField('قیمت کل', totalPrice),
        ReportItemDataField('پلاک', plateNumber),
        ReportItemDataField('راننده', driverName),
        ReportItemDataField('نوع خودرو', carType),
        ReportItemDataField('توضیحات', description),
        ReportItemDataField('نوع ثبت', registrationTypeName),
      ], title: customerName);
}

extension MaterialDetailedIncomingListToReportItemDataListMapper
    on List<MaterialDetailedIncomingRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialIncomingRepByCarToReportItemDataMapper
    on MaterialIncomingRepByCar {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تعداد', serviceCount),
        ReportItemDataField('مقدار کل', meghdarKol),
      ], title: plateNumber);
}

extension MaterialIncomingRepByCarListToReportItemDataListMapper
    on List<MaterialIncomingRepByCar> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialIncomingRepByCustomerToReportItemDataMapper
    on MaterialIncomingRepByCustomer {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تعداد', serviceCount),
        ReportItemDataField('مقدار کل', meghdarKol),
      ], title: customerName);
}

extension MaterialIncomingRepByCustomerListToReportItemDataListMapper
    on List<MaterialIncomingRepByCustomer> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialIncomingRepByProductToReportItemDataMapper
    on MaterialIncomingRepByProduct {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تعداد', serviceCount),
        ReportItemDataField('مقدار کل', totalAmount),
      ], title: "$productName $productType");
}

extension MaterialIncomingRepByProductListToReportItemDataListMapper
    on List<MaterialIncomingRepByProduct> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

// final List<MaterialIncomingRepByCustomerAndProductProductItem> products;
extension MaterialIncomingRepByCustomerAndProductItemToReportItemDataMapper
    on MaterialIncomingRepByCustomerAndProductProductItem {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تعداد سروریس', serviceCount.toString()),
        ReportItemDataField('مقدار', weight.toStringAsFixed(3)),
      ], title: "$productName $productCode");
}

extension MaterialIncomingRepByCustomerAndProductItemListToReportItemDataListMapper
    on List<MaterialIncomingRepByCustomerAndProductProductItem> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialIncomingRepByCustomerAndProductToReportItemDataMapper
    on MaterialIncomingRepByCustomerAndProduct {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تعداد', productCount.toString()),
        ReportItemDataField('تعداد سروریس', totalServiceCount.toString()),
        ReportItemDataField('مقدار کل', totalProductWeight.toStringAsFixed(3)),
        ReportItemDataField('محصولات', products.length.toString(),
            list: products.toReportItemDataList())
      ], title: "$customerName $customerCode");
}

extension MaterialIncomingRepByCustomerAndProductListToReportItemDataListMapper
    on List<MaterialIncomingRepByCustomerAndProduct> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialMineDailyRepToReportItemDataMapper on MaterialMineDailyRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تعداد سروریس', serviceCount),
        ReportItemDataField('مقدار', meghdar),
        ReportItemDataField('مجموع لود', loadingTotalPrice),
        ReportItemDataField('جمع کرایه حمل', jamKerayeHaml),
        ReportItemDataField('جمع کل فاکتور', factorTotalPrice),
      ], title: date);
}

extension MaterialMineDailyRepListToReportItemDataListMapper
    on List<MaterialMineDailyRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialMineMonthlyRepToReportItemDataMapper
    on MaterialMineMonthlyRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تعداد سروریس', serviceCount),
        ReportItemDataField('مقدار', meghdar),
        ReportItemDataField('جمع کرایه کار', jamKerayeKar),
        ReportItemDataField('جمع مبلغ یارگیری', jamMablaghBargiri),
        ReportItemDataField('جمع کل فاکتور', factorTotalPrice),
      ], title: monthName);
}

extension MaterialMineMonthlyRepListToReportItemDataListMapper
    on List<MaterialMineMonthlyRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialMineTransportToSaleRatioRepToReportItemDataMapper
    on MaterialMineTransportToSaleRatioReport {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('مقدار فروش', saleAmount.toStringAsFixed(3)),
        ReportItemDataField(
            'مقدار ترنسپورت', transportAmount.toStringAsFixed(3)),
        ReportItemDataField('نسبت', ratio),
      ], title: "نسبت فروش به حمل");
}

extension MaterialMineTransportToSaleRatioRepListToReportItemDataListMapper
    on List<MaterialMineTransportToSaleRatioReport> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension MaterialMineMostCarrierRepToReportItemDataMapper
    on MaterialMineMostCarrierRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تعداد سرویس', serviceCount),
        ReportItemDataField('مقدار', meghdar),
        ReportItemDataField('جمع کرایه حمل', jamKerayeHaml),
      ], title: "$plateNumber $carCode");
}

extension MaterialMineMostCarrierRepListToReportItemDataListMapper
    on List<MaterialMineMostCarrierRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension CacheParamsMapper on CacheParamsResponse {
  CacheParams toDomain() => CacheParams(
        madan.toDomain(),
        anbar.toDomain(),
        goroohTafsili.toDomain(),
        markazHazineh.toDomain(),
        moin.toDomain(),
        customer.toDomain(),
        product.toDomain(),
        car.toDomain(),
        pomp.toDomain(),
        betonWorkType.toDomain(),
        betonSharayetMohiti.toDomain(),
      );
}

extension TafsiliResponseMapper on TafsiliResponse {
  Tafsili toDomain() => Tafsili(idTafsili, codTafsili, nameTafsili, idGoroTafsili, nameGoroTafsili, dbName);
}

extension CacheParamsValuebetonWorkTypeMapper
    on CacheParamValueBetonWorkTypeResponse {
  CacheParamValueBetonWorkType toDomain() =>
      CacheParamValueBetonWorkType(id, workType);
}

extension CacheParamsValuebetonWorkTypeListMapper
    on List<CacheParamValueBetonWorkTypeResponse>? {
  List<CacheParamValueBetonWorkType> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension CacheParamsValueSharayetMohitiBetonMapper
    on CacheParamValueShrayetMohitiBetonResponse {
  CacheParamValueShrayetMohitiBeton toDomain() =>
      CacheParamValueShrayetMohitiBeton(id, name, value.orEmpty());
}

extension CacheParamsValueSharayetMohitiBetonListMapper
    on List<CacheParamValueShrayetMohitiBetonResponse>? {
  List<CacheParamValueShrayetMohitiBeton> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension CacheParamsValueMadanMapper on CacheParamValueMadanResponse {
  CacheParamValueMadan toDomain() => CacheParamValueMadan(id, name);
}

extension CacheParamsValueMadanListMapper
    on List<CacheParamValueMadanResponse>? {
  List<CacheParamValueMadan> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension CacheParamsValueAnbarMapper on CacheParamValueAnbarResponse {
  CacheParamValueAnbar toDomain() => CacheParamValueAnbar(id, name);
}

extension CacheParamsValueAnbarListMapper
    on List<CacheParamValueAnbarResponse>? {
  List<CacheParamValueAnbar> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension CacheParamsValueCarListMapper on CacheParamValueCarListResponse {
  CacheParamValueCarList toDomain() => CacheParamValueCarList(
      carId,
      carCode,
      plateNumber,
      plateP1,
      plateP2,
      plateP3,
      plateP4,
      driverName,
      carOwner,
      carModelName);
}

extension CacheParamValueCarListListMapper
    on List<CacheParamValueCarListResponse>? {
  List<CacheParamValueCarList> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension CacheParamValueCustomersMapper on CacheParamValueCustomersResponse {
  CacheParamValueCustomers toDomain() => CacheParamValueCustomers(
      customerId, customerCode, customerName, customerTitle, categoryName);
}

extension CacheParamsValueCustomersListMapper
    on List<CacheParamValueCustomersResponse>? {
  List<CacheParamValueCustomers> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension CacheParamValueGoroohTafsiliMapper
    on CacheParamValueGoroohTafsiliResponse {
  CacheParamValueGoroohTafsili toDomain() =>
      CacheParamValueGoroohTafsili(id, name);
}

extension CacheParamsValueGoroohTafsiliListMapper
    on List<CacheParamValueGoroohTafsiliResponse>? {
  List<CacheParamValueGoroohTafsili> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension CacheParamValueMarkazHazinehMapper
    on CacheParamValueMarkazHazinehResponse {
  CacheParamValueMarkazHazineh toDomain() =>
      CacheParamValueMarkazHazineh(key, value, stringValue);
}

extension CacheParamsValueMarkazHazinehListMapper
    on List<CacheParamValueMarkazHazinehResponse>? {
  List<CacheParamValueMarkazHazineh> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension CacheParamValueProductsMapper on CacheParamValueProductsResponse {
  CacheParamValueProducts toDomain() =>
      CacheParamValueProducts(productId, productCode, productName, productUnit);
}

extension CacheParamsValueProductsListMapper
    on List<CacheParamValueProductsResponse>? {
  List<CacheParamValueProducts> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension CacheParamValuePompMapper on CacheParamValuePompResponse {
  CacheParamValuePomp toDomain() => CacheParamValuePomp(id, code, pompDriver);
}

extension CacheParamsValuePompListMapper on List<CacheParamValuePompResponse>? {
  List<CacheParamValuePomp> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension CacheParamValueMoinMapper on CacheParamValueMoinResponse {
  CacheParamValueMoin toDomain() =>
      CacheParamValueMoin(id, codeMali, nameHesab, codMaliKol, nameHesabKol);
}

extension CacheParamsValueMoinListMapper on List<CacheParamValueMoinResponse>? {
  List<CacheParamValueMoin> toDomain() =>
      this != null ? this!.map((e) => e.toDomain()).toList() : [];
}

extension GetHesabLockConditionsMapper
    on ManagementGetHesabLockConditionsResponse {
  GetHesabLockConditions toDomain() =>
      GetHesabLockConditions(lockDate, lockAutomatic, lockDayLength);
}

extension TreasuryDaryaftAndPardakhtRepMapper
    on TreasuryDaryaftAndPardakhtRepResponse {
  TreasuryDaryaftAndPardakhtRep toDomain() => TreasuryDaryaftAndPardakhtRep(
      date.orEmpty(),
      radif.orEmpty(),
      pardakhtKonande.orEmpty(),
      daryaftKonande.orEmpty(),
      mablagh.orEmpty(),
      noe.orEmpty(),
      serial.orEmpty(),
      description.orEmpty());
}

extension TreasuryDaryaftAndPardakhtRepListMapper
    on List<TreasuryDaryaftAndPardakhtRepResponse> {
  List<TreasuryDaryaftAndPardakhtRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension TreasuryDaryaftAndPardakhtBeTafkikHesabRepMapper
    on TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse {
  TreasuryDaryaftAndPardakhtBeTafkikHesabRep toDomain() =>
      TreasuryDaryaftAndPardakhtBeTafkikHesabRep(hesab, mablagh);
}

extension TreasuryDaryaftAndPardakhtBeTafkikHesabRepListMapper
    on List<TreasuryDaryaftAndPardakhtBeTafkikHesabRepResponse> {
  List<TreasuryDaryaftAndPardakhtBeTafkikHesabRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension TreasuryGoTajmiDaryaftAndPardakhtRepMapper
    on TreasuryGoTajmiDaryaftAndPardakhtRepResponse {
  TreasuryGoTajmiDaryaftAndPardakhtRep toDomain() =>
      TreasuryGoTajmiDaryaftAndPardakhtRep(naghdi, check, havale, kartKhan);
}

extension TreasuryGoTajmiDaryaftAndPardakhtRepListMapper
    on List<TreasuryGoTajmiDaryaftAndPardakhtRepResponse> {
  List<TreasuryGoTajmiDaryaftAndPardakhtRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension TreasuryDaryaftAndPardakhtRepToReportItemDataMapper
    on TreasuryDaryaftAndPardakhtRep {
  ReportItemData toReportItemDataPardakht() => ReportItemData(items: [
        ReportItemDataField('تاریخ', date),
        ReportItemDataField('سریال', serial),
        ReportItemDataField('ردیف', radif),
        ReportItemDataField('پرداخت کننده', pardakhtKonande),
        ReportItemDataField('دریافت کننده', daryaftKonande),
        ReportItemDataField('مبلغ', mablagh),
        ReportItemDataField('نوع پرداخت', noe),
        ReportItemDataField('توضیحات', description),
      ], title: pardakhtKonande);

  ReportItemData toReportItemDataDaryaft() => ReportItemData(items: [
    ReportItemDataField('تاریخ', date),
    ReportItemDataField('سریال', serial),
    ReportItemDataField('ردیف', radif),
    ReportItemDataField('پرداخت کننده', pardakhtKonande),
    ReportItemDataField('دریافت کننده', daryaftKonande),
    ReportItemDataField('مبلغ', mablagh),
    ReportItemDataField('نوع پرداخت', noe),
    ReportItemDataField('توضیحات', description),
  ], title: daryaftKonande);
}

extension TreasuryDaryaftAndPardakhtRepToReportItemDataListMapper
    on List<TreasuryDaryaftAndPardakhtRep> {
  List<ReportItemData> toReportItemDataListPardakht() =>
      map((e) => e.toReportItemDataPardakht()).toList();

  List<ReportItemData> toReportItemDataListDaryaft() =>
      map((e) => e.toReportItemDataDaryaft()).toList();
}

extension TreasuryDaryaftAndPardakhtBeTafkikHesabRepToReportItemDataMapper
    on TreasuryDaryaftAndPardakhtBeTafkikHesabRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('مبلغ', mablagh),
      ], title: hesab);
}

extension TreasuryDaryaftAndPardakhtBeTafkikHesabRepToReportItemDataListMapper
    on List<TreasuryDaryaftAndPardakhtBeTafkikHesabRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension TreasuryGoTajmiDaryaftAndPardakhtRepToReportItemDataMapper
    on TreasuryGoTajmiDaryaftAndPardakhtRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('نقدی', naghdi),
        ReportItemDataField('چک', check),
        ReportItemDataField('حواله', havale),
        ReportItemDataField('کارت خوان', kartKhan),
      ], title: "");
}

extension TreasuryGoTajmiDaryaftAndPardakhtRepToReportItemDataListMapper
    on List<TreasuryGoTajmiDaryaftAndPardakhtRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension ConcreteOrdersInDayRepMapper on ConcreteOrdersInDayRepResponse {
  ConcreteOrdersInDayRep toDomain() => ConcreteOrdersInDayRep(
      id,
      date,
      time,
      customerId,
      customerName,
      address,
      pompId,
      pompCode,
      pompDriver,
      meghdar,
      meghdarBargashti,
      tolerance,
      meghdarErsali,
      meghdarMande,
      productCode,
      productName,
      controlType,
      controlTypeName,
      processStatusName,
      workTypeName,
      workStatusName,
      workStatusDescription,
      workStatus,
      processStatus,
      finalStatusOrder);
}

extension ConcreteOrdersInDayRepListMapper
    on List<ConcreteOrdersInDayRepResponse> {
  List<ConcreteOrdersInDayRep> toDomain() => map((e) => e.toDomain()).toList();
}

extension ConcreteOrdersInDayRepToReportItemDataMapper
    on ConcreteOrdersInDayRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('شماره سفارش', id.toString()),
        ReportItemDataField('تاریخ', date),
        ReportItemDataField('زمان', time),
        ReportItemDataField('نوع بتن', productName),
        ReportItemDataField('مقدار', meghdar.toStringAsFixed(3)),
        ReportItemDataField('مقدار برگشتی', meghdarBargashti.toStringAsFixed(3)),
        ReportItemDataField('مقدار ارسالی', meghdarErsali.toStringAsFixed(3)),
        ReportItemDataField('مقدار مانده', meghdarMande.toStringAsFixed(3)),
        ReportItemDataField('تلرانس', tolerance),
        ReportItemDataField('نام کار', workTypeName),
        ReportItemDataField('توضیحات وضعیت کار', workStatusDescription),
        ReportItemDataField('وضعیت کار', "$workStatus $workStatusName"),
        ReportItemDataField('راننده پمپ', pompDriver),
        ReportItemDataField('وضعیت', "$processStatusName $processStatus"),
        ReportItemDataField('آدرس', address),
        ReportItemDataField('وضعیت نهایی سفارش', finalStatusOrder),
        ReportItemDataField(
            'نوع کنترل', "${controlType.toString()} $controlTypeName"),
      ], title: customerName);
}

extension ConcreteOrdersInDayRepListToReportItemDataListMapper
    on List<ConcreteOrdersInDayRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension ConcreteSaleDetailedRepMapper on ConcreteSaleDetailedRepResponse {
  ConcreteSaleDetailedRep toDomain() => ConcreteSaleDetailedRep(
      date,
      shomareGhabz,
      time,
      customerCode,
      customerName,
      productCode,
      productName,
      ayar,
      totalWeight,
      pureWeight,
      ersali,
      daryafti,
      meghdar,
      mablaghJoz,
      productPrice,
      driverName,
      plateNumber,
      pompOperator,
      pompType,
      anbar,
      address,
      workType);
}

extension ConcreteSaleDetailedRepListMapper
    on List<ConcreteSaleDetailedRepResponse> {
  List<ConcreteSaleDetailedRep> toDomain() => map((e) => e.toDomain()).toList();
}

extension ConcreteSaleDetailedRepToReportItemDataMapper
    on ConcreteSaleDetailedRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تاریخ و ساعت', "$time $date"),
        ReportItemDataField('شماره قبض', customerName),
        ReportItemDataField('نوع بتن', productName),
        ReportItemDataField('عیار', ayar),
        ReportItemDataField('وزن کل', totalWeight.toString()),
        ReportItemDataField('وزن خالی', pureWeight.toString()),
        ReportItemDataField('ارسالی', ersali),
        ReportItemDataField('دریافتی', daryafti),
        ReportItemDataField('مقدار', meghdar),
        ReportItemDataField('مبلغ جزء', mablaghJoz),
        ReportItemDataField('قیمت محصول', productPrice),
        ReportItemDataField('راننده', driverName),
        ReportItemDataField('شماره پلاک', plateNumber),
        ReportItemDataField('اوپراتور پمپ', pompOperator),
        ReportItemDataField('نوع پمپ', pompType),
        ReportItemDataField('انبار', anbar),
        ReportItemDataField('آدرس', address),
        ReportItemDataField('نوع کار', workType),
      ], title: customerName);
}

extension ConcreteSaleDetailedRepListToReportItemDataListMapper
    on List<ConcreteSaleDetailedRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension ConcreteReportByCustomerAndProductMapper
    on ConcreteReportByCustomerAndProductResponse {
  ConcreteReportByCustomerAndProduct toDomain() =>
      ConcreteReportByCustomerAndProduct(
          customerCode,
          customerName,
          productCode,
          productName,
          pureWeight,
          serviceCount,
          mablaghJoz,
          unitPrice,
          totalPrice,
          keraye);
}

extension ConcreteReportByCustomerAndProductListMapper
    on List<ConcreteReportByCustomerAndProductResponse> {
  List<ConcreteReportByCustomerAndProduct> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension ConcreteReportByCustomerAndProductToReportItemDataMapper
    on ConcreteReportByCustomerAndProduct {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('کد مشتری', customerCode.orEmpty()),
        ReportItemDataField('مشتری', customerName.orEmpty()),
        ReportItemDataField('کد محصول', productCode.orEmpty()),
        ReportItemDataField('نام محصول', productName.orEmpty()),
        ReportItemDataField('وزن خالی', pureWeight.toString()),
        ReportItemDataField('تعداد سرویس', serviceCount.orEmpty()),
        ReportItemDataField('مبلغ جزء', mablaghJoz.orEmpty()),
        ReportItemDataField('مبلغ کل', totalPrice.toString()),
        ReportItemDataField('قیمت واحد', unitPrice.toString()),
        ReportItemDataField('تعداد سرویس', serviceCount.orEmpty()),
        ReportItemDataField('کل', keraye.orEmpty()),
      ], title: "$customerName  $productName");
}

extension ConcreteReportByCustomerAndProductListToReportItemDataListMapper
    on List<ConcreteReportByCustomerAndProduct> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension ConcreteSalesByProductRepMapper on ConcreteSalesByProductRepResponse {
  ConcreteSalesByProductRep toDomain() => ConcreteSalesByProductRep(productName,
      productCode, meghdar, serviceCount, unitPrice ?? 0, salePrice ?? 0);
}

extension ConcreteSalesByProductRepListMapper
    on List<ConcreteSalesByProductRepResponse> {
  List<ConcreteSalesByProductRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension ConcreteSalesByProductRepToReportItemDataMapper
    on ConcreteSalesByProductRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('کد محصول', productCode),
        ReportItemDataField('نام محصول', productName),
        ReportItemDataField('مقدار', meghdar.toString()),
        ReportItemDataField('تعداد سرویس', serviceCount),
        ReportItemDataField('مبلغ فروش', doubleFormatter(salePrice)),
        ReportItemDataField('قیمت واحد', doubleFormatter(unitPrice)),
        ReportItemDataField('تعداد سرویس', serviceCount),
      ], title: productName);
}

extension ConcreteSalesByProductRepListToReportItemDataListMapper
    on List<ConcreteSalesByProductRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension ConcreteSalesDailyTotaledRepMapper
    on ConcreteSalesDailyTotaledRepResponse {
  ConcreteSalesDailyTotaledRep toDomain() =>
      ConcreteSalesDailyTotaledRep(date, serviceCount, meghdar, totalPrice);
}

extension ConcreteSalesDailyTotaledRepListMapper
    on List<ConcreteSalesDailyTotaledRepResponse> {
  List<ConcreteSalesDailyTotaledRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension ConcreteSalesDailyTotaledRepToReportItemDataMapper
    on ConcreteSalesDailyTotaledRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تاریخ', date),
        ReportItemDataField('تعداد سرویس', serviceCount),
        ReportItemDataField('مقدار', meghdar.toString()),
        ReportItemDataField('مبلغ کل', totalPrice.toString()),
      ], title: date);
}

extension ConcreteSalesDailyTotaledRepToReportItemDataListMapper
    on List<ConcreteSalesDailyTotaledRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension ConcreteMixerDailyCumulativeRepMapper
    on ConcreteMixerDailyCumulativeRepResponse {
  ConcreteMixerDailyCumulativeRep toDomain() => ConcreteMixerDailyCumulativeRep(
      date, driver, plateNumber, carId, serviceCount, hamlShode, meghdarBeton);
}

extension ConcreteMixerDailyCumulativeRepListMapper
    on List<ConcreteMixerDailyCumulativeRepResponse> {
  List<ConcreteMixerDailyCumulativeRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension ConcreteMixerDailyCumulativeRepToReportItemDataMapper
    on ConcreteMixerDailyCumulativeRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تاریخ', date),
        ReportItemDataField('راننده', driver),
        ReportItemDataField('پلاک', plateNumber),
        ReportItemDataField('شماره خودرو', carId.toString()),
        ReportItemDataField('تعداد سرویس', serviceCount),
        ReportItemDataField('حمل شده', hamlShode.toString()),
        ReportItemDataField('مقدار بتن', meghdarBeton.toString()),
      ], title: date);
}

extension ConcreteMixerDailyCumulativeRepToReportItemDataListMapper
    on List<ConcreteMixerDailyCumulativeRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension ConcreteMixerDriverDetailedRepMapper
    on ConcreteMixerDriverDetailedRepResponse {
  ConcreteMixerDriverDetailedRep toDomain() => ConcreteMixerDriverDetailedRep(
      date,
      time,
      shomareGhabz,
      customerCode,
      customerName,
      driverId,
      driverName,
      hamlShode,
      mixerReward,
      mixerTotalReward);
}

extension ConcreteMixerDriverDetailedRepListMapper
    on List<ConcreteMixerDriverDetailedRepResponse> {
  List<ConcreteMixerDriverDetailedRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension ConcreteMixerDriverDetailedRepToReportItemDataMapper
    on ConcreteMixerDriverDetailedRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تاریخ و ساعت', "$time $date"),
        ReportItemDataField('شماره قبض', shomareGhabz.toString()),
        ReportItemDataField('شماره خودرو', driverId.toString()),
        ReportItemDataField('راننده', driverName),
        ReportItemDataField('حمل شده', hamlShode.toString()),
        ReportItemDataField('انعام میکسر', mixerReward.toString()),
        ReportItemDataField('انعام مجموع میکسر', mixerTotalReward.toString()),
      ], title: customerName);
}

extension ConcreteMixerDriverDetailedRepToReportItemDataListMapper
    on List<ConcreteMixerDriverDetailedRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension ConcretePompKarkardPompRepMapper
    on ConcretePompKarkardPompRepResponse {
  ConcretePompKarkardPompRep toDomain() => ConcretePompKarkardPompRep(
      date, codePomp, namePomp, tedadIstgah, jamPompazh, tedadMixer);
}

extension ConcretePompKarkardPompRepListMapper
    on List<ConcretePompKarkardPompRepResponse> {
  List<ConcretePompKarkardPompRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension ConcretePompKarkardPompRepToReportItemDataMapper
    on ConcretePompKarkardPompRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تاریخ', date),
        ReportItemDataField('تعداد ایستگاه', tedadIstgah.toString()),
        ReportItemDataField('جمع پمپاژ', jamPompazh.toString()),
        ReportItemDataField('تعداد میکسر', tedadMixer.toString()),
      ], title: "$codePomp $namePomp");
}

extension ConcretePompKarkardPompRepToReportItemDataListMapper
    on List<ConcretePompKarkardPompRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension FinancialBedBesRepMapper on FinancialBedBesResponse {
  FinancialBedBesRep toDomain() => FinancialBedBesRep(
        details != null ? details!.toDomain() : [],
        totalMandeBedStr,
        totalMandeBesStr,
        totalMandeBed,
        totalMandeBes,
      );
}

extension FinancialBedBesDetailRepMapper on FinancialBedBesRepResponseDetail {
  FinancialBedBesRepDetail toDomain() => FinancialBedBesRepDetail(
      codHesab,
      nameHesab,
      title2,
      mabBedStr,
      mabBed,
      mabBesStr,
      mabBes,
      mandeBed,
      mandeBedStr,
      mandeBes,
      mandeBesStr,
      mobile1,
      mobile2,
      address);
}

extension FinancialBedBesDetailRepListMapper
    on List<FinancialBedBesRepResponseDetail> {
  List<FinancialBedBesRepDetail> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension FinancialBedBesRepToReportItemDataMapper on FinancialBedBesRep {
  List<ReportItemData> toReportItemData() {
    final List<ReportItemData> list = [];

    list.add(ReportItemData(items: [
      ReportItemDataField('مجموع مانده بدهکار', totalMandeBedStr),
      ReportItemDataField('مجموع مانده بستانکار', totalMandeBesStr),
    ], title: ""));

    list.addAll(details.toReportItemDataList());
    return list;
  }
}

extension FinancialBedBesDetailRepToReportItemDataMapper
    on FinancialBedBesRepDetail {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('مبلغ بدهکار', mabBed.toString()),
        ReportItemDataField('مبلغ بستانکار', mabBes.toString()),
        ReportItemDataField('مانده بدهکار', mandeBed.toString()),
        ReportItemDataField('مانده بستانکار', mandeBes.toString()),
        ReportItemDataField('موبایل', mobile1.toString()),
        ReportItemDataField('موبایل', mobile2.toString()),
        ReportItemDataField('آدرس', address.toString()),
      ], title: "$codHesab $nameHesab");
}

extension FinancialBedBesRepToReportItemDataListMapper
    on List<FinancialBedBesRepDetail> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension FinancialGozareshHesabRepMapper on FinancialGozareshHesabRepResponse {
  FinancialGozareshHesabRep toDomain() => FinancialGozareshHesabRep(date,
      noeBarge, strNoeBarge, shBarge, description, bed, bes, mandeh, tashkhis);
}

extension FinancialGozareshHesabRepListMapper
    on List<FinancialGozareshHesabRepResponse> {
  List<FinancialGozareshHesabRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension FinancialGozareshHesabRepToReportItemDataMapper
    on FinancialGozareshHesabRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('تاریخ', date),
        ReportItemDataField('نوع برگه', noeBarge),
        ReportItemDataField('شماره برگه', shBarge),
        ReportItemDataField('بدهکار', bed),
        ReportItemDataField('بستانکار', bes),
        ReportItemDataField('مانده', mandeh),
        ReportItemDataField('تشخیص', tashkhis),
        ReportItemDataField('توضیحات', description),
      ], title: "");
}

extension FinancialGozareshHesabRepToReportItemDataListMapper
    on List<FinancialGozareshHesabRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension PlateReaderDailyTotaledRepMapper
    on PlateReaderDailyTotaledAndTotaledRepRepResponse {
  PlateReaderDailyTotaledAndTotaledRep toDomain() =>
      PlateReaderDailyTotaledAndTotaledRep(rowNum, p1, p2, p3, p4, plateStr,
          instanceId, instanceName, readDate.orEmpty(), trafficCount, totalRec);
}

extension PlateReaderDailyTotaledRepListMapper
    on List<PlateReaderDailyTotaledAndTotaledRepRepResponse> {
  List<PlateReaderDailyTotaledAndTotaledRep> toDomain() =>
      map((e) => e.toDomain()).toList();
}

extension PlateReaderDailyTotaledRepToReportItemDataMapper
    on PlateReaderDailyTotaledAndTotaledRep {
  ReportItemData toReportItemData() => ReportItemData(items: [
        ReportItemDataField('دوربین', "$instanceName $instanceId"),
        ReportItemDataField('تاریخ', readDate),
        ReportItemDataField('تعداد تردد', "$trafficCount"),
      ], title: plateStr);

  ReportItemData toReportItemDataTotaled() => ReportItemData(items: [
        ReportItemDataField('دوربین', "$instanceName $instanceId"),
        ReportItemDataField('تعداد تردد', "$trafficCount"),
      ], title: plateStr);
}

extension PlateReaderDailyTotaledRepToReportItemDataListMapper
    on List<PlateReaderDailyTotaledAndTotaledRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();

  List<ReportItemData> toReportItemDataListTotaled() =>
      map((e) => e.toReportItemDataTotaled()).toList();
}

extension PlateReaderDetailedRepRepMapper on PlateReaderDetailedRepResponse {
  PlateReaderDetailedRep toDomain() => PlateReaderDetailedRep(
      rowNum,
      p1,
      p2,
      p3,
      p4,
      plateStr,
      instanceId,
      instanceName,
      readDate,
      totalRec,
      codedPlateNumber,
      confidence,
      confidenceStr,
      carImageAddress,
      carImageLink,
      plateImageAddress,
      plateImageLink,
      loadImageAddress,
      loadImageLink,
      direction,
      liveWeight,
      isReserved,
      isReservedStr,
      isValid,
      isValidStr,
      hasCarImage,
      hasPlateImage,
      hasLoadImage,
      readTime);
}

extension PlateReaderDetailedRepListMapper
    on List<PlateReaderDetailedRepResponse> {
  List<PlateReaderDetailedRep> toDomain() => map((e) => e.toDomain()).toList();
}

extension PlateReaderDetailedRepToReportItemDataMapper
    on PlateReaderDetailedRep {
  ReportItemData toReportItemData() => ReportItemData(
      imageUrl: carImageLink,
      imageUrl2: plateImageLink,
      items: [
        ReportItemDataField('دوربین', "$instanceName $instanceId"),
        ReportItemDataField('تاریخ', readDate),
      ], title: plateStr);
}

extension PlateReaderDetailedRepToReportItemDataListMapper
    on List<PlateReaderDetailedRep> {
  List<ReportItemData> toReportItemDataList() =>
      map((e) => e.toReportItemData()).toList();
}

extension PlateReaderInstanceListMapper on PlateReaderInstanceListResponse {
  PlateReaderInstanceList toDomain() => PlateReaderInstanceList(
      instanceId,
      sendPlateDelaySeconds,
      serviceBusAddress,
      videoPath,
      aiFilePath,
      description,
      showBasculeWeight,
      confidenceLimit);
}

extension PlateReaderInstanceListListMapper
    on List<PlateReaderInstanceListResponse> {
  List<PlateReaderInstanceList> toDomain() => map((e) => e.toDomain()).toList();
}
