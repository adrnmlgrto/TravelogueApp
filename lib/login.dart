import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:myflutter/loginSuccess.dart';
import 'package:myflutter/registration.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = true;

  final emailController = TextEditingController();
  final passwController = TextEditingController();

  Future userLogin() async {
    String email = emailController.text;
    String password = passwController.text;

    final response = await http.post(
      Uri.parse('http://192.168.100.44/travelogue/login.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    // String loginStatus = jsonDecode(response.body);

    if (response.statusCode == 201) {
      print(response.statusCode); // CHECKING RESPONSE CODE, WILL DELETE LATER
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginSucess(email: emailController.text)));
    } else {
      print(response.statusCode);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginFail()));
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login-bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/LOGO.png', height: 70, width: 200),
                    SizedBox(height: 30.0),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.white54,
                        filled: true,
                        labelText: 'Email',
                      ),
                      validator: RequiredValidator(
                          errorText: 'Field must not be empty'),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      controller: passwController,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        fillColor: Colors.white54,
                        filled: true,
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: RequiredValidator(
                          errorText: 'Field must not be empty'),
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    userLogin();
                                  }
                                },
                                child: Text('LOGIN'))),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()),
                        );
                      },
                      child: const Text('Don\'t have an account? Create now!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
