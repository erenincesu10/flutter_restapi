

import 'package:flutter/material.dart';
import 'package:flutter_restapi/pages/home/home.dart';
import 'package:flutter_restapi/pages/login/login.dart';
import 'package:flutter_restapi/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

import 'view_models/login_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ChangeNotifierProvider(create: (_) => LoginViewModel()),      
    ],
    child: const MyApp()));
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
      home: const HomePage(),
    );
  }
}

