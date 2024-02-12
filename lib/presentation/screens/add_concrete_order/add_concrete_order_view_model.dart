import 'dart:async';
import '/app/persian_date_time.dart';
import '/presentation/common/state_renderer/state_renderer_test.dart';
import '/presentation/resources/assets_manager.dart';
import '/data/request/customer_api_request.dart';
import '/presentation/screens/filter_screen/filter_field/check_box/check_box_filter_field.dart';
import '/presentation/screens/filter_screen/filter_field/date_time/date_time_filter_field.dart';
import '/domain/usecase/concrete/concrete_add_order.dart';
import '../filter_screen/filter_field/selectable_items/selectable_items_filter_field.dart';
import '/presentation/base/base_view_model.dart';
import '/presentation/screens/filter_screen/filter_field/base/base_filter_field.dart';
import '/app/di.dart';
import '../../common/cache_params.dart';

class AddConcreteViewModel extends BaseViewModel {
  final cacheParams = instance<CacheParamsManager>();
  final ConcreteAddOrderUseCase _usecase;
  late Map<String, FilterField> items;

  AddConcreteViewModel(this._usecase);

  String _amount = "";
  final _amountStreamController = StreamController<String>.broadcast();

  String _tolerance = "0";
  final _toleranceStreamController = StreamController<String>.broadcast();

  String _address = "";
  final _addressStreamController = StreamController<String>.broadcast();

  @override
  void start() {
    items = {
      'date': DateTimeFilterField(firstDate: PersianDateTime.now(),
          lastDate: PersianDateTime(year: PersianDateTime.now().year + 1)),
      'customerId': SelectableItemsFilterField(
          title: 'خریدار',
          items: cacheParams.data.customer.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    "${element.customerName} ${element.customerTitle}":
                        element.customerId
                  }),
          selectedItems: {},
          multiSelect: false),
      'productId': SelectableItemsFilterField(
          title: 'محصول',
          items: cacheParams.data.product.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    "${element.productName} ${element.productCode}":
                        element.productId
                  }),
          selectedItems: {},
          multiSelect: false),
      'betonWorkType': SelectableItemsFilterField(
          title: 'نوع کار',
          items: cacheParams.data.betonWorkType.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) =>
                  {...previousValue, element.workType: element.id}),
          selectedItems: {},
          multiSelect: false),
      'betonSharayetMohiti': SelectableItemsFilterField(
          title: 'شرایط محیطی',
          items: cacheParams.data.betonSharayetMohiti
              .fold<Map<String, dynamic>>(
                  {},
                  (previousValue, element) =>
                      {...previousValue, element.name: element.id}),
          selectedItems: {},
          multiSelect: false),
      'pomp': SelectableItemsFilterField(
          title: 'پمپ',
          items: cacheParams.data.pomp.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    "${element.pompDriver} ${element.code}": element.id
                  }),
          selectedItems: {},
          multiSelect: false),
      'control': CheckBoxFilterField(title: 'کنترل شود', value: true),
    };
  }


  ConcreteAddOrderRequest getRequest(){
    return ConcreteAddOrderRequest(
      (items['date'] as DateTimeFilterField).value.toString(),
      (items['date'] as DateTimeFilterField).value.time,
      _address,
      (items['betonWorkType'] as SelectableItemsFilterField)
          .value
          .toString(),
      cacheParams.currentFiscalYearLoginData!.dbName,
      (items['customerId'] as SelectableItemsFilterField)
          .value
          .values
          .toList().isNotEmpty? (items['customerId'] as SelectableItemsFilterField)
          .value
          .values
          .toList()[0] : 0,
      (items['productId'] as SelectableItemsFilterField)
          .value
          .values
          .toList().isNotEmpty?(items['productId'] as SelectableItemsFilterField)
          .value
          .values
          .toList()[0] : 0,
      (items['pomp'] as SelectableItemsFilterField)
          .value
          .values
          .toList().isNotEmpty? (items['pomp'] as SelectableItemsFilterField)
          .value
          .values
          .toList()[0] : 0,
      _amount.isNotEmpty ?double.parse(_amount) : 0,
      _tolerance.isNotEmpty ?double.parse(_tolerance): 0,
      (items['control'] as CheckBoxFilterField).value == true ? 2 : 1,
    );
  }

  Future<void> execute() async {
    if(validation()){
      inputState.add(LoadingState(message: "در حال ثبت سفارش"));
      (await _usecase.execute(
        getRequest()
      ))
          .fold(
        (l) => inputState
            .add(ErrorState(message: l.message, image: ImageAssets.clUnknown)),
        (r) {
          clearData();
          inputState.add(SuccessState(
            message: "سفارش با موفقیت ثبت شد.",
          ));
        },
      );
    }else{
      inputState.add(ErrorState(message: "اطلاعات را تکمیل کنید"));
    }
  }

  bool validation() {
    final request = getRequest();
    if(
    request.customerId != 0 &&
        request.productId != 0 &&
        request.address.isNotEmpty &&
        request.meghdar > 0
    ){
      return true;
    }
    return false;
  }

  Stream<String> get amountStream => _amountStreamController.stream;

  Stream<String> get toleranceStream => _toleranceStreamController.stream;
  String get tolerance => _tolerance;
  String get amount => _amount;
  String get address  => _address;

  Stream<String> get addressStream => _addressStreamController.stream;

  void onChangeAddress(String address) {
    _address = address;
  }

  void onChangeAmount(String amount) {
    _amount = amount;
  }

  void onChangeTolerance(String tolerance) {
    _tolerance = tolerance;
  }

  void clearData() {
    _address = "";
    _amount = "";
    _tolerance = "0";
    items = {
      'date': DateTimeFilterField(),
      'customerId': SelectableItemsFilterField(
          title: 'خریدار',
          items: cacheParams.data.customer.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    "${element.customerName} ${element.customerTitle}":
                        element.customerId
                  }),
          selectedItems: {},
          multiSelect: false),
      'productId': SelectableItemsFilterField(
          title: 'محصول',
          items: cacheParams.data.product.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    "${element.productName} ${element.productCode}":
                        element.productId
                  }),
          selectedItems: {},
          multiSelect: false),
      'betonWorkType': SelectableItemsFilterField(
          title: 'نوع کار',
          items: cacheParams.data.betonWorkType.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) =>
                  {...previousValue, element.workType: element.id}),
          selectedItems: {},
          multiSelect: false),
      'betonSharayetMohiti': SelectableItemsFilterField(
          title: 'شرایط محیطی',
          items: cacheParams.data.betonSharayetMohiti
              .fold<Map<String, dynamic>>(
                  {},
                  (previousValue, element) =>
                      {...previousValue, element.name: element.id}),
          selectedItems: {},
          multiSelect: false),
      'pomp': SelectableItemsFilterField(
          title: 'پمپ',
          items: cacheParams.data.pomp.fold<Map<String, dynamic>>(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    "${element.pompDriver} ${element.code}": element.id
                  }),
          selectedItems: {},
          multiSelect: false),
      'control': CheckBoxFilterField(title: 'کنترل شود', value: true),
    };

    inputState.add(null);
  }
}
