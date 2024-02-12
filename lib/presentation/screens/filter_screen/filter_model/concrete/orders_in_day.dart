import '/presentation/screens/filter_screen/filter_field/check_box/check_box_filter_field.dart';
import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class ConcreteOrdersInDayFilterModel
    extends FilterModel<ConcreteOrdersInDayRepRequest> {
  final cacheParams = instance<CacheParamsManager>();
  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  ConcreteOrdersInDayFilterModel(String title): super(title) {
    _items = {
      'date': FromToDateFilterField(),
      'workStatus1':
          CheckBoxFilterField(title: 'سفارشات تائید شده', value: true),
      'workStatus2':
          CheckBoxFilterField(title: 'سفارشات تائید نشده', value: true),
    };
  }

  @override
  ConcreteOrdersInDayRepRequest getRequest() {
    return ConcreteOrdersInDayRepRequest(
        (_items['date'] as FromToDateFilterField).value.start.toString(),
        (_items['date'] as FromToDateFilterField).value.end.toString(),
        getWorkStatus(),
        cacheParams.currentFiscalYearLoginData!.dbName);
  }

  int getWorkStatus() {
    if (((_items['workStatus1'] as CheckBoxFilterField).value &&
            (_items['workStatus2'] as CheckBoxFilterField).value) ||
        (!(_items['workStatus1'] as CheckBoxFilterField).value &&
            !(_items['workStatus2'] as CheckBoxFilterField).value)) {
      return -1;
    } else if ((_items['workStatus1'] as CheckBoxFilterField).value) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  bool validation() {
    return true;
  }

  @override
  ConcreteOrdersInDayFilterModel clone() {
    final template = ConcreteOrdersInDayFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'workStatus1': (items['workStatus1']! as CheckBoxFilterField).copyWith(),
      'workStatus2': (items['workStatus2']! as CheckBoxFilterField).copyWith(),
    };
    return template;
  }
}
