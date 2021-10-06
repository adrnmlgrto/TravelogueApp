import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/mainpage.dart';
import 'package:myflutter/registration.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) => Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/LOGO.png', height: 70, width: 200),
                SizedBox(height: 30.0),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white54,
                    filled: true,
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
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
                ),
                SizedBox(height: 40.0),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()),
                              );
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
                  child: const Text('I don\'t have an account.'),
                ),
              ],
            ),
          ),
        ),
      );
}
