import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../base_filter_model.dart';

class ConcreteDailyTotaledFilterModel extends FilterModel<ConcreteSalesDailyTotaledRepRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  ConcreteDailyTotaledFilterModel(String title): super(title) {
    _items = {
      'date': FromToDateFilterField(),
    };
  }

  @override
  ConcreteSalesDailyTotaledRepRequest getRequest() {
    return ConcreteSalesDailyTotaledRepRequest(
        (_items['date'] as FromToDateFilterField).value.start.toString(),
        (_items['date'] as FromToDateFilterField).value.end.toString(),
        cacheParams.currentFiscalYearLoginData!.dbName,
        );
  }

  @override
  bool validation() {
    return true;
  }

  @override
  ConcreteDailyTotaledFilterModel clone() {
    final template = ConcreteDailyTotaledFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
    };
    return template;
  }
}
