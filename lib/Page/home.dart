import 'package:flutter/material.dart';
import 'package:login_container/auth.dart';

class Home extends StatefulWidget {
  final String? uid;
  Home({required this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(child: Text("Home!"),),
        ),
        RaisedButton(onPressed: ()async{AuthService().signOut();})
      ],
    );
  }
}
