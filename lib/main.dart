

import 'package:flutter/material.dart';
import 'package:gdg_gallery_app_prototype/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gdg_gallery_app_prototype/services/auth.dart';
import 'package:provider/provider.dart';

import 'package:gdg_gallery_app_prototype/screens/Wrapper.dart';

import 'Models/FBUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Wrapper(),
    );
  }
}
