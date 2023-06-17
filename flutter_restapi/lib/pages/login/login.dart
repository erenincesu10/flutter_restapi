
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_restapi/view_models/login_view_model.dart';
import 'package:flutter_restapi/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: context.watch<LoginViewModel>().usernameController,
            decoration: InputDecoration(
              prefixIcon: Icon(CupertinoIcons.mail),
              labelText: "Email",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5)
            )),),
            SizedBox(height: 20,),
            TextField(
              controller: context.watch<LoginViewModel>().passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                labelText: "Password",prefixIcon: Icon(Icons.password_rounded)),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              context.read<LoginViewModel>().login();
            }, child: Text("Login"),style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(MediaQuery.of(context).size.width*0.8, 50)
            ),)
          ],
        ),
      ),
    );
  }
}