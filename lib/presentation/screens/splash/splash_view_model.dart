import 'dart:async';
import '/presentation/base/base_view_model.dart';
import '../../resources/routes_manager.dart';
import '/app/app_prefs.dart';

class SplashScreenViewModel extends BaseViewModel
    with SplashScreenOutputs, SplashScreenInputs {

  final AppPreferences _appPreferences;
  SplashScreenViewModel(this._appPreferences);
  final _nextScreenStream = StreamController<String>.broadcast();

  @override
  void start() {
    Timer(const Duration(milliseconds: 300), () async{
      if(appLogin()){
        nextScreenStreamInput.add(Routes.homeRoute);
      }else{
        nextScreenStreamInput.add(Routes.registerRoute);
      }
    });

  }

  @override
  void dispose() {
    _nextScreenStream.close();
  }

  //inputs
  @override
  Sink get nextScreenStreamInput => _nextScreenStream.sink;



  //outputs
  @override
  bool appLogin() => _appPreferences.isUserLoggedIn();

  @override
  Stream<String> get nextScreenStreamOutput => _nextScreenStream.stream;



}

abstract class SplashScreenOutputs {
  bool appLogin();
  Stream<String> get nextScreenStreamOutput;
}

abstract class SplashScreenInputs {
  Sink get nextScreenStreamInput;
}
