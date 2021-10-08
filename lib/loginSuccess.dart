import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myflutter/mainpage.dart';

class LoginSucess extends StatefulWidget {
  final String email;

  const LoginSucess({Key? key, required this.email}) : super(key: key);

  @override
  State<LoginSucess> createState() => _LoginSucessState();
}

class _LoginSucessState extends State<LoginSucess> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height: 150.0),
                  const CircularProgressIndicator(),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Logging in'),
            ],
          ),
        ),
      );
}

class LoginFail extends StatefulWidget {
  @override
  State<LoginFail> createState() => _LoginFailState();
}

class _LoginFailState extends State<LoginFail> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height: 150.0),
                  const CircularProgressIndicator(),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Logging in'),
            ],
          ),
        ),
      );
}
