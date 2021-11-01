import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/models/user.dart';
import 'package:project/providers/users_provider.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //Form key
  final formKey = GlobalKey<FormState>();

  bool obscureText = true;

  String _gender = 'Male';

  String name = '';
  String mail = '';
  String password = '';
  String confirmPassword = '';

  final nameEditingController = TextEditingController();
  final mailEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Name field
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      //validator
      validator: (text) {
        if (text!.isEmpty) {
          return 'Enter your name';
        } else if (text.length < 2) {
          return 'Enter at least 2 characters';
        } else {
          return null;
        }
      },
      onChanged: (text) => setState(() => name = text),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Full Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );

    //Mail Field
    final mailField = TextFormField(
      autofocus: false,
      controller: mailEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator
      validator: (text) {
        if (text!.isEmpty) {
          return 'Enter an email';
        } else if (!RegExp(
                r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)')
            .hasMatch(text)) {
          return 'Enter a valid email';
        } else {
          return null;
        }
      },
      onChanged: (text) => setState(() => mail = text),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );

    final phonelField = TextFormField(
      autofocus: false,
      controller: phoneEditingController,
      keyboardType: TextInputType.phone,
      //validator
      validator: (text) {
        if (text!.isEmpty) {
          return 'Enter your phone number';
        } else if (text.length != 10) {
          return 'Enter a valid phone number';
        } else {
          return null;
        }
      },
      //onChanged: (text) => setState(() => mail = text),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );

    final dropDownButtonGender = DropdownButton(
      icon: Icon(
        CupertinoIcons.chevron_down,
        size: 18,
      ),
      value: _gender,
      onChanged: (String? newValue) {
        setState(() {
          _gender = newValue!;
        });
      },
      items: ['Male', 'Female'].map((location) {
        return DropdownMenuItem(
          child: Text(location),
          value: location,
        );
      }).toList(),
    );

    //Password Field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: obscureText,
      controller: passwordEditingController,
      keyboardType: TextInputType.visiblePassword,
      //validator
      validator: (text) {
        if (text!.isEmpty) {
          return 'Enter your password';
        } else if (text.length < 6) {
          return 'Enter at least 6 characters';
        } else {
          return null;
        }
      },
      onChanged: (text) => setState(() => password = text),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() => obscureText = !obscureText);
            },
            child: obscureText
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  )
                : const Icon(Icons.visibility, color: Color(0xFF7A9757))),
      ),
    );

    //Confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      obscureText: obscureText,
      controller: confirmPasswordEditingController,
      keyboardType: TextInputType.visiblePassword,
      //validator
      validator: (text) {
        if (text!.isEmpty) {
          return 'Enter your password';
        } else if (text.length < 6) {
          return 'Enter at least 6 characters';
        } else if (confirmPassword != password) {
          return 'Password do not match';
        } else {
          return null;
        }
      },
      onChanged: (text) => setState(() => confirmPassword = text),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() => obscureText = !obscureText);
            },
            child: obscureText
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  )
                : const Icon(Icons.visibility, color: Color(0xFF7A9757))),
      ),
    );

    final submitButton = Consumer<UserProvider>(
      builder: (context, userData, _) {
        return Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          color: defaultPrimaryColor,
          child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width,
            //Check validation
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                if (!userData.checkExistEmail(mailEditingController.text)) {
                  userData.addUser(User(
                    idUser: 100,
                    userName: nameEditingController.text,
                    gender: _gender=='Male' ? false : true,
                    avatarPath: 'assets/avatar_test2.png',
                    password: passwordEditingController.text,
                    //address: '',
                    email: mailEditingController.text,
                    phoneNumber: phoneEditingController.text,
                  ));
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Notification",
                            style: TextStyle(fontSize: 18),
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.checkmark_shield,
                                size: 30,
                                color: defaultPrimaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Sign up successful !",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          actions: [
                            MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                color: defaultPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )),
                          ],
                        );
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Notification",
                            style: TextStyle(fontSize: 18),
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.xmark_shield,
                                size: 30,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "This email already exists !",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          actions: [
                            MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )),
                          ],
                        );
                      });
                }
              }
            },
            child: Text("Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF688F4E), size: 35),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child:
                          Image.asset("assets/logo.png", fit: BoxFit.contain),
                    ),
                    SizedBox(height: 20),
                    nameField,
                    SizedBox(height: 20),
                    mailField,
                    SizedBox(height: 20),
                    phonelField,
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Icon(Icons.accessibility),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Gender',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(width: 60),
                          dropDownButtonGender,
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    submitButton
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    mailEditingController.dispose();
    phoneEditingController.dispose();
    passwordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    super.dispose();
  }
}
