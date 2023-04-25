import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Placement',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        // leading: Icon(Icons.place_outlined),
        centerTitle: true,
        toolbarHeight: 50,
        leadingWidth: 70,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              height: 350,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade300.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'tahoma',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: Colors.blueGrey.shade400.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 1,
                        ),
                        SizedBox(
                            width: 330,
                            height: 70,
                            child: TextField(
                              style: TextStyle(color: Colors.grey),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(.08),
                                  prefixIcon: Icon(
                                    Icons.person_outlined,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  labelText: 'Enter your Username',
                                  labelStyle: TextStyle(
                                      color: Colors.grey.withOpacity(.8)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(30)
                                          .copyWith(
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(30)
                                          .copyWith(
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(0)))),
                            ))
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 1,
                        ),
                        SizedBox(
                            width: 330,
                            height: 70,
                            child: TextField(
                              style: TextStyle(color: Colors.grey),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(.08),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  labelText: 'Enter your Password',
                                  labelStyle: TextStyle(
                                      color: Colors.grey.withOpacity(.8)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(30)
                                          .copyWith(
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(30)
                                          .copyWith(
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(0)))),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      Fluttertoast.showToast(msg: 'Login Successfull');
                    },
                    child: Container(
                      height: 70,
                      width: 170,
                      alignment: Alignment.center,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Tahoma',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.shade400,
                              offset: const Offset(0, 10),
                              blurRadius: 15,
                              spreadRadius: -5,
                            ),
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.blueGrey.shade100,
                                Colors.blueGrey.shade200,
                                Colors.blueGrey.shade600,
                                Colors.blueGrey.shade600,
                              ],
                              stops: const [
                                0.1,
                                0.3,
                                0.9,
                                1.1
                              ]
                          ),
                      ),
                                ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
