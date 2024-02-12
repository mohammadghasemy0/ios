import '/presentation/screens/filter_screen/filter_field/check_box/check_box_filter_field.dart';
import '/app/di.dart';
import '/data/request/customer_api_request.dart';
import '../../../../common/cache_params.dart';
import '../../filter_field/base/base_filter_field.dart';
import '../../filter_field/from_to_date/from_to_date_filter_field.dart';
import '../../filter_field/selectable_items/selectable_items_filter_field.dart';
import '../base_filter_model.dart';

class TreasuryDaryaftAndPardakhtFilterModel
    extends FilterModel<TreasuryDaryaftAndPardakhtRepRequest> {
  final cacheParams = instance<CacheParamsManager>();

  late Map<String, FilterField> _items;

  @override
  Map<String, FilterField> get items => _items;

  @override
  set items(Map<String, FilterField> newItems) => _items = newItems;

  TreasuryDaryaftAndPardakhtFilterModel(String title): super(title) {
    _items = {
      'date': FromToDateFilterField(),
      'idDaryaftKonande': SelectableItemsFilterField(
          title: 'دریافت کننده',
          items: cacheParams.data.customer.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    "${element.customerName} ${element.customerCode}":
                        element.customerId
                  }),
          selectedItems: {},
          multiSelect: false),
      'idPardakhtKonande': SelectableItemsFilterField(
          title: 'پرداخت کننده',
          items: cacheParams.data.customer.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    "${element.customerName} ${element.customerCode}":
                        element.customerId
                  }),
          selectedItems: {},
          multiSelect: false),
      'naghdi': CheckBoxFilterField(title: 'نقد', value: true),
      'havale': CheckBoxFilterField(title: 'حواله', value: true),
      'kart': CheckBoxFilterField(title: 'کارت', value: true),
      'check': CheckBoxFilterField(title: 'چک', value: true),
    };
  }

  @override
  TreasuryDaryaftAndPardakhtRepRequest getRequest() {
    return TreasuryDaryaftAndPardakhtRepRequest(
      (_items['date'] as FromToDateFilterField).value.start.toString(),
      (_items['date'] as FromToDateFilterField).value.end.toString(),
      (_items['naghdi'] as CheckBoxFilterField).value,
      (_items['havale'] as CheckBoxFilterField).value,
      (_items['kart'] as CheckBoxFilterField).value,
      (_items['check'] as CheckBoxFilterField).value,
      (_items['idPardakhtKonande'] as SelectableItemsFilterField)
              .value
              .values
              .toList()
              .isNotEmpty
          ? (_items['idPardakhtKonande'] as SelectableItemsFilterField)
              .value
              .values
              .toList()[0]
          : 0,
      (_items['idDaryaftKonande'] as SelectableItemsFilterField)
              .value
              .values
              .toList()
              .isNotEmpty
          ? (_items['idDaryaftKonande'] as SelectableItemsFilterField)
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
  TreasuryDaryaftAndPardakhtFilterModel clone() {
    final template = TreasuryDaryaftAndPardakhtFilterModel(title);
    template.items = {
      'date': (items['date']! as FromToDateFilterField).copyWith(),
      'idDaryaftKonande':
          (items['idDaryaftKonande']! as SelectableItemsFilterField).copyWith(),
      'idPardakhtKonande':
          (items['idPardakhtKonande']! as SelectableItemsFilterField)
              .copyWith(),
      'naghdi':
          (items['naghdi']! as CheckBoxFilterField)
              .copyWith(),
      'havale':
          (items['havale']! as CheckBoxFilterField)
              .copyWith(),
      'kart':
          (items['kart']! as CheckBoxFilterField)
              .copyWith(),
      'check':
          (items['check']! as CheckBoxFilterField)
              .copyWith(),
    };
    return template;
  }
}
