import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:moto_tracker_web/modules/login/repositories/login_repository.dart';
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

enum LoginStateStatus {
  initial,
  loading,
  success,
  successResetPassword,
  error;
}

abstract class LoginControllerBase with Store {

final LoginRepository _loginRepository;
  LoginControllerBase(this._loginRepository);

  final usuarioEC = TextEditingController();
  final senhaEC = TextEditingController();

  @readonly
  var _status = LoginStateStatus.initial;

  @readonly
  String _errorMessage = '';

  @action
  Future<void> limparCamposAoVoltar()async {
    _status = LoginStateStatus.loading;
     await Future.delayed(Duration.zero);
    usuarioEC.clear();
    senhaEC.clear();
    _status = LoginStateStatus.success;
  }

  @action
  Future<bool> login(BuildContext context) async {
    try {
      _status = LoginStateStatus.loading;
      await Future.delayed(Duration.zero);
      await _loginRepository.login(usuarioEC.text, senhaEC.text);
      if (0 == 0) {
        _status = LoginStateStatus.success;
        return true;
      } else {
        _status = LoginStateStatus.error;
        _errorMessage = 'Login não autorizado';
        return false;
      }
    } catch (e) {
      _status = LoginStateStatus.error;
      throw Exception('Erro ao fazer login');
    }
  }

}