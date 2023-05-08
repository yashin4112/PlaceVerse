import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:placeverse/admin/addrecord.dart';
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
            IconButton(
                onPressed: () {
                  Auth.signOut();
                  Navigator.of(context).pop();
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
          padding: const EdgeInsets.only(top: 15.0, left: 5,right: 5),
          child: Column(
            
            children: [
              Neumorphic(
                child: Table(
                  border: TableBorder(
                      horizontalInside:
                          BorderSide(color: Colors.blueGrey.shade200, width: 2.0)),
                  children: const [
                    TableRow(children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "PRN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "NAME",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Company",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "CGPA",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      
                    ]),
        
                    TableRow(children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "20220204006",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Yash Shinde",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Amazon",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "8.84",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),  
                    ]),
                    TableRow(children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "20220204006",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Yash Shinde",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Amazon",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "8.84",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),  
                    ]),
                    TableRow(children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "20220204006",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                                textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Varun Khambayate",
                            style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black87),
                              textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Deutsche Bank",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "8.84",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ),
                      ),  
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => AddRecord()));
          },
          child: Container(
            width: 110,
            height: 150,
            alignment: Alignment.center,
            child: Neumorphic(
              style: NeumorphicStyle(
                color: Colors.blueGrey.shade300,
              ),
              child: const Icon(
                Icons.add_outlined,
                size: 40,
              ),
            ),
          )
        )
      );
  }
}
