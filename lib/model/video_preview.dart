class VideoPreview {
  String _url;
  String _thumbnail;
  String _title;

  VideoPreview(this._url, this._thumbnail, this._title);

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get thumbnail => _thumbnail;

  set thumbnail(String value) {
    _thumbnail = value;
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }
}