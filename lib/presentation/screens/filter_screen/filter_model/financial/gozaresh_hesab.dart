import '/app/persian_date_time.dart';
import '/presentation/screens/filter_screen/filter_field/check_box/check_box_filter_field.dart';
import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class FinancialGozareshHesabFilterModel
    extends FilterModel<FinancialGozareshHesabRepRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  FinancialGozareshHesabFilterModel(String title) : super(title) {
    _items = {
      'date': FromToDateFilterField(
          value: FromToDateValueObject(
              PersianDateTime.now().copyWith(month: 01, day: 1),
              PersianDateTime.now())),
      'hesabTafsili': SelectableItemsFilterField(
        title: 'حساب تفضیلی',
        items: cacheParams.tafsili.fold<Map<String, dynamic>>(
            {},
            (previousValue, element) =>
                {...previousValue, element.nameTafsili: element.idTafsili}),
        selectedItems: {},
        multiSelect: false,
        onDataChange: (p0) {
          onDataChangeInput.add(null);
        },
      ),
      'moinList': SelectableItemsFilterField(
          title: 'لیست معین',
          items: cacheParams.data.moin.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    "${element.nameHesab} ${element.codeMali}    ${element.nameHesabKol} ${element.codMaliKol}":
                        element.id
                  }),
          selectedItems: {},
          multiSelect: true),
      'mandeHesabGhabli':
          CheckBoxFilterField(title: 'مانده حساب قبلی', value: true),
      'rizFactor':
          CheckBoxFilterField(title: 'فاکتورها بصورت ریز', value: true),
      'kerayeHaml': CheckBoxFilterField(
          title: 'مشاهده کرایه حمل در تاریخ فاکتور', value: true),
    };
  }

  @override
  FinancialGozareshHesabRepRequest getRequest() {
    return FinancialGozareshHesabRepRequest(
        (_items['date'] as FromToDateFilterField).value.start.toString(),
        (_items['date'] as FromToDateFilterField).value.end.toString(),
        (_items['hesabTafsili'] as SelectableItemsFilterField)
                .value
                .values
                .toList()
                .isNotEmpty
            ? (_items['hesabTafsili'] as SelectableItemsFilterField)
                .value
                .values
                .toList()[0]
            : 0,
        (_items['moinList'] as SelectableItemsFilterField)
            .value
            .values
            .toList()
            .map((e) => e as int)
            .toList(),
        (items['mandeHesabGhabli']! as CheckBoxFilterField).value,
        (items['rizFactor']! as CheckBoxFilterField).value,
        (items['kerayeHaml']! as CheckBoxFilterField).value,
        cacheParams.currentFiscalYearLoginData!.dbName);
  }

  @override
  bool validation() {
    return true;
    // return getRequest().hesabTafsili != 0;
  }

  @override
  FinancialGozareshHesabFilterModel clone() {
    final template = FinancialGozareshHesabFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'hesabTafsili':
          (items['hesabTafsili']! as SelectableItemsFilterField).copyWith(),
      'moinList': (items['moinList']! as SelectableItemsFilterField).copyWith(),
      'mandeHesabGhabli':
          (items['mandeHesabGhabli']! as CheckBoxFilterField).copyWith(),
      'rizFactor': (items['rizFactor']! as CheckBoxFilterField).copyWith(),
      'kerayeHaml': (items['kerayeHaml']! as CheckBoxFilterField).copyWith(),
    };
    return template;
  }

}
