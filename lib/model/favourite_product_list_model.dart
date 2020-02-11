
class FavouriteList {

  String equipmentsId;
  String productName;
  String productDescription;
  String productSKU;
  double productRetails;

  FavouriteList(this.equipmentsId, this.productName, this.productDescription,
      this.productSKU, this.productRetails);

  FavouriteList.fromMap(Map<String,dynamic> map){
    equipmentsId=map['EquipmentId'];
    productName=map['Name'];
    productDescription=map['Description'];
    productSKU=map['SKU'];
    productRetails=map['Retail'];

  }


}