import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class StudentData extends StatefulWidget {
  late Map<dynamic,dynamic>data;
  StudentData({super.key, required this.data});

  @override
  State<StudentData> createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(186, 220, 237, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 5,right: 5),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Neumorphic(
                style: const NeumorphicStyle(
                  depth: 4,
                  shadowDarkColor: Color.fromRGBO(122, 177, 209, 1),
                  shadowLightColor: Color.fromRGBO(228, 241, 248, 1),
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
                      children:[
                        Text(
                          widget.data['name'],
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
        
          ],
        ),
      ),
    );
  }
}