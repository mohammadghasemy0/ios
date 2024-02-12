import '/app/persian_date_time.dart';
import '/domain/model/model.dart';
import '/presentation/screens/filter_screen/filter_field/check_box/check_box_filter_field.dart';
import '/presentation/screens/filter_screen/filter_field/date_time/date_time_filter_field.dart';
import '/presentation/screens/filter_screen/filter_field/plate_text_field/plate_filter_field.dart';
import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class PlateReaderTotaledRepFilterModel
    extends FilterModel<PlateReaderDetailedAndDailyTotaledRepRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  PlateReaderTotaledRepFilterModel(String title): super(title) {

    _items = {
      'fromDate': DateTimeFilterField(value: PersianDateTime.now().copyWith(hour: 0, minute: 0)),
      'toDate': DateTimeFilterField(value: PersianDateTime.now().copyWith(hour: 23, minute: 59)),
      'plate': PlateFilterField(value: CarPlate(0, "", 0, 0)),
      'instanceId': SelectableItemsFilterField(
          title: 'دوربین',
          items: cacheParams.plateReaderInstanceList.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    "${element.description} ${element.instanceId}":
                        element.instanceId
                  }),
          selectedItems: {},
          multiSelect: false),
      'reserved': CheckBoxFilterField(title: "رزرو شده"),
    };
  }

  @override
  PlateReaderDetailedAndDailyTotaledRepRequest getRequest() {
    return PlateReaderDetailedAndDailyTotaledRepRequest(
        (_items["fromDate"] as DateTimeFilterField)
            .value
            .toDateTime()
            .toIso8601String(),
        (_items["toDate"] as DateTimeFilterField).value.toDateTime().toIso8601String(),
        (_items["plate"] as PlateFilterField).value.p1,
        (_items["plate"] as PlateFilterField).value.p2,
        (_items["plate"] as PlateFilterField).value.p3,
        (_items["plate"] as PlateFilterField).value.p4,
        (_items["instanceId"] as SelectableItemsFilterField)
                .value
                .values
                .toList()
                .isNotEmpty
            ? (_items["instanceId"] as SelectableItemsFilterField)
                .value
                .values
                .toList()[0]
            : 1,
        (_items["reserved"] as CheckBoxFilterField).value,
        0,
        0);
  }

  @override
  bool validation() {
    return true;
  }

  @override
  PlateReaderTotaledRepFilterModel clone() {
    final template = PlateReaderTotaledRepFilterModel(title);
    template.items = {
      'fromDate': (items['fromDate']! as DateTimeFilterField).copyWith(),
      'toDate': (items['toDate']! as DateTimeFilterField).copyWith(),
      'instanceId':
          (items['instanceId']! as SelectableItemsFilterField).copyWith(),
      'reserved': (items['reserved']! as CheckBoxFilterField).copyWith(),
      'plate': (items['plate']! as PlateFilterField).copyWith(),
    };
    return template;
  }
}
