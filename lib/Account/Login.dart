import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:login_container/show_toast.dart';

class Login_Form extends StatefulWidget {
  const Login_Form({Key? key}) : super(key: key);

  @override
  _Login_FormState createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 170),
      child: Form(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: Text(
                  "Login Tool",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
                  border: OutlineInputBorder(),
                  labelText: 'password',
                  hintText: 'input email',
                ),
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword, //input타입 값을 설정해줌으로
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      }),
                ),
                Text("로그인상태 유지")
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:20,left: 95,right: 100),
                child: OutlinedButton(
                    onPressed: () async{
                      try{
                        print('userlogin');
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                        User? user = userCredential.user;
                        print(user);
                        return showtoast("Login!");
                      }on FirebaseAuthException catch(e){
                        print(e.toString());
                      }
                    }, child: Center(child: Text("로그인",style: TextStyle(fontSize: 18,color: Colors.black),),),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:50,left: 20),
              child: Row(children: <Widget>[
                SignInButtonBuilder(
                  height: 40,
                  width: 170,
                  icon: Icons.message,
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  text: "카카오톡 로그인",
                  backgroundColor: Colors.yellow,
                  onPressed: (){},
                ),
                SizedBox(
                  width: 20,
                ),
                SignInButtonBuilder(
                  height: 40,
                  width: 170,
                  icon: Icons.g_mobiledata,
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  text: "구글 로그인",
                  backgroundColor: Colors.blueAccent,
                  onPressed: () async{
                    try{
                      print('userlogin');
                      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                      User? user = userCredential.user;
                      print(user);
                      return showtoast("Login!");
                    }on FirebaseAuthException catch(e){
                      print(e.toString());
                    }
                  },
                ),

              ],),
            )

          ],
        ),
      ),
    );
  }
}

