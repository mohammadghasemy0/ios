import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class MostCarrierRepFilterModel extends FilterModel<MaterialMostCarrierRepRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  MostCarrierRepFilterModel(String title): super(title) {
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
    };
  }
  // String persianFromStrDate,   String persianToStrDate,   String dbName,   int costCenterId
  @override
  MaterialMostCarrierRepRequest getRequest() {
    return MaterialMostCarrierRepRequest(
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
        );
  }

  @override
  bool validation() {
    return true;
  }

  @override
  MostCarrierRepFilterModel clone() {
    final template = MostCarrierRepFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'costCenterId':
      (items['costCenterId']! as SelectableItemsFilterField).copyWith(),
    };
    return template;
  }
}
