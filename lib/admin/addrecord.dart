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
  late String prn,name,company,cgpa,phno,email;
  var data={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(186, 220, 237, 1),
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Color.fromRGBO(60, 108, 135, 1),
              size: 30.0,
            ),
          ),
          title: const Text(
            'PlaceVerse',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'TextaAltMedium',
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Color.fromRGBO(60, 108, 135, 1),
            ),
          ),
          centerTitle: true,
          toolbarHeight: 50,
          leadingWidth: 40,
          backgroundColor: Color.fromRGBO(186, 220, 237, 1),
          shadowColor: Color.fromRGBO(207, 224, 249, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Neumorphic(
                  style: NeumorphicStyle(
                    depth: 4,
                    shadowDarkColor: Color.fromRGBO(122, 177, 209, 1),
                    shadowLightColor: Color.fromRGBO(228, 241, 248, 1),
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                  ),
                  child: Container(
                    color: Color.fromRGBO(186, 220, 237, 1),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: Color.fromRGBO(60, 108, 135, 1),
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(60, 108, 135, 1),
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
                ),
                SizedBox(height: 30,),
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: 4,
                    shadowDarkColor: Color.fromRGBO(122, 177, 209, 1),
                    shadowLightColor: Color.fromRGBO(228, 241, 248, 1),
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                  ),
                  child: Container(
                    color: Color.fromRGBO(186, 220, 237, 1),
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
                ),
                SizedBox(height: 30,),
              Neumorphic(
                  style: NeumorphicStyle(
                    depth: 4,
                    shadowDarkColor: Color.fromRGBO(122, 177, 209, 1),
                    shadowLightColor: Color.fromRGBO(228, 241, 248, 1),
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                  ),
                  child: Container(
                    color: Color.fromRGBO(186, 220, 237, 1),
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
                ),
                SizedBox(height: 30,),
              Neumorphic(
                  style: NeumorphicStyle(
                    depth: 4,
                    shadowDarkColor: Color.fromRGBO(122, 177, 209, 1),
                    shadowLightColor: Color.fromRGBO(228, 241, 248, 1),
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                  ),
                  child: Container(
                    color: Color.fromRGBO(186, 220, 237, 1),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'CGPA',
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,  
                      ),
                      validator: (value) {
                       
                      },
                      onChanged: (value) {
                        setState(() {
                          cgpa = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: 4,
                    shadowDarkColor: Color.fromRGBO(122, 177, 209, 1),
                    shadowLightColor: Color.fromRGBO(228, 241, 248, 1),
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                  ),
                  child: Container(
                    color: Color.fromRGBO(186, 220, 237, 1),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,  
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                        }
                      },
                      onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: 4,
                    shadowDarkColor: Color.fromRGBO(122, 177, 209, 1),
                    shadowLightColor: Color.fromRGBO(228, 241, 248, 1),
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                  ),
                  child: Container(
                    color: Color.fromRGBO(186, 220, 237, 1),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'PHNO',
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,  
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                        }
                      },
                      onChanged: (value) {
                          setState(() {
                            phno = value;
                          });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Center(
                  child: Neumorphic(
                    style: const NeumorphicStyle(
                      depth: 4,
                      shadowDarkColor: Color.fromRGBO(122, 177, 209, 1),
                      shadowLightColor: Color.fromRGBO(228, 241, 248, 1),
                    ),
                    child: GestureDetector(
                      onTap: () async{
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
                          'email':email,
                          'phno':phno
                        }, SetOptions(merge: true));
                        
                        FirebaseFirestore.instance.collection('Placement').doc(company).set({
                            
                        }, SetOptions(merge: true));
      
                        Fluttertoast.showToast(msg: 'Record Added');
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        color: Color.fromRGBO(186, 220, 237, 1),
                        child: const Text(
                          'ADD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Color.fromRGBO(60, 108, 135, 1),
                          ),
                        ),
                      ),
                    )
                  )
                     
                ),
            ],
          ),
        ),
      ),
    );
  }
}