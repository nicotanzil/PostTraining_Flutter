import 'package:flutter/material.dart';
import '../../variable.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var _controlUsername = TextEditingController();
  var _controlPassword = TextEditingController();
  bool _username_val = true;
  bool _password_val = true;
  var validCharacters = RegExp(r'^[a-zA-Z0-9]+$');

  void _loginPressed(BuildContext context, String username, String password) {
    setState(() {
      if (_validateUsername(username).isEmpty)
        _username_val = true;
      else
        _username_val = false;

      if (_validatePassword(password).isEmpty)
        _password_val = true;
      else
        _password_val = false;

      if (_username_val && _password_val) {
        // Navigate to Home Page
        // After finish developing we need to pass the changeTheme function to this class
        loggedInUsername = _controlUsername.text;
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => HomePage()));
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  String _validateUsername(String username) {
    if (username.isEmpty) {
      return "Username cannot be empty";
    } else if (username.length < 5 && username.isNotEmpty) {
      return "Username must not consist of less than 5 characters";
    } else if (!validCharacters.hasMatch(username)) {
      return "Username must only consist of alpha numeric characters!";
    }
    _username_val = true;
    return "";
  }

  String _validatePassword(String password) {
    if (password.isEmpty) {
      return "Password cannot be empty";
    }
    _password_val = true;
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Login'),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(15),
              color: primaryColorDarkBlue,
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/amazon.png'),
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle,
                          color: primaryColorDarkBlue),
                      hintText: 'Username or Email',
                      errorText: _username_val
                          ? null
                          : _validateUsername(_controlUsername.text),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: primaryColorYellow, width: 1.0),
                      ),
                    ),
                    controller: _controlUsername,
                    style: TextStyle(color: primaryColorDarkBlue),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.lock_rounded, color: primaryColorDarkBlue),
                      hintText: 'Password',
                      errorText: _password_val
                          ? null
                          : _validatePassword(_controlPassword.text),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: primaryColorYellow, width: 1.0),
                      ),
                    ),
                    obscureText: true,
                    controller: _controlPassword,
                    style: TextStyle(color: primaryColorDarkBlue),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _loginPressed(context,
                          _controlUsername.text, _controlPassword.text),
                      child: Text('Login'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return primaryColorDarkBlue;
                            return primaryColorBlue; // Use the component's default.
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
