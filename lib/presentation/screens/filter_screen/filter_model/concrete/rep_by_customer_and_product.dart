import '/presentation/screens/filter_screen/filter_field/check_box/check_box_filter_field.dart';
import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class ConcreteRepByCustomerAndProductFilterModel extends FilterModel<ConcreteReportByCustomerAndProductRequest> {
  final cacheParams = instance<CacheParamsManager>();
  late Map<String, FilterField> _items;
  @override
  Map<String, FilterField> get items => _items;
  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;
  ConcreteRepByCustomerAndProductFilterModel(String title): super(title) {
    _items = {
      'date': FromToDateFilterField(),
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
    };
  }


  @override
  ConcreteReportByCustomerAndProductRequest getRequest() {
    return ConcreteReportByCustomerAndProductRequest(
        (_items['date'] as FromToDateFilterField).value.start.toString(),
        (_items['date'] as FromToDateFilterField).value.end.toString(),
      _items['productIds'] != null ? (_items['productIds'] as SelectableItemsFilterField)
            .value
            .values
            .toList().map((e) => e as int).toList() : [],
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
      cacheParams.currentFiscalYearLoginData!.dbName,
    );
  }

  @override
  bool validation() {
    return true;
  }

  @override
  ConcreteRepByCustomerAndProductFilterModel clone() {
    final template = ConcreteRepByCustomerAndProductFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'customerId':
      (items['customerId']! as SelectableItemsFilterField).copyWith(),
      'productIds':
      (items['productIds']! as SelectableItemsFilterField).copyWith(),
    };
    return template;
  }
}
