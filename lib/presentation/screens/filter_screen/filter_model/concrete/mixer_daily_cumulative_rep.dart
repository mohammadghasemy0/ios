import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class ConcreteMixerDailyCumulativeFilterModel
    extends FilterModel<ConcreteMixerDailyCumulativeRepRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  ConcreteMixerDailyCumulativeFilterModel(String title): super(title) {
    _items = {
      'date': FromToDateFilterField(),
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
      // 'driverName': SelectableItemsFilterField(
      //     title: 'راننده',
      //     items: cacheParams.data.car.fold<Map<String, dynamic>>(
      //         {},
      //         (previousValue, element) =>
      //             {...previousValue, element.driverName: element.carId}),
      //     selectedItems: {},
      //     multiSelect: false),
    };
  }

  @override
  ConcreteMixerDailyCumulativeRepRequest getRequest() {
    return ConcreteMixerDailyCumulativeRepRequest(
      (_items['date'] as FromToDateFilterField).value.start.toString(),
      (_items['date'] as FromToDateFilterField).value.end.toString(),
      (_items['carId'] as SelectableItemsFilterField)
              .value
              .values
              .toList()
              .isNotEmpty
          ? (_items['carId'] as SelectableItemsFilterField)
              .value
              .values
              .toList()[0]
          : 0,
      // (_items['driverName'] as SelectableItemsFilterField)
      //         .value
      //         .values
      //         .toList()
      //         .isNotEmpty
      //     ? (_items['driverName'] as SelectableItemsFilterField)
      //         .value
      //         .values
      //         .toList()[0].toString()
      //     :
      "",
      cacheParams.currentFiscalYearLoginData!.dbName,
    );
  }

  @override
  bool validation() {
    return true;
  }

  @override
  ConcreteMixerDailyCumulativeFilterModel clone() {
    final template = ConcreteMixerDailyCumulativeFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'carId': (items['carId']! as SelectableItemsFilterField).copyWith(),
      // 'driverName':
      //     (items['driverName']! as SelectableItemsFilterField).copyWith(),
    };
    return template;
  }
}
