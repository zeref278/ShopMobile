import 'package:flutter/material.dart';
import 'package:project/pages/account_edit_screen.dart';
import 'package:project/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AccountView extends StatelessWidget {
  const AccountView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Account Information"),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountEditScreen(),
                    ),
                  ),
              icon: Icon(Icons.edit)),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<UserProvider>(builder: (context, provider, child) {
          return Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  "assets/blank.png",
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Name"),
                subtitle: Text(provider.user.name),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("Email"),
                subtitle: Text(provider.user.email),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Phone Number"),
                subtitle: Text(provider.user.phoneNumber),
              ),
              ListTile(
                leading: Icon(Icons.accessibility),
                title: Text("Gender"),
                subtitle: Text(provider.user.gender! ? "Female" : "Male"),
              ),
              ListTile(
                leading: Icon(Icons.cake),
                title: Text("Date of Birth"),
                subtitle:
                    Text(provider.user.dateOfBirth ?? 'Chưa có thông tin'),
              ),
              ListTile(
                leading: Icon(Icons.place),
                title: Text("Address"),
                subtitle: Text(provider.user.address ?? 'Chưa có thông tin'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
