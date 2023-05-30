import 'package:async_builder/async_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:placeverse/admin/Controller.dart';
import 'package:placeverse/admin/addrecord.dart';
import 'package:placeverse/auth/auth.dart';
import 'package:placeverse/main.dart';
import 'package:placeverse/stud_data/simple_view.dart';
import 'package:placeverse/stud_data/view.dart';

class AdminView extends StatefulWidget {
  User user;
  AdminView({super.key, required this.user});
  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  var data={};
  var list = [];
  var listData = {};

  Map<String,dynamic>aws = {}; 
  Map<String,dynamic> morgan = {}; 
  var jp = {}; 
  int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(186, 220, 237, 1),//Color.fromRGBO(151, 196, 218, 1), // 
        appBar: AppBar(
          // leading: Icon(Icons.admin_panel_settings_outlined),
          leading: Icon(
            Icons.admin_panel_settings_outlined,
            color: Color.fromRGBO(60, 108, 135, 1),
            size: 30.0,
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
          actions: [
            IconButton(
                onPressed: () {
                  Auth.signOut();
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Color.fromRGBO(60, 108, 135, 1),
                )),
            SizedBox(
              width: 10,
            )
          ],
          // leading: Icon(Icons.place_outlined),
          centerTitle: true,
          toolbarHeight: 50,
          leadingWidth: 40,
          backgroundColor: Color.fromRGBO(186, 220, 237, 1),
          shadowColor: Color.fromRGBO(207, 224, 249, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        body: AsyncBuilder(
          future: FirebaseFirestore.instance.collection('Placement').get(),
          builder: (BuildContext context, snapshot) {
            FirebaseFirestore.instance.collection('Placement').get().then(
                  (QuerySnapshot){
                    data.clear();
                    var t = QuerySnapshot.docs;
                    for (var e in t) {
                      data[e.id] = e.data();
                    }
                  }
                );
              data.forEach((key, value) async{ 
                list.add(key);
              });

              data.clear();
              for (var i in list) {
                FirebaseFirestore.instance.collection(i).get().then(
                  (QuerySnapshot) async {
                    // var t = ;
                    QuerySnapshot.docs.forEach((e) {
                      if (i.toString().toLowerCase()=='aws') {
                        aws[e.id] = e.data();
                      }
                      else if (i.toString().toLowerCase()=='morgan stanley') {
                        morgan[e.id] = e.data();
                      }
                    }); 
                  }
                );
              }
            if (widget.user.uid == 'Hl13qcEyhAcVYUMhyh56CJCGoxt2') {
              print('morgan2 $morgan');
              print('aws $aws');
              list = list.toSet().toList();
              print('object ${list}');
              return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context,count){
               return Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 5,right: 5),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Center(
                    child: Neumorphic(
                      style: const NeumorphicStyle(
                        depth: 4,
                        shadowDarkColor: Color.fromRGBO(122, 177, 209, 1),
                        shadowLightColor: Color.fromRGBO(228, 241, 248, 1),
                      ),
                      child: GestureDetector(
                        onTap: () async{
                            if (list[count].toString().toLowerCase() == 'morgan stanley') {
                              print(morgan);
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentData(data: morgan)));
                            }
                            else if (list[count].toString().toLowerCase() == 'aws') {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentData(data: aws)));
                            }
                        },
                        child: Container(
                          height: 70,
                          width: 180,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(186, 220, 237, 1), 
                          ),
                          child: Center(
                            child: Text(
                              list[count],
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'TextaAltMedium',
                                color: Color.fromRGBO(60, 108, 135, 1),
                              ),  
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  ]
                ),
               );
              }
            );
            } else {
              if (widget.user.uid == 'YcNpTLiM5vSi2p3lQknNs6U7Z2H3') {
                return StudentData(data: aws);
              }
              else if(widget.user.uid == 'SJPijuJn5yRtitxpKzzVinQR7kq2') {
                return StudentData(data: morgan);
              }
              else if(widget.user.uid == 'QecxFC7GIKelUepQJGWlu58xlfA2') {
                return StudentData(data: jp); 
              }
            }
            return Container();
        }
        ), 
        floatingActionButton: _getFAB(),
      );
  }
  Widget _getFAB() {
    print(widget.user.uid);
    if (widget.user.uid.toString() != 'Hl13qcEyhAcVYUMhyh56CJCGoxt2') {
      return Text('');
    } else {
      return  GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => AddRecord(user: widget.user,)));
            // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => OneDataView()));
            // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => ReadData()));
          },
          child: Neumorphic(
            padding: EdgeInsets.all(1),
            style: const NeumorphicStyle(
              color: Color.fromRGBO(186, 220, 237, 1), 
              boxShape: NeumorphicBoxShape.circle()
            ),
            child: Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              child: const Icon(
                Icons.add_outlined,
                size: 40,
                color: Color.fromRGBO(60, 108, 135, 1),
              ),
            ),
          )
        );
    }
  }
}


