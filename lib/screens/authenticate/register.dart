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
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign Up to GDG Gallery'),
        actions: [
          FlatButton.icon(
            label: Text("Sign In"),
            icon: Icon(Icons.person),
            onPressed: () {
                toggleView();
            },


          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(children: [

          Form(
              child: Column(
                children: <Widget> [
                  SizedBox(height: 20.0),
                  TextFormField(
                    onChanged: (val){
                      email=val;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
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

    );
  }
}
