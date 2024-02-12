import '/presentation/screens/filter_screen/filter_field/check_box/check_box_filter_field.dart';
import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class ConcreteSaleDetailedFilterModel extends FilterModel<ConcreteSaleDetailedRepRequest> {
  final cacheParams = instance<CacheParamsManager>();
  late Map<String, FilterField> _items;
  @override
  Map<String, FilterField> get items => _items;
  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;
  ConcreteSaleDetailedFilterModel(String title): super(title) {
    _items = {
      'date': FromToDateFilterField(),
      'customerId': SelectableItemsFilterField(
          title: 'مشتری',
          items: cacheParams.data.customer.fold<Map<String, dynamic>>(
              {},
                  (previousValue, element) => {
                ...previousValue,
                "${element.customerName} ${element.customerCode}":
                element.customerId
              }),
          selectedItems: {},
          multiSelect: false),
      'carId': SelectableItemsFilterField(
          title: 'خودرو',
          items: cacheParams.data.car.fold<Map<String, dynamic>>(
              {},
                  (previousValue, element) => {
                ...previousValue,
                "${element.carCode} ${element.carModelName} + ${element.carOwner}":
                element.carId
              }),
          selectedItems: {},
          multiSelect: false),
      'driverName': SelectableItemsFilterField(
          title: 'راننده',
          items: cacheParams.data.car.fold<Map<String, dynamic>>(
              {},
                  (previousValue, element) =>
              {...previousValue, element.driverName: element.carId}),
          selectedItems: {},
          multiSelect: false),
      'productIds': SelectableItemsFilterField(
          title: 'محصولات',
          items: cacheParams.data.product.fold<Map<String, dynamic>>(
              {},
                  (previousValue, element) => {
                ...previousValue,
                "${element.productName} ${element.productCode}":
                element.productId
              }),
          selectedItems: {},
          multiSelect: true),
    };
  }

  @override
  ConcreteSaleDetailedRepRequest getRequest() {
    return ConcreteSaleDetailedRepRequest(
        (_items['date'] as FromToDateFilterField).value.start.toString(),
        (_items['date'] as FromToDateFilterField).value.end.toString(),
        (_items['productIds'] as SelectableItemsFilterField)
            .value
            .values
            .toList().map((e) => e as int).toList(),
        (_items['customerId'] as SelectableItemsFilterField)
            .value
            .values
            .toList()
            .isNotEmpty
            ? (_items['customerId'] as SelectableItemsFilterField)
            .value
            .values
            .toList()[0]
            : 0,
        (_items['carId'] as SelectableItemsFilterField)
            .value
            .values
            .toList().isNotEmpty ? (_items['carId'] as SelectableItemsFilterField)
            .value
            .values
            .toList()[0] : 0,
        (_items['driverName'] as SelectableItemsFilterField)
            .value
            .values
            .toList().isNotEmpty ? (_items['driverName'] as SelectableItemsFilterField)
            .value
            .values
            .toList()[0] : "",
    cacheParams.currentFiscalYearLoginData!.dbName);
  }

  @override
  bool validation() {
    return true;
  }

  @override
  ConcreteSaleDetailedFilterModel clone() {
    final template = ConcreteSaleDetailedFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'customerId':
      (items['customerId']! as SelectableItemsFilterField).copyWith(),
      'carId': (items['carId']! as SelectableItemsFilterField).copyWith(),
      'driverName':
      (items['driverName']! as SelectableItemsFilterField).copyWith(),
      'productIds':
      (items['productIds']! as SelectableItemsFilterField).copyWith(),
    };
    return template;
  }
}
