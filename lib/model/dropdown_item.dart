class DropDownSingleItem {
  String DataKey;
  String DisplayText;
  String DataValue;

  DropDownSingleItem(this.DataKey, this.DisplayText, this.DataValue);

  DropDownSingleItem.fromMap(Map<String, dynamic> map) {
    DataKey = map['DataKey'];
    DisplayText = map['DisplayText'];
    DataValue = map['DataValue'];
  }

}