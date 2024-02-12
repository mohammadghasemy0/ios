import 'package:kiano/app/persian_date_time.dart';

import '/presentation/screens/filter_screen/filter_field/check_box/check_box_filter_field.dart';
import '/presentation/screens/filter_screen/filter_field/from_to_amount/from_to_amount_filter_field.dart';
import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class FinancialBedBesFilterModel
    extends FilterModel<FinancialBedBesRepRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  FinancialBedBesFilterModel(String title): super(title) {
    _items = {
      'date': FromToDateFilterField(
        value: FromToDateValueObject(
          PersianDateTime(year: PersianDateTime.now().year),
          PersianDateTime.now(),
        ),
      ),
      'groohTafsili': SelectableItemsFilterField(
          title: 'گروه تفضیلی',
          items: cacheParams.data.goroohTafsili.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) =>
                  {...previousValue, element.name: element.id}),
          selectedItems: {},
          multiSelect: true),
      'biHesab': CheckBoxFilterField(title: 'بی حساب', value: false),
      'fromToBed': FromToAmountFilterField(
          label: 'بدهکار',
          value: FromToAmountValueObject(
              isChecked: true, maxValue: "0", minValue: "0")),
      'fromToBes': FromToAmountFilterField(label: 'بستانکار'),
    };
  }

  @override
  FinancialBedBesRepRequest getRequest() {
    return FinancialBedBesRepRequest(
        (_items['date'] as FromToDateFilterField).value.start.toString(),
        (_items['date'] as FromToDateFilterField).value.end.toString(),
        (_items['groohTafsili'] as SelectableItemsFilterField)
            .value
            .values
            .toList()
            .map((e) => e as int)
            .toList(),
        (_items['fromToBed'] as FromToAmountFilterField).value.isChecked,
        (_items['fromToBes'] as FromToAmountFilterField).value.isChecked,
        (items['biHesab']! as CheckBoxFilterField).value,
        int.parse(
            (_items['fromToBed'] as FromToAmountFilterField).value.minValue),
        int.parse(
            (_items['fromToBed'] as FromToAmountFilterField).value.maxValue),
        int.parse(
            (_items['fromToBes'] as FromToAmountFilterField).value.minValue),
        int.parse(
            (_items['fromToBes'] as FromToAmountFilterField).value.maxValue),
        cacheParams.currentFiscalYearLoginData!.dbName);
  }

  @override
  bool validation() {
    return true;
  }

  @override
  FinancialBedBesFilterModel clone() {
    final template = FinancialBedBesFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'groohTafsili':
          (items['groohTafsili']! as SelectableItemsFilterField).copyWith(),
      'biHesab': (items['biHesab']! as CheckBoxFilterField).copyWith(),
      'fromToBed': (items['fromToBed']! as FromToAmountFilterField).copyWith(),
      'fromToBes': (items['fromToBes']! as FromToAmountFilterField).copyWith(),
    };
    return template;
  }
}
