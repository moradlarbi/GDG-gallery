import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String username = '';
  String email = '';
  String password = '';
  bool _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00387A),
      body: SingleChildScrollView(
        child: Container(
            color: Color.fromARGB(1, 0, 56, 122),
            width: 360,
            height: 600,
            child: Column(
              children: [
                SizedBox(
                  height: 44,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 28,
                    ),
                    Image(
                      image: AssetImage('assets/Logo-uni-white 1.png'),
                      width: 38,
                      height: 20,
                    ),
                    SizedBox(
                      width: 94,
                    ),
                    Container(
                      width: 61,
                      height: 56,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 6),
                          Container(
                            width: 41,
                            height: 33,
                            alignment: Alignment.center,
                            color: Color(0xff00387A),
                            child: Text(
                              'GDG',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Gallery',
                            style: TextStyle(
                              color: Color(0xff00387A),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Image(
                      image: AssetImage('assets/Logo-uni-white 2.png'),
                      width: 38,
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(height: 100),
                Text(
                  'Sign up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 35),
                      Container(
                        alignment: Alignment.center,
                        width: 265,
                        height: 41,
                        child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 20,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              hintText: "username",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                            ),
                            validator: (newText) => newText!.length < 5
                                ? "username too short"
                                : null,
                            keyboardType: TextInputType.text,
                            onChanged: (newText) {
                              username = newText;
                            }),
                        decoration: BoxDecoration(
                            color: Color(0xff00387A),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 265,
                        height: 41,
                        child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              hintText: "email address",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                            ),
                            validator: (newText) =>
                                newText!.isEmpty ? "email address" : null,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (newText) {
                              email = newText;
                            }),
                        decoration: BoxDecoration(
                            color: Color(0xff00387A),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 265,
                        height: 41,
                        child: TextFormField(
                            obscureText: !_passwordVisible,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              hintText: "new password",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                            ),
                            validator: (newText) => newText!.length < 6
                                ? "password too short"
                                : null,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (newText) {
                              password = newText;
                            }),
                        decoration: BoxDecoration(
                          color: Color(0xff00387A),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 130),
                          Text(
                            'already have an account?',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Color(0xffE3F2FD),
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //send the data to Firebase
                            try {
                              print(email);
                              print(password);
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: email, password: password);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                        child: Container(
                          width: 93,
                          height: 36,
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Color.fromARGB(50, 0, 117, 255),
                          backgroundColor: Color.fromARGB(50, 0, 117, 255),
                          onSurface: Colors.grey,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                            color: Color.fromARGB(1, 117, 255, 0),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
