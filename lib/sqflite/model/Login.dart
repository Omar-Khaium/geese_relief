class Login{
  int id;
  String username;
  String password;
  bool isRemembered;
  bool isAuthenticated;
  String accessToken;
  int validity;

  Login(this.id, this.username, this.password, this.isRemembered, this.isAuthenticated,
      this.accessToken, this.validity);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id' : id,
      'username' : username,
      'password' : password,
      'isRemembered' : isRemembered,
      'isAuthenticated' : isAuthenticated,
      'accessToken' : accessToken,
      'validity' : validity,
    };
    return map;
  }


  Login.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    username = map['username'];
    password = map['password'];
    isRemembered = map['isRemembered'] == 1 ? true : false;
    isAuthenticated = map['isAuthenticated'] == 1 ? true : false;
    accessToken = map['accessToken'];
    validity = map['validity'];
  }
}