// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  late final _$tfKullaniciAtom =
      Atom(name: '_LoginStore.tfKullanici', context: context);

  @override
  TextEditingController get tfKullanici {
    _$tfKullaniciAtom.reportRead();
    return super.tfKullanici;
  }

  @override
  set tfKullanici(TextEditingController value) {
    _$tfKullaniciAtom.reportWrite(value, super.tfKullanici, () {
      super.tfKullanici = value;
    });
  }

  late final _$tfPasswordAtom =
      Atom(name: '_LoginStore.tfPassword', context: context);

  @override
  TextEditingController get tfPassword {
    _$tfPasswordAtom.reportRead();
    return super.tfPassword;
  }

  @override
  set tfPassword(TextEditingController value) {
    _$tfPasswordAtom.reportWrite(value, super.tfPassword, () {
      super.tfPassword = value;
    });
  }

  late final _$userListAtom =
      Atom(name: '_LoginStore.userList', context: context);

  @override
  ObservableList<Map<String, dynamic>> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(ObservableList<Map<String, dynamic>> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void addUser(String username, String password) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.addUser');
    try {
      return super.addUser(username, password);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFields() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tfKullanici: ${tfKullanici},
tfPassword: ${tfPassword},
userList: ${userList}
    ''';
  }
}
