import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  TextEditingController tfKullanici = TextEditingController();

  @observable
  TextEditingController tfPassword = TextEditingController();

  @observable
  ObservableList<Map<String, dynamic>> userList = ObservableList<Map<String, dynamic>>();

  @action
  void addUser(String username, String password) {
    userList.add({
      'username': username,
      'password': password,
      'score': 0,
    });
  }

  @action
  void clearFields() {
    tfKullanici.clear();
    tfPassword.clear();
  }



  bool userExists(String username, String password) {
    for (int i = 0; i < userList.length; i++) {
      if (userList[i]['username'] == username && userList[i]['password'] == password) {
        return true;
      }
    }
    return false;
  }

  int getUserIndex(String username, String password) {
    for (int i = 0; i < userList.length; i++) {
      if (userList[i]['username'] == username && userList[i]['password'] == password) {
        return i;
      }
    }
    return -1;
  }
}
