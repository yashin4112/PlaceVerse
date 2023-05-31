import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class StudentData extends StatefulWidget {
  late Map<dynamic,dynamic>data;
  late var name = [];
  late var prn =[];
  late var cgpa=[];
  late var com=[];
  late var email=[];
  late var phno=[];
  StudentData({super.key, required this.data});

  @override
  State<StudentData> createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {
  Map<dynamic,Map> data = {};
  int i =0;

  int len()=>widget.data.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(186, 220, 237, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 5,right: 5),
        child: ListView.builder(
          itemCount: len(),
          itemBuilder: (context,count){
            i=0;
            var val = widget.data.values;

            for (Map<String,dynamic> k in val){
              k.forEach((key, value) {
                if (key=='name') {
                widget.name.add(value);
                }
                if (key=='prn') {
                  widget.prn.add(value);
                }
                if (key=='cgpa') {
                  widget.cgpa.add(value);
                }
                if (key=='company') {
                  widget.com.add(value);
                }
                if (key=='phno') {
                  widget.phno.add(value);
                }
                if (key=='email') {
                  widget.email.add(value);
                }
                });
            }
            
            print(' name ${widget.name}');
            print(' prn ${widget.prn}');
            print(' cgpa ${widget.cgpa}');
            print(' com ${widget.com}');
            print('len ${widget.name.length}');
            return Column(
            children: [
              const SizedBox(height: 30,),
              Center(
                child: Neumorphic(
                  style: const NeumorphicStyle(
                    depth: 5,
                    shadowDarkColor: Color.fromRGBO(136, 188, 218, 1),
                    shadowLightColor: Color.fromRGBO(216, 234, 245, 1),
                  ),
                  child: Container(
                    height: 210,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(186, 220, 237, 1), 
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Name: ${widget.name[count]}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'TextaAltMedium',
                              color: Color.fromRGBO(60, 108, 135, 1),
                            ),  
                          ),
                          Text('PRN: ${widget.prn[count]}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'TextaAltMedium',
                              color: Color.fromRGBO(60, 108, 135, 1),
                            ),  
                          ),
                          Text(
                            'Email: ${widget.email[count]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'TextaAltMedium',
                              color: Color.fromRGBO(60, 108, 135, 1),
                            ),  
                          ),
                          Text(
                            'PHNO: ${widget.phno[count]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'TextaAltMedium',
                              color: Color.fromRGBO(60, 108, 135, 1),
                            ),  
                          ),
                          Text(
                            'CGPA: ${widget.cgpa[count]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'TextaAltMedium',
                              color: Color.fromRGBO(60, 108, 135, 1),
                            ),  
                          ),
                        Text(
                          'Company: ${widget.com[count]}',
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
          );
        }
        ),
      ),
    );
  }
}