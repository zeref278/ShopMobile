part of authentication_screen;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final formKey = GlobalKey<FormState>();

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String mail = '';
  String password = '';

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    //email field
    final mailField = TextFormField(
      controller: mailController,
      autofocus: false,
      // controller: emailController,
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
      //Input Text
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );

    //password field
    final passwordlField = TextFormField(
      controller: passwordController,
      autofocus: false,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      //validator
      validator: (text) {
        if (text!.length < 6) {
          return 'Password must be at least 6 characters long';
        } else {
          return null;
        }
      },
      onChanged: (text) => setState(() => password = text),
      //Input Text
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //Show password
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

    final loginButton = Consumer<UserProvider>(
      builder: (context, userData, _) {
        return Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          color: AppColors.defaultBackgroundColor,
          //color: Color(0xFF7A9757),
          child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width,
            //Check validation
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                if (userData.checkExistUser(
                    mailController.text, passwordController.text)) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuScreen()));
                }
                else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Notification",
                            style: TextStyle(fontSize: 18),
                          ),
                          content: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
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
                                "Incorrect !",
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
                                    borderRadius:
                                    BorderRadius.circular(
                                        10)),
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight:
                                      FontWeight.w600,
                                      color: Colors.white),
                                )),
                          ],
                        );
                      });
                }
              }
            },
            child: Text("Login",
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 300,
                      child:
                          Image.asset("assets/logo.png", fit: BoxFit.contain),
                    ),
                    mailField,
                    SizedBox(height: 20),
                    passwordlField,
                    SizedBox(height: 20),
                    loginButton,
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text("Sign Up",
                              style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
