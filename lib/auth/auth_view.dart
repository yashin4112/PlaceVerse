import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:placeverse/auth/auth.dart';

import '../admin/view.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                  Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Flexible(
                  //   child: Container(
                  //     margin: EdgeInsets.only(bottom: 20.0),
                  //     padding:
                  //         EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
                  //     transform: Matrix4.rotationZ(-8 * pi / 180)
                  //       ..translate(-10.0),
                  //     // ..translate(-10.0),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: Colors.deepOrange.shade900,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           blurRadius: 8,
                  //           color: Colors.black26,
                  //           offset: Offset(0, 2),
                  //         )
                  //       ],
                  //     ),
                  //     child: Text(
                  //       'PlaceVerse',
                  //       style: TextStyle(
                  //         color: Theme.of(context).accentTextTheme.titleMedium!.color,
                  //         fontSize: 40,
                  //         fontFamily: 'Anton',
                  //         fontWeight: FontWeight.normal,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(key: null,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key? key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  late String email,pass;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.Login) {
      // Log user in
      var user = await Auth.signIn(_authData['email'], _authData['password']);
      Fluttertoast.showToast(msg: 'Login Done');
      if (user != null) {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AdminView()));
      }
      else{
        _isLoading = true;
        Fluttertoast.showToast(msg: 'Sign in Failed');
      }

    } else {
      var id = await Auth.signUp(_authData['email'], _authData['password']);
      print(id);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: _authMode == AuthMode.Signup ? 320 : 260,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Neumorphic(
                  style: NeumorphicStyle(
                    // color: Color.fromARGB(255, 191, 203, 208),
                    // shadowDarkColor: Color.fromARGB(255, 97, 108, 118),
                    // border: NeumorphicBorder(width: 0.3,color: Colors.blueGrey),
                    // depth: 5.0,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                    // surfaceIntensity: 0.5
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                      contentPadding: EdgeInsets.only(left: 15),
                      border: InputBorder.none,  
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                      return null;
                    },
                    onSaved: (value) {
                      _authData['email'] = value!;
                    },
                  ),
                ),
                SizedBox(height: 25,),
                Neumorphic(
                  style: NeumorphicStyle(
                    // shadowLightColor: Color.fromARGB(255, 97, 108, 118),
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      contentPadding: EdgeInsets.only(left: 15),
                      border: InputBorder.none,  
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Password is too short!';
                      }
                    },
                    onSaved: (value) {
                      _authData['password'] = value!;
                    },
                  ),
                ),
                if (_authMode == AuthMode.Signup)
                  // SizedBox(height: 25,),
                  Neumorphic(
                    margin: EdgeInsets.only(top: 25),
                     style: NeumorphicStyle(
                        // shadowLightColor: Color.fromARGB(255, 97, 108, 118),
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                      ),
                    child: TextFormField(
                      enabled: _authMode == AuthMode.Signup,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,    
                      ),
                      obscureText: true,
                      validator: _authMode == AuthMode.Signup
                          ? (value) {
                              if (value != _passwordController.text) {
                                return 'Passwords do not match!';
                              }
                            }
                          : null,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  NeumorphicButton(
                    child:
                        Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                    onPressed: _submit,
                    style: NeumorphicStyle(
                    //  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //   RoundedRectangleBorder(
                    //     // borderRadius: BorderRadius.circular(30),
                        
                    //   )
                    //  ),
                    // shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10.0)),
                      //  boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(7)),
                    //  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 30.0,vertical: 8.0)), 
                    color:Colors.blueGrey.shade100, 
                    //  foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryTextTheme.button.,)
                    ),
                        
                   ),
                
                // TextButton(
                //   child: Text(
                //       '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                //   onPressed: _switchAuthMode,
                //   style: ButtonStyle(
                //      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 30.0,vertical: 4.0)), 
                //      tapTargetSize: MaterialTapTargetSize.shrinkWrap,         
                //     foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),       
                //   ),
                // ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: _switchAuthMode,
                  child: NeumorphicText(
                    '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD',
                    style: NeumorphicStyle(
                      color: Colors.blueGrey.shade200
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
