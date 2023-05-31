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
            decoration: const BoxDecoration(
              color: Color.fromRGBO(186, 220, 237, 1),
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
      if (user != null) {
        Fluttertoast.showToast(msg: 'Login Done');
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AdminView(user: user,)));
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
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(20))),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
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
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10.0)),
                      color:Colors.blueGrey.shade100, 
                    ),
                        
                   ),
                
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
