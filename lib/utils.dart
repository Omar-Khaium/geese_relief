import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showMessage(BuildContext context, String title, String message, Color color, IconData icon) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    backgroundColor: color,
    icon: Icon(
      icon,
      size: 24.0,
      color: Colors.white,
    ),
    duration: Duration(seconds: 4),
    leftBarIndicatorColor: Colors.white70,
    boxShadows: [
      BoxShadow(
        color: color.withOpacity(.5),
        offset: Offset(0.0, 2.0),
        blurRadius: 4.0,
      )
    ],
    title: title,
    message: message,
    shouldIconPulse: false,
  )..show(context);
}

void showAPIResponse(BuildContext context, String title, Color color) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    backgroundColor: color,
    duration: Duration(seconds: 4),
    boxShadows: [
      BoxShadow(
        color: color.withOpacity(1),
        offset: Offset(0.0, 0.0),
        blurRadius: 1.0,
      )
    ],
    title: "Network Response",
    message: title,
  )..show(context);
}

String formatDate(String date) {
  DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'hh:mm:ss");
  DateTime dateTime = inputFormat.parse(date);
  DateFormat outputFormat = DateFormat("MM/dd/yyyy", );
  return outputFormat.format(dateTime);
}

final COLOR_DANGER = 0xE54F42;
final COLOR_SUCCESS = 0x38CC76;
final COLOR_WARNING = 0xFFA628;

//var currencyFormat = new NumberFormat.currency(locale: "en_US", name: "USD", decimalDigits: 2);
var currencyFormat = new NumberFormat("#,###.##", "en_US");
var numberFormat = new NumberFormat("#,###", "en_US");
RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]},';

const String BASE_URL = "https://api.rmrcloud.com/";
const String API_TOKEN = "token";
const String API_USER_BY_USERNAME = "GetUserByUserName";
const String API_EQUIPMENT_LIST = "GetEquipmentListByKey";
const String API_CREATE_ESTIMATE = "CreateEstimate";
const String API_UPLOAD_FILE = "UploadImageFile";
const String API_GET_ESTIMATE = "GetEstimateById";
const String API_GET_LOOK_UP = "GetLookupbyKey";
const String API_GET_BASEMENT_INSPECTION = "GetCustomerInspectionByCustomerId";
const String API_SAVE_BASEMENT_INSPECTION = "SaveCustomerInspection";
const String API_SAVE_RECOMMENDED_LEVEL = "RecommendedLevel";
const String API_SAVE_CUSTOMER = "SaveCustomer";
const String API_FORGET_PASSWORD = "ForgetPassword";
const String API_CHANGE_PASSWORD = "ChangePassword";
const String API_GET_ALL_CUSTOMER = "GetAllCustomer";
const String API_DELETE_CUSTOMER = "DeleteCustomer";
const String API_UPDATE_CUSTOMER = "GetCustomerByIdWithEstimateList";
const String API_CUSTOMER_UPLOAD = "CustomerImageUpload";
const String API_DUPLICATE_ESTIMATE = "EstimateDuplicate";
const String API_DELETE_ESTIMATE = "DeleteEstimate";
const String API_GENERATE_ESTIMATE = "GenerateEstimate";
const String API_SEND_EMAIL = "SendEmailEstimate";