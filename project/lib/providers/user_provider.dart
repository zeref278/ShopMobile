import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/model/user.dart';

class UserProvider with ChangeNotifier {
  User get user => _demoUser;

  User _demoUser = User(
    idUser: 02,
    name: 'Tran Linh',
    email: 'linhtranttdl@gmail.com',
    userName: 'tranlinh123',
    address: 'Da Nang',
    gender: true,
    dateOfBirth: DateFormat("dd/MM/yyyy").format(DateTime.parse("2019-09-30")),
    phoneNumber: '0123456789',
  );

  void changeInformation(
      {String? name,
      String? email,
      String? username,
      String? address,
      bool? gender,
      String? dateOfBirth,
      String? phoneNumber}) {
    _demoUser.name = name ?? _demoUser.name;
    _demoUser.email = email ?? _demoUser.email;
    _demoUser.userName = username ?? _demoUser.userName;
    _demoUser.address = address ?? _demoUser.address;
    _demoUser.gender = gender ?? _demoUser.gender;
    _demoUser.phoneNumber = phoneNumber ?? _demoUser.phoneNumber;
    _demoUser.dateOfBirth = dateOfBirth ?? _demoUser.dateOfBirth;
    notifyListeners();
  }
}
