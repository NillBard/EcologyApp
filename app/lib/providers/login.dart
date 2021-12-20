import 'base.dart';

class LoginForm extends BaseProvider {
  var _email = '';
  var _password = '';

  get email => _email;

  get password => _password;

  setEmail(String value) {
    _email = value;
  }

  setPassword(String value) {
    _password = value;
  }
}
