import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class ConcreteRepByProductFilterModel extends FilterModel<ConcreteSalesByProductRepRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  ConcreteRepByProductFilterModel(String title) : super(title) {
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
    };
  }

  @override
  ConcreteSalesByProductRepRequest getRequest() {
    return ConcreteSalesByProductRepRequest(
        (_items['date'] as FromToDateFilterField).value.start.toString(),
        (_items['date'] as FromToDateFilterField).value.end.toString(),
      (_items['productIds'] as SelectableItemsFilterField)
          .value
          .values
          .toList().map((e) => e as int).toList(),
        cacheParams.currentFiscalYearLoginData!.dbName,
        );
  }

  @override
  bool validation() {
    return true;
  }

  @override
  ConcreteRepByProductFilterModel clone() {
    final template = ConcreteRepByProductFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'productIds':
      (items['productIds']! as SelectableItemsFilterField).copyWith(),
    };
    return template;
  }
}
