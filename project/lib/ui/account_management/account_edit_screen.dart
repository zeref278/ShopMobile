import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AccountEditScreen extends StatefulWidget {
  const AccountEditScreen({Key? key}) : super(key: key);

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  bool? gender;
  String? dateTime;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    bool? genderInit = gender ?? provider.user.gender;
    String nameInit = provider.user.name;
    String emailInit = provider.user.email;
    String phoneInit = provider.user.phoneNumber;
    String addressInit = provider.user.address ?? "Chưa có thông tin";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Edit Account Information"),
        actions: [
          IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Confirm?"),
                      content: Text("Are you sure?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              provider.changeInformation(
                                  name: name,
                                  address: address,
                                  dateOfBirth: dateTime,
                                  email: email,
                                  gender: gender,
                                  phoneNumber: phoneNumber);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text("Ok")),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel")),
                      ],
                    );
                  }),
              icon: Icon(Icons.save)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onLongPress: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Name"),
                      content: TextFormField(
                        initialValue: name ?? provider.user.name,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) => setState(() {
                          name = value;
                        }),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              if (name != null ||
                                  nameInit == provider.user.name) {
                                Navigator.pop(context);
                              }
                            },
                            child: Text("Ok")),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel")),
                      ],
                    );
                  }),
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text(name ?? provider.user.name),
            ),
            ListTile(
              onLongPress: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Name"),
                      content: TextFormField(
                        initialValue: email ?? provider.user.email,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) => setState(() {
                          email = value;
                        }),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              if (email != null ||
                                  emailInit == provider.user.email) {
                                Navigator.pop(context);
                              }
                            },
                            child: Text("Ok")),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel")),
                      ],
                    );
                  }),
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text(email ?? provider.user.email),
            ),
            ListTile(
              onLongPress: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Phone Number"),
                      content: TextFormField(
                        initialValue: phoneNumber ?? provider.user.phoneNumber,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) => setState(() {
                          phoneNumber = value;
                        }),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              if (phoneNumber != null ||
                                  phoneInit == provider.user.phoneNumber) {
                                Navigator.pop(context);
                              }
                            },
                            child: Text("Ok")),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel")),
                      ],
                    );
                  }),
              leading: Icon(Icons.phone),
              title: Text("Phone Number"),
              subtitle: Text(phoneNumber ?? provider.user.phoneNumber),
            ),
            ListTile(
              onLongPress: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Gender"),
                      content: StatefulBuilder(builder: (context, setState) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropdownButton<String>(
                              alignment: AlignmentDirectional.center,
                              value: genderInit! ? "Female" : "Male",
                              elevation: 16,
                              onChanged: (String? value) {
                                if (value == "Male") {
                                  setState(() {
                                    genderInit = false;
                                  });
                                } else
                                  setState(() {
                                    genderInit = true;
                                  });
                              },
                              items: <String>[
                                'Male',
                                'Female'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  alignment: AlignmentDirectional.center,
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      }),
                      actions: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                gender = genderInit;
                              });
                              Navigator.pop(context);
                            },
                            child: Text("Ok")),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel")),
                      ],
                    );
                  }),
              leading: Icon(Icons.accessibility),
              title: Text("Gender"),
              subtitle:
                  Text((gender ?? provider.user.gender!) ? "Female" : "Male"),
            ),
            ListTile(
              onLongPress: () async {
                final DateTime? _picked = await showDatePicker(
                  context: context,
                  initialDate: provider.user.dateOfBirth == null
                      ? DateTime.now()
                      : DateFormat('dd/MM/yyyy')
                          .parse(provider.user.dateOfBirth!),
                  firstDate: DateTime(1990, 1),
                  lastDate: DateTime.now(),
                );
                if (_picked != null ||
                    _picked !=
                        DateFormat('dd/MM/yyyy')
                            .parse(provider.user.dateOfBirth!)) {
                  setState(() {
                    dateTime = DateFormat("dd/MM/yyyy").format(_picked!);
                  });
                }
              },
              leading: Icon(Icons.cake),
              title: Text("Date of Birth"),
              subtitle: Text(
                  dateTime ?? provider.user.dateOfBirth ?? 'Chưa có thông tin'),
            ),
            ListTile(
              onLongPress: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Address"),
                      content: TextFormField(
                        initialValue: address ?? provider.user.address,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) => setState(() {
                          address = value;
                        }),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              if (address != null ||
                                  addressInit == provider.user.address) {
                                Navigator.pop(context);
                              }
                            },
                            child: Text("Ok")),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel")),
                      ],
                    );
                  }),
              leading: Icon(Icons.place),
              title: Text("Address"),
              subtitle:
                  Text(address ?? provider.user.address ?? 'Chưa có thông tin'),
            ),
          ],
        ),
      ),
    );
  }
}
