class User {
  int idUser;
  String name;
  String email;
  String phoneNumber;
  String userName;
  String? address;
  bool? gender;
  String? dateOfBirth;

  User({
    required this.idUser,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.userName,
    required this.address,
    this.gender,
    this.dateOfBirth,
  });
}
