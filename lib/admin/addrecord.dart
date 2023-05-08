import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: Icon(Icons.admin_panel_settings_outlined),
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: 30.0,
            ),
          ),
          title: const Text(
            'Add Record',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'tahoma',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // Auth.signOut();
                  
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            )
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Neumorphic(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(),
        
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}