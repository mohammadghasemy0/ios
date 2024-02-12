import '/presentation/common/cache_params.dart';
import '/app/di.dart';
import '/presentation/base/base_view_model.dart';
import 'filter_model/base_filter_model.dart';

class FilterViewModel extends BaseViewModel {
  late FilterModel filterModel;
  final CacheParamsManager cacheParamsManager = instance<CacheParamsManager>();

  String get title => filterModel.title;

  @override
  dispose(){
    filterModel.dispose();
    super.dispose();
  }

  bool isValidate() {
    return filterModel.validation();
  }

  @override
  void start() {
    filterModel.onDataChangeOutput.listen((event) {
      inputState.add(null);
    });
  }

  void setFilter(FilterModel filterModel) {
    this.filterModel = filterModel;
  }
}
