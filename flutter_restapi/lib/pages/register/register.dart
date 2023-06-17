import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:model_dart/view_models/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Register Page",style: TextStyle(color: Colors.black),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: context.watch<RegisterViewModel>().usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.mail),
                labelText: "Email",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
              )),),
              SizedBox(height: 20,),
              TextField(
                controller: context.watch<RegisterViewModel>().passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  labelText: "Password",prefixIcon: Icon(Icons.password_rounded)),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                context.read<RegisterViewModel>().registerNewUser();
              }, child: Text("Register"),style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(MediaQuery.of(context).size.width*0.8, 50)
              ),),
            ],
          ),
        ),
      ),
    );
  }
}