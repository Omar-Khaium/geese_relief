class BasementReport{

  int id;
  String header;

  BasementReport(this.id, this.header);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id' : id,
      'header' : header,
    };
    return map;
  }

  BasementReport.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    header = map['header'];
  }
}