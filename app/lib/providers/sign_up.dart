import 'base.dart';

class SignUpForm extends BaseProvider {
  var _email = '';
  var _name = '';
  var _password = '';

  get email => _email;

  get name => _name;

  get password => _password;

  setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  setName(String value) {
    _name = value;
    notifyListeners();
  }

  setPassword(String value) {
    _password = value;
    notifyListeners();
  }
}
