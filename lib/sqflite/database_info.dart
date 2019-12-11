class DBInfo{
  static const String DB_NAME = "GrateApp.db";
  static const String TABLE_LOGIN = "Login";
  static const String TABLE_CUSTOMER = "Customer";
  static const String CREATE_TABLE_LOGIN = "CREATE TABLE $TABLE_LOGIN ($LOGIN_ID INTEGER PRIMARY KEY AUTOINCREMENT, $LOGIN_USERNAME TEXT, $LOGIN_PASSWORD TEXT, $LOGIN_IS_REMEMBERED INTEGER, $LOGIN_IS_AUTHENTICATED INTEGER, $LOGIN_ACCESS_TOKEN TEXT, $LOGIN_VALIDITY INTEGER)";
  static const String CREATE_TABLE_CUSTOMER = "CREATE TABLE $TABLE_CUSTOMER ($CUSTOMER_ID INTEGER PRIMARY KEY AUTOINCREMENT, $CUSTOMER_API_ID TEXT, $CUSTOMER_NAME TEXT, $CUSTOMER_CONTACT_NUMBER TEXT, $CUSTOMER_EMAIL TEXT, $CUSTOMER_ADDRESS TEXT, $CUSTOMER_IMAGE TEXT)";
  static const String LOGIN_ID = "id";
  static const String LOGIN_USERNAME = "username";
  static const String LOGIN_PASSWORD = "password";
  static const String LOGIN_IS_REMEMBERED = "isRemembered";
  static const String LOGIN_IS_AUTHENTICATED = "isAuthenticated";
  static const String LOGIN_ACCESS_TOKEN = "accessToken";
  static const String LOGIN_VALIDITY = "validity";
  static const String CUSTOMER_ID = "id";
  static const String CUSTOMER_API_ID = "api_id";
  static const String CUSTOMER_NAME = "name";
  static const String CUSTOMER_CONTACT_NUMBER = "contact_num";
  static const String CUSTOMER_EMAIL = "email";
  static const String CUSTOMER_ADDRESS = "address";
  static const String CUSTOMER_IMAGE = "image";
}