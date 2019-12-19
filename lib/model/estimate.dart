class Estimate {
  String Id;
  String InvoiceId;
  String Description;
  String Quantity;
  String Price;
  String CreatedDate;

  Estimate(this.Id, this.InvoiceId, this.Description, this.Quantity, this.Price,
      this.CreatedDate);

  Estimate.fromMap(Map<String,dynamic> map){
    Id=map['Id'];
    InvoiceId=map['InvoiceId'];
    Description=map['Description'];
    Quantity=map['Quantity'];
    Price=map['Price'];
    CreatedDate=map['CreatedDate'];
  }

}