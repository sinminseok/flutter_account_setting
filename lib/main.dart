import 'package:flutter/material.dart';
import 'package:login_container/auth.dart';
import 'package:login_container/database.dart';
import 'package:login_container/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Account/Sign_page.dart';


void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<DatabaseService?>.value(
      value: AuthService().userState,
      initialData: null,
      child: MaterialApp(
        //Wrapper로 바꿔줘야댐

        home:Wrapper(),
      ),
    );
  }
}
