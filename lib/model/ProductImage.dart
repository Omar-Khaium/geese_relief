class ProductImage{

  int Id;
  String ImageType;
  String _ImageLoc;

  ProductImage(this.Id, this.ImageType, this._ImageLoc);

  ProductImage.fromMap(Map<String, dynamic> map) {
    Id = map['Id'];
    ImageType = map['ImageType'];
    _ImageLoc = map['ImageLoc'];
  }
  String get ImageLoc => _ImageLoc;

  set ImageLoc(String value) {
    _ImageLoc = value;
  }


}