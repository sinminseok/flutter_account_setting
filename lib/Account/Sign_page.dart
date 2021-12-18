import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ChangeSign.dart';
import 'Login.dart';
import 'Register.dart';

class Sign_Page extends StatefulWidget {
  @override
  _Sign_PageState createState() => _Sign_PageState();
}

class _Sign_PageState extends State<Sign_Page> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ChangeSign>(
      create: (_) => ChangeSign(),
      child: Sign_controller(size),
    );
  }

  Widget Sign_controller(size) {
    return Consumer<ChangeSign>(
      builder: (context, value, child) => Stack(children: <Widget>[
        _Email_Password_background(),
        if (value.getStandardSign()) not_account(size),
        if (!value.getStandardSign()) have_account()
      ]),
    );
  }

  Widget _Email_Password_background() {
    return Consumer<ChangeSign>(
      builder: (context, value, child) => Card(
        color: Colors.white,
        child: value.getStandardSign() ? Login_Form() : SignUp_Form(),
      ),
    );
  }

  Widget not_account(Size size) {
    //postioned stack의 자식으로 위치 조절이가능하다.
    return Positioned(
      left: 250,
      right: 10,
      top: 410,
      child: Consumer<ChangeSign>(
        builder: (context, value, child) => FlatButton(
          child: Text('회원가입 '),
          onPressed: () {
            value.Change_Sign();
          },
        ),
      ),
    );
  }

  Widget have_account() {
    return Positioned(
      left: 10,
      right: 10,
      top: 480,
      child: Consumer<ChangeSign>(
        builder: (context, value, child) => FlatButton(
          child: Text('로그인 '),
          onPressed: () {
            value.Change_Sign();
          },
        ),
      ),
    );
  }
}
