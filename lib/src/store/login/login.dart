import 'package:mobx/mobx.dart';
import 'package:viveohealthtask/src/utils/validators.dart';

part 'login.g.dart';

class LoginForm = _LoginForm with _$LoginForm;

abstract class _LoginForm with Store, Validators{

  @observable
  String userNameError = null;

  @observable
  String passwordError = null;

  @action
  Future submitForm({String userName, String password}) async{
    passwordError = validatePassword(password);
    userNameError = validateName(userName);
    if(passwordError == null && userNameError == null){
      return true;
    }
    return false;
  }
}