// auth_store.dart

// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String? token;

  @observable
  int? cdUser;

  @observable
  String? nmUser;

  @action
  void setUser(String token, int cdUser, String nmUser) {
    this.token = token;
    this.cdUser = cdUser;
    this.nmUser = nmUser;
  }
}
