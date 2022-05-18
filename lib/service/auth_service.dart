import 'dart:collection';

class AuthService {
  Map<String, String> _userDetails = new HashMap();

  AuthService() {
    _userDetails['shiwantha@gmail.com'] = 'Grubcenter@1234';
    _userDetails['sand@gmail.com'] = '1qaz@WSX';
  }

  bool login(String? username, String? password) {
    return _userDetails[username] != null && _userDetails[username] == password;
  }
}
