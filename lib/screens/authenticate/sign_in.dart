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
      backgroundColor: Color(0xff00387A),
      appBar: AppBar(
        backgroundColor: Color(0xff00387A),
        elevation: 0.0,
        title: Text(''),
        actions: [

          FlatButton.icon(
            label: Text("Register", style: TextStyle(color: Colors.white),),

            icon: Icon(Icons.person, color: Colors.white,),
            onPressed: () {
              toggleView();
            },

            
          )
        ],
      ),
      body: Container(
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
                    hintText: "password",
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
        ],

        ),
      ),

    );
  }
}
