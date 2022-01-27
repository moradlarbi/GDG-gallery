import 'package:flutter/material.dart';
import 'package:gdg_gallery_app_prototype/services/auth.dart';
import 'package:gdg_gallery_app_prototype/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;

  Register({required this.toggleView});


  @override
  _RegisterState createState() => _RegisterState(toggleView: toggleView);
}

class _RegisterState extends State<Register> {

  final Function toggleView;

  _RegisterState({required this.toggleView});

  final AuthService _auth = AuthService();


  String email="";

  String password="";
bool loading = false;

  final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Color(0xff00387A),
      appBar: AppBar(
        backgroundColor: Color(0xff00387A),
        elevation: 0.0,
        title: Text(''),
        actions: [
          FlatButton.icon(
            label: Text("Sign In", style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.person, color: Colors.white),

            onPressed: () {
                toggleView();
            },


          )
        ],
      ),
      body: Center(child: Container(

        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(children: [

          Row(
            children: [

              Image(
                image: AssetImage('lib/assets/Logo-uni-white 1.png'),
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
                image: AssetImage('lib/assets/Logo-uni-white 2.png'),
                width: 38,
                height: 20,
              ),
            ],
          ),
          Form(
              child: Column(
                children: <Widget> [
                  SizedBox(height: 20.0),
                  TextFormField(
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
                      hintText: "email",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                    onChanged: (val){
                      email=val;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.visibility,
                          color: Colors.white,
                          size: 20,
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
                    obscureText: true,
                    onChanged: (val){
                      password = val;
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    child: Text("Register"),
                    onPressed: () async {

                      setState(() => loading=true);
                        if (email.isNotEmpty && (password.length>=6)){
                            dynamic result = AuthService().registerWithEmailAndPassword(email, password);
                            if (result == null){
                              print('error registering');
                            }
                        }else{
                          print("Please enter an email and a password longer than 6");
                        }

                      setState(() => loading=false);

                    },
                  ),
                ],
              )

          ),
        ],

        ),
      ),
    ),

    );
  }
}
