import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/user.dart';

class UserProvider with ChangeNotifier {
  User get user => _listUser[currentUser];

  int currentUser = -1;

  List<User> _listUser = [
    User(
      idUser: 01,
      userName: 'Tran Linh',
      email: 'linhtranttdl@gmail.com',
      password: '123456789',
      address: 'Da Nang',
      gender: true,
      dateOfBirth:
          DateFormat("dd/MM/yyyy").format(DateTime.parse("2019-09-30")),
      phoneNumber: '0123456789',
      avatarPath: 'assets/avatar.png',
    ),
    User(
      idUser: 02,
      userName: 'Test User 1',
      password: '123456789',
      email: 'test1@gmail.com',
      address: 'Hue',
      gender: false,
      dateOfBirth:
          DateFormat("dd/MM/yyyy").format(DateTime.parse("2019-09-15")),
      phoneNumber: '0123456789',
      avatarPath: 'assets/avatar_test1.png',
    ),
    User(
      idUser: 03,
      userName: 'Test User 2',
      password: '123456789',
      email: 'test2@gmail.com',
      address: 'Ha Noi',
      gender: false,
      dateOfBirth:
          DateFormat("dd/MM/yyyy").format(DateTime.parse("2019-09-30")),
      phoneNumber: '0123456789',
      avatarPath: 'assets/avatar_test2.png',
    ),
  ];

  void addUser(User user) {
    _listUser.add(user);
  }

  bool checkExistUser(String email, String password) {
    int index = -1;
    return _listUser.any((user) {
      index++;
      if (user.email == email && user.password == password) {
        currentUser = index;
        return true;
      } else
        return false;
    });
  }

  bool checkExistEmail(String email) {
    for (User user in _listUser) {
      if (user.email == email) {
        return true;
      }
    }
    return false;
  }

  void changeInformation(
      {String? email,
      String? username,
      String? address,
      String? dateOfBirth,
      String? phoneNumber}) {
    _listUser[currentUser].email =
        (email == '' ? _listUser[currentUser].email : email)!;
    _listUser[currentUser].userName =
        (username == '' ? _listUser[currentUser].userName : username)!;
    _listUser[currentUser].address =
        address == '' ? _listUser[currentUser].address : address;
    _listUser[currentUser].phoneNumber =
        (phoneNumber == '' ? _listUser[currentUser].phoneNumber : phoneNumber)!;
    _listUser[currentUser].dateOfBirth =
        dateOfBirth == '' ? _listUser[currentUser].dateOfBirth : dateOfBirth;
    notifyListeners();
  }
}
