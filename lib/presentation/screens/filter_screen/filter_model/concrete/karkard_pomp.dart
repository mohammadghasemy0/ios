import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class ConcretePompKarkardPompRepFilterModel extends FilterModel<ConcretePompKarkardPompRepRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  ConcretePompKarkardPompRepFilterModel(String title): super(title) {
    _items = {
      'date': FromToDateFilterField(),
      'pompId': SelectableItemsFilterField(
          title: 'پمپ',
          items: cacheParams.data.pomp.fold<Map<String, dynamic>>(
              {},
                  (previousValue, element) => {
                ...previousValue,
                "${element.pompDriver} ${element.code}":
                element.id
              }),
          selectedItems: {},
          multiSelect: false),
    };
  }

  @override
  ConcretePompKarkardPompRepRequest getRequest() {
    return ConcretePompKarkardPompRepRequest(
        (_items['date'] as FromToDateFilterField).value.start.toString(),
        (_items['date'] as FromToDateFilterField).value.end.toString(),
      (_items['pompId'] as SelectableItemsFilterField)
          .value
          .values
          .toList().isNotEmpty ? (_items['pompId'] as SelectableItemsFilterField)
          .value
          .values
          .toList()[0] : 0,
      cacheParams.currentFiscalYearLoginData!.dbName,);
  }

  @override
  bool validation() {
    return true;
  }

  @override
  ConcretePompKarkardPompRepFilterModel clone() {
    final template = ConcretePompKarkardPompRepFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'pompId': (items['pompId']! as SelectableItemsFilterField).copyWith(),
    };
    return template;
  }
}
