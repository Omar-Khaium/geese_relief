class LoginForm {
  String _email;
  String _password;
  bool _isRemembered;

  LoginForm(this._email, this._password, this._isRemembered);

  bool get isRemembered => _isRemembered;

  set isRemembered(bool value) {
    _isRemembered = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}