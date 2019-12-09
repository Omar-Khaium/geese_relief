class DBInfo{
  static const String DB_NAME = "GrateApp.db";
  static const String TABLE_LOGIN = "Login";
  static const String CREATE_TABLE_LOGIN = "CREATE TABLE $TABLE_LOGIN ($LOGIN_ID INTEGER PRIMARY KEY AUTOINCREMENT, $LOGIN_USERNAME TEXT, $LOGIN_PASSWORD TEXT, $LOGIN_IS_REMEMBERED INTEGER, $LOGIN_IS_AUTHENTICATED INTEGER, $LOGIN_ACCESS_TOKEN TEXT, $LOGIN_VALIDITY INTEGER)";
  static const String LOGIN_ID = "id";
  static const String LOGIN_USERNAME = "username";
  static const String LOGIN_PASSWORD = "password";
  static const String LOGIN_IS_REMEMBERED = "isRemembered";
  static const String LOGIN_IS_AUTHENTICATED = "isAuthenticated";
  static const String LOGIN_ACCESS_TOKEN = "accessToken";
  static const String LOGIN_VALIDITY = "validity";
}