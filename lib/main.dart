// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutter/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  runApp(MaterialApp(
    title: 'Travelogue',
    home: LoginPage(),
    theme: ThemeData(primarySwatch: Colors.deepOrange),
  ));
}
