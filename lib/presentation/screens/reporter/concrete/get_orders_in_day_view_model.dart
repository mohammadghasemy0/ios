import '../../module/base_module_view_model.dart';
import '/data/mapper/mapper.dart';
import '../../filter_screen/filter_model/concrete/orders_in_day.dart';
import '/domain/usecase/concrete/concrete_get_orders_in_day_rep.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class ConcreteGetOrdersInDayViewModel extends ReportsViewModel
    with
        ConcreteGetOrdersInDayViewModelInput,
        ConcreteGetOrdersInDayViewModelOutput {
  final ConcreteOrdersInDayRepUseCase _useCase;
  ConcreteOrdersInDayFilterModel _filterModel =
      ConcreteOrdersInDayFilterModel("سفارش به تفکیک روز");

  ConcreteGetOrdersInDayViewModel(this._useCase);

  @override
  void start() async {
    getData();
  }

  @override
  getData() async {
    header = null;
    reportItemData = [];

    refreshDataInput.add(RefreshState.loading);

    (await _useCase.execute(_filterModel.getRequest())).fold((l) => refreshDataInput.add(RefreshState.error),
            (r) {
          if(r != null){
            reportItemData =
                r.toReportItemDataList();
          }
          refreshDataInput.add(RefreshState.hasData);
        });
  }

  @override
  FilterModel get filterModel => _filterModel;

  @override
  set filterModel(filterModel) {
    _filterModel = filterModel;
  }
}

abstract class ConcreteGetOrdersInDayViewModelInput {}

abstract class ConcreteGetOrdersInDayViewModelOutput {}
