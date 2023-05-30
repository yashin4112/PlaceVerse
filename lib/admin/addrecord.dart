import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:placeverse/auth/auth.dart';

class AddRecord extends StatefulWidget {
  User user;
  AddRecord({required this.user, super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  late String prn,name,company,cgpa;
  var data={};
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Neumorphic(
                style: NeumorphicStyle(
                  // shadowLightColor: Color.fromARGB(255, 97, 108, 118),
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'PRN',
                    contentPadding: EdgeInsets.only(left: 15),
                    border: InputBorder.none,  
                  ),
                  validator: (value) {
                    
                  },
                  onChanged: (value) {
                    setState(() {
                      prn = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
            Neumorphic(
                style: NeumorphicStyle(
                  // shadowLightColor: Color.fromARGB(255, 97, 108, 118),
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    contentPadding: EdgeInsets.only(left: 15),
                    border: InputBorder.none,  
                  ),
                  validator: (value) {
                    
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
            Neumorphic(
                style: NeumorphicStyle(
                  // shadowLightColor: Color.fromARGB(255, 97, 108, 118),
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Company',
                    contentPadding: EdgeInsets.only(left: 15),
                    border: InputBorder.none,  
                  ),
                  validator: (value) {
                   
                  },
                  onChanged: (value) {
                    setState(() {
                      company = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
            Neumorphic(
                style: NeumorphicStyle(
                  // shadowLightColor: Color.fromARGB(255, 97, 108, 118),
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CGPA',
                    contentPadding: EdgeInsets.only(left: 15),
                    border: InputBorder.none,  
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is too short!';
                    }
                  },
                  onChanged: (value) {
                    // setState(() {
                      setState(() {
                        cgpa = value;
                      });
                    // });
                  },
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: NeumorphicButton(
                    child:
                        Text('Add'),
                    onPressed: (){

                      FirebaseFirestore.instance.collection('Placement').doc(company).get().then(
                      (QuerySnapshot) async{
                        data.clear();
                        data = QuerySnapshot.data()!;
                      }
                    );

                      FirebaseFirestore.instance.collection(company).doc(prn).set({
                          'prn':prn,
                          'name':name,
                          'cgpa':cgpa,
                          'company':company,
                      }, SetOptions(merge: true));
                      FirebaseFirestore.instance.collection('Placement').doc(company).set({
                          
                      }, SetOptions(merge: true));

                      Fluttertoast.showToast(msg: 'Record Added');
                    },
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10.0)),
                      color:Colors.blueGrey.shade300, 
                    ),
                        
                   ),
              )
          ],
        ),
      ),
    );
  }
}