import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_model/pages/login/login.dart';
import 'package:flutter_model/view_models/profile_view_model.dart';
import 'package:flutter_model/view_models/register_view_model.dart';
import 'package:provider/provider.dart';

import 'view_models/login_view_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProfileViewModel()),
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => RegisterViewModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
