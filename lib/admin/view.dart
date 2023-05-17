import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:placeverse/admin/addrecord.dart';
import 'package:placeverse/auth/auth.dart';

class AdminView extends StatefulWidget {
  User user;
  AdminView({super.key, required this.user});
  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(186, 220, 237, 1),
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
              color: Color.fromRGBO(60, 108, 135, 1),
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
        body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 5,right: 5),
        child: Column(
          children: [
            // Neumorphic(
            //   child: Table(
            //     border: TableBorder(
            //         horizontalInside:
            //             BorderSide(color: Colors.blueGrey.shade200, width: 2.0)
            //     ),
            //     children: const [
            //       TableRow(children: [
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "PRN",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "NAME",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "Company",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "CGPA",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
                    
            //       ]),
          
            //       TableRow(children: [
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "20220204006",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "Yash Shinde",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "Amazon",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "8.84",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),  
            //       ]),
            //       TableRow(children: [
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "20220204006",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "Yash Shinde",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "Amazon",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "8.84",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),  
            //       ]),
            //       TableRow(children: [
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "20220204006",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //                   textAlign: TextAlign.center,
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "Varun Khambayate",
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold, color: Colors.black87),
            //                 textAlign: TextAlign.center,
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "Deutsche Bank",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),
            //         Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               "8.84",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black87),
            //             ),
            //           ),
            //         ),  
            //       ]),
            //     ],
            //   ),
            // )
        
            Center(
              child: Neumorphic(
                style: const NeumorphicStyle(
                  depth: 5,
                  shadowDarkColor: Color.fromRGBO(136, 188, 218, 1),
                  shadowLightColor: Color.fromRGBO(216, 234, 245, 1),
                ),
                child: Container(
                  height: 170,
                  width: 300,
                  decoration: const BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Color.fromRGBO(213, 224, 241, 1).withOpacity(0.5),
                    //     Color.fromRGBO(65, 108, 173, 1).withOpacity(0.9),
                    //   ],
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   stops: [0, 1],
                    // ),
                    color: Color.fromRGBO(186, 220, 237, 1), 
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const[
                        Text(
                          'Name: Yash Shinde',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'TextaAltMedium',
                            color: Color.fromRGBO(60, 108, 135, 1),
                          ),  
                        ),
                        Text('PRN: 202202040006',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'TextaAltMedium',
                            color: Color.fromRGBO(60, 108, 135, 1),
                          ),  
                        ),
                        Text('CGPA: 8.95',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'TextaAltMedium',
                            color: Color.fromRGBO(60, 108, 135, 1),
                          ),  
                        ),
                       Text('Company: Morgan Stanley',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'TextaAltMedium',
                            color: Color.fromRGBO(60, 108, 135, 1),
                          ),  
                       ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Center(
              child: Neumorphic(
                style: NeumorphicStyle(
                  depth: 5,
                  shadowDarkColor: Color.fromRGBO(136, 188, 218, 1),
                  shadowLightColor: Color.fromRGBO(216, 234, 245, 1),
                ),
                child: Container(
                  height: 170,
                  width: 300,
                  decoration: const BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Color.fromRGBO(213, 224, 241, 1).withOpacity(0.5),
                    //     Color.fromRGBO(65, 108, 173, 1).withOpacity(0.9),
                    //   ],
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   stops: [0, 1],
                    // ),
                    color: Color.fromRGBO(186, 220, 237, 1), 
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const[
                        Text(
                          'Name: Yash Shinde',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'TextaAltMedium',
                            color: Color.fromRGBO(60, 108, 135, 1),
                          ),  
                        ),
                        Text('PRN: 202202040006',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'TextaAltMedium',
                            color: Color.fromRGBO(60, 108, 135, 1),
                          ),  
                        ),
                        Text('CGPA: 8.95',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'TextaAltMedium',
                            color: Color.fromRGBO(60, 108, 135, 1),
                          ),  
                        ),
                       Text('Company: Morgan Stanley',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'TextaAltMedium',
                            color: Color.fromRGBO(60, 108, 135, 1),
                          ),  
                       ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            // Center(
            //   child: Neumorphic(
            //     style: NeumorphicStyle(
            //       depth: 15,
            //       shadowDarkColor: Color.fromRGBO(83, 109, 194, 1).withOpacity(0.8),
            //     ),
            //     child: Container(
            //       height: 170,
            //       width: 300,
            //       decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //           colors: [
            //             Color.fromRGBO(213, 224, 241, 1).withOpacity(0.5),
            //             Color.fromRGBO(65, 108, 173, 1).withOpacity(0.9),
            //           ],
            //           begin: Alignment.topLeft,
            //           end: Alignment.bottomRight,
            //           stops: [0, 1],
            //         ),
            //       ),
            //       child: Center(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children:const[
            //             Text(
            //               'Name: Yash Shinde',
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.white,
            //               ),  
            //             ),
            //             Text('PRN: 202202040006',
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.white,
            //               ),  
            //             ),
            //             Text('CGPA: 8.95',
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.white,
            //               ),  
            //             ),
            //            Text('Company: Morgan Stanley',
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.white,
            //               ),  
            //            ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // )
        
          ],
        ),
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


