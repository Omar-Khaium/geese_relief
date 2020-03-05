import 'dart:async';
import 'package:geese_relief/model/login_form.dart';

class LoginBLoC {
  LoginForm loginForm;

  final dataStreamController = new StreamController<LoginForm>();
  final apiStreamController = new StreamController();

  Stream<LoginForm> get dataStream => dataStreamController.stream;
  StreamSink<LoginForm> get dataSink => dataStreamController.sink;
  StreamSink get callApi => apiStreamController.sink;

  LoginBLoC(){
    dataStreamController.add(loginForm);

    dataStreamController.stream.listen(_fillData);
    apiStreamController.stream.listen(_submit);
  }

  _fillData(LoginForm _login) {
    this.loginForm = _login;
  }
  _submit(_) {
    return apiStreamController.done;
  }

  void dispose() {
    dataStreamController.close();
    apiStreamController.close();
  }

}