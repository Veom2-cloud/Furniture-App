// @dart=2.9

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furnitureapp/pages/authbloc.dart';
import 'package:furnitureapp/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:furnitureapp/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
