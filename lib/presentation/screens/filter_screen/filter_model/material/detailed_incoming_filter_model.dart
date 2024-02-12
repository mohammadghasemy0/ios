import 'package:kiano/domain/model/model.dart';

import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class DetailedIncomingFilterModel extends FilterModel<MaterialDetailedIncomingRepRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  DetailedIncomingFilterModel(String title): super(title) {
    _items = {
      'date': FromToDateFilterField(),
      'customerId': SelectableItemsFilterField(
          title: 'فروشنده',
          items: cacheParams.data.customer.fold<Map<String, dynamic>>(
              {},
                  (previousValue, element) => {
                ...previousValue,
                "${element.customerName} ${element.customerCode}":
                element.customerId
              }),
          selectedItems: {},
          multiSelect: false),
      'costCenterId': SelectableItemsFilterField(
          title: 'مرکز هزینه',
          items: cacheParams.data.markazHazineh.fold<Map<String, dynamic>>(
              {},
                  (previousValue, element) =>
              {...previousValue, element.key: element.value}),
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
  MaterialDetailedIncomingRepRequest getRequest() {
    return MaterialDetailedIncomingRepRequest(
        (_items['date'] as FromToDateFilterField).value.start.toString(),
        (_items['date'] as FromToDateFilterField).value.end.toString(),
        cacheParams.currentFiscalYearLoginData!.dbName,
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
        (_items['costCenterId'] as SelectableItemsFilterField)
            .value
            .values
            .toList()
            .isNotEmpty
            ? (_items['costCenterId'] as SelectableItemsFilterField)
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
        (_items['productIds'] as SelectableItemsFilterField)
            .value
            .values
            .toList().map((e) => e as int).toList());
  }

  @override
  bool validation() {
    return true;
  }

  @override
  DetailedIncomingFilterModel clone() {
    final template = DetailedIncomingFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'customerId':
      (items['customerId']! as SelectableItemsFilterField).copyWith(),
      'costCenterId':
      (items['costCenterId']! as SelectableItemsFilterField).copyWith(),
      'carId': (items['carId']! as SelectableItemsFilterField).copyWith(),
      'productIds':
      (items['productIds']! as SelectableItemsFilterField).copyWith(),
    };
    return template;
  }
}
