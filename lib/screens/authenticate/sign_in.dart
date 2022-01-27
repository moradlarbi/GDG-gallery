import 'package:flutter/material.dart';
import 'package:gdg_gallery_app_prototype/services/auth.dart';
import 'package:gdg_gallery_app_prototype/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState(toggleView: toggleView);
}

class _SignInState extends State<SignIn> {

  final Function toggleView;

  _SignInState({required this.toggleView});

  final AuthService _auth = AuthService();

  String email="";
  String password="";

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to GDG Gallery'),
        actions: [
          FlatButton.icon(
            label: Text("Register"),
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
          RaisedButton(
            onPressed: () async {
              setState(() => loading = true);
              dynamic result = await _auth.signInAnon();
              if (result==null){
                print("error");
              }else{
                print("signed in");
                print(result.uid);
              }

              setState(() => loading = false);
            },
            child: Text('Sign In Anonymously'),
          ),
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
                  child: Text("Sign In"),
                  onPressed: () async {
                    if (email.isNotEmpty && (password.length>=6)){

                      setState(() => loading = true);

                      dynamic result = AuthService().signInWithEmailAndPassword(email, password);
                      if (result == null){
                        print('error registering');
                      }
                    }else{
                      print("Please enter an email and a password longer than 6");

                      setState(() => loading = false);

                    }
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
