
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_container/auth.dart';

import '../show_toast.dart';
class SignUp_Form extends StatefulWidget {

  @override
  _SignUp_FormState createState() => _SignUp_FormState();
}

class _SignUp_FormState extends State<SignUp_Form> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Form(
        child: ListView(
          children: <Widget>[
            Center(child: Text("회원가입",style: TextStyle(fontSize: 20),),),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'id',
                  hintText: 'input email',
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress, //input타입 값을 설정해줌으로
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'password',
                  hintText: 'input email',
                ),
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword, //inp
                obscureText: true,// ut타입 값을 설정해줌으로
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'confirm password',
                  hintText: 'input email',
                ),
                controller: _confirmpasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,//input타입 값을 설정해줌으로
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'name',
                  hintText: 'input email',
                ),
                controller: _nameController,
                keyboardType: TextInputType.visiblePassword, //input타입 값을 설정해줌으로
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:100,left: 95,right: 100),
              child: OutlinedButton(
                onPressed: () async{
                  if(_passwordController.text != _confirmpasswordController){
                    showtoast("password is not confirm");
                  }try{
                    await AuthService().register(_emailController.text, _passwordController.text, _nameController.text);
                    return showtoast("complete register!");
                  }catch(e){
                    print(e.toString());
                  }
                }, child: Center(child: Text("회원가입",style: TextStyle(fontSize: 18,color: Colors.black),),),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
