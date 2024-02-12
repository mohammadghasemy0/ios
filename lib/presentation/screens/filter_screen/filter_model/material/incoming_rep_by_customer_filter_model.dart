import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class IncomingRepByCustomerFilterModel extends FilterModel<MaterialIncomingRepByCustomerRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  IncomingRepByCustomerFilterModel(String title): super(title) {
    _items = {
      'date': FromToDateFilterField(),
      'costCenterId': SelectableItemsFilterField(
          title: 'مرکز هزینه',
          items: cacheParams.data.markazHazineh.fold<Map<String, dynamic>>(
              {},
                  (previousValue, element) =>
              {...previousValue, element.key: element.value}),
          selectedItems: {},
          multiSelect: false),
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
    };
  }

  @override
  MaterialIncomingRepByCustomerRequest getRequest() {
    return MaterialIncomingRepByCustomerRequest(
        (_items['date'] as FromToDateFilterField).value.start.toString(),
        (_items['date'] as FromToDateFilterField).value.end.toString(),
        cacheParams.currentFiscalYearLoginData!.dbName,
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
        );
  }

  @override
  bool validation() {
    return true;
  }

  @override
  IncomingRepByCustomerFilterModel clone() {
    final template = IncomingRepByCustomerFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'customerId':
      (items['customerId']! as SelectableItemsFilterField).copyWith(),
      'costCenterId':
      (items['costCenterId']! as SelectableItemsFilterField).copyWith(),
    };
    return template;
  }
}
