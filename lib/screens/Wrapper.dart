import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdg_gallery_app_prototype/Models/FBUser.dart';
import 'package:gdg_gallery_app_prototype/screens/authenticate/authenticate.dart';
import 'package:gdg_gallery_app_prototype/screens/authenticate/sign_in.dart';
import 'package:gdg_gallery_app_prototype/services/auth.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getLandingPage();
  }

  Widget _getLandingPage() {
    return StreamBuilder<User?>(
      stream: AuthService().user,
      builder: (BuildContext context, snapshot){
        if (snapshot.hasData){
          return Home();
        }else{
          return Authenticate();
        }
      },
    );
  }

}

