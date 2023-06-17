
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_restapi/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({super.key,});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  User? get user => context.watch<ProfileViewModel>().user;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Profile Page",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   width: 100,
              //   height: 100,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(image: NetworkImage(user!.avatar!)),
              //     shape: BoxShape.circle
              //   ),),
              ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.network(user!.avatar!)),
              Text(user!.firstName!),
              Text(user!.lastName!),
              Text(user!.email!),
            ],
          ),
        ),
      ),
    );
  }
}