import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/user.dart';

class UserProvider with ChangeNotifier {
  User get user => _demoUser;

  User _demoUser = User(
    idUser: 01,
    userName: 'Tran Linh',
    email: 'linhtranttdl@gmail.com',
    address: 'Da Nang',
    gender: true,
    dateOfBirth: DateFormat("dd/MM/yyyy").format(DateTime.parse("2019-09-30")),
    phoneNumber: '0123456789',
    avatarPath: 'assets/avatar.png',
  );

  void changeInformation(
      {String? email,
      String? username,
      String? address,
      String? dateOfBirth,
      String? phoneNumber}) {
    _demoUser.email = (email == '' ? _demoUser.email : email)!;
    _demoUser.userName = (username == '' ? _demoUser.userName : username)!;
    _demoUser.address = address == '' ? _demoUser.address : address;
    _demoUser.phoneNumber =
        (phoneNumber == '' ? _demoUser.phoneNumber : phoneNumber)!;
    _demoUser.dateOfBirth =
        dateOfBirth == '' ? _demoUser.dateOfBirth : dateOfBirth;
    notifyListeners();
  }

}
