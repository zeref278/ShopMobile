class User {
  int idUser;
  String avatarPath;
  String email;
  String phoneNumber;
  String userName;
  String? address;
  bool gender;
  String? dateOfBirth;

  User({
    required this.idUser,
    required this.email,
    required this.phoneNumber,
    required this.userName,
    required this.address,
    required this.avatarPath,
    required this.gender,
    this.dateOfBirth,
  });
}
