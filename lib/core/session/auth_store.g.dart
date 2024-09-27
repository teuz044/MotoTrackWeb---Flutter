// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$tokenAtom = Atom(name: '_AuthStore.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$cdUserAtom = Atom(name: '_AuthStore.cdUser', context: context);

  @override
  int? get cdUser {
    _$cdUserAtom.reportRead();
    return super.cdUser;
  }

  @override
  set cdUser(int? value) {
    _$cdUserAtom.reportWrite(value, super.cdUser, () {
      super.cdUser = value;
    });
  }

  late final _$nmUserAtom = Atom(name: '_AuthStore.nmUser', context: context);

  @override
  String? get nmUser {
    _$nmUserAtom.reportRead();
    return super.nmUser;
  }

  @override
  set nmUser(String? value) {
    _$nmUserAtom.reportWrite(value, super.nmUser, () {
      super.nmUser = value;
    });
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  void setUser(String token, int cdUser, String nmUser) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setUser');
    try {
      return super.setUser(token, cdUser, nmUser);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
token: ${token},
cdUser: ${cdUser},
nmUser: ${nmUser}
    ''';
  }
}
