import '/app/app_prefs.dart';

abstract class LocalDataSource {
}

class LocalDataSourceImpl extends LocalDataSource {
  final AppPreferences _appPreferences;

  LocalDataSourceImpl(this._appPreferences);



}
