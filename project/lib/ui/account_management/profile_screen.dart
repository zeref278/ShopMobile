import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/providers/users_provider.dart';
import 'package:project/ui/widget_customization/text_field_customization/text_field_customization.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //------Edit Mode or Read Only Mode
  late bool isEditMode;

  //------Var to control TextField
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPhone;
  late TextEditingController controllerDate;
  late TextEditingController controllerAddress;

  @override
  void initState() {
    isEditMode = false;

    controllerName = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPhone = TextEditingController();

    controllerDate = TextEditingController();
    controllerAddress = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userData, _) {
      return Scaffold(
        backgroundColor: defaultBackgroundColor,

        //------FloatingActionButton to switch Edit Mode: submit change - Read Only: switch to Edit Mode
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          backgroundColor: isEditMode ? defaultPrimaryColor : Colors.blue,
          child: isEditMode
              ? Icon(CupertinoIcons.checkmark_alt)
              : Icon(CupertinoIcons.pencil_ellipsis_rectangle),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: isEditMode
              ? () {
                  //Submit change here - You can check logic in here
                  // userData.changeInformation(
                  //   username: controllerName.text,
                  //   email: controllerEmail.text,
                  //   phoneNumber: controllerPhone.text,
                  //   dateOfBirth: controllerDate.text,
                  //   address: controllerAddress.text,
                  // );

                  //------Show dialog to notify edit successful
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Notification",
                            style: TextStyle(fontSize: 18),
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Edit profile successful !",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ],
                        );
                      });

                  //------Switch mode
                  setState(() {
                    isEditMode = false;
                  });
                }
              : () {
                  setState(() {
                    isEditMode = true;
                  });
                },
        ),

        //------TextField start here
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(userData.user.avatarPath),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustomization(
                  inputType: TextInputType.name,
                  controller: controllerName,
                  isEdit: isEditMode,
                  icon: Icon(CupertinoIcons.person),
                  label: 'User Name',
                  hintText: userData.user.userName,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustomization(
                  inputType: TextInputType.emailAddress,
                  controller: controllerEmail,
                  isEdit: isEditMode,
                  icon: Icon(CupertinoIcons.mail),
                  label: 'Email',
                  hintText: userData.user.email,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustomization(
                  inputType: TextInputType.phone,
                  controller: controllerPhone,
                  isEdit: isEditMode,
                  icon: Icon(CupertinoIcons.phone),
                  label: 'Phone Number',
                  hintText: userData.user.phoneNumber,
                ),
                SizedBox(
                  height: 15,
                ),

                //------Can't change gender because i can't fix bug here, lol :))
                TextFieldCustomization(
                  isEdit: false,
                  icon: Icon(Icons.accessibility),
                  label: 'Gender',
                  hintText: userData.user.gender ? 'Female' : 'Male',
                  onTap: () {
                    !isEditMode
                        ? null
                        : showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Notification",
                                  style: TextStyle(fontSize: 18),
                                ),
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "You cannot edit Gender !",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "OK",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                ],
                              );
                            });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustomization(
                  inputType: TextInputType.datetime,
                  controller: controllerDate,
                  isEdit: isEditMode,
                  icon: Icon(CupertinoIcons.calendar),
                  label: 'Date of Birth',
                  hintText: userData.user.dateOfBirth ?? 'No information yet',
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustomization(
                  controller: controllerAddress,
                  isEdit: isEditMode,
                  icon: Icon(CupertinoIcons.placemark),
                  label: 'Address',
                  hintText: userData.user.address ?? 'No information yet',
                ),
              ],
            )),
      );
    });
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPhone.dispose();

    controllerDate.dispose();
    controllerAddress.dispose();
    super.dispose();
  }
}
