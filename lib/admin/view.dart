import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:placeverse/auth/auth.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.admin_panel_settings_outlined),
        leading: Icon(
          Icons.admin_panel_settings_outlined,
          color: Colors.black,
          size: 30.0,

        ),
        title: const Text(
        'PlaceVerse',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'tahoma',
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        ),
        actions: [
          IconButton(onPressed: (){
            Auth.signOut();
            Navigator.of(context).pop();
          }, icon: Icon(
            Icons.logout_outlined,
            color: Colors.black,
            )),
            SizedBox(width: 10,)
        ],
        // leading: Icon(Icons.place_outlined),
        centerTitle: true,
        toolbarHeight: 50,
        leadingWidth: 40,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        
      ),
    );
  }
}