import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_container/show_toast.dart';
import 'database.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<DatabaseService?>get userState{
    return _auth.authStateChanges().map(userFromFirebase);
  }

  DatabaseService? userFromFirebase(User? user){
    return user != null ? DatabaseService(uid: user.uid) : null;
  }
  Future register(String email,String password,String name) async{
    try{
      print('register...');
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      print(user);
      DatabaseService(uid: user!.uid).updateUserData(email,password,name);
      return userFromFirebase(user);
    }catch(e){
      print(e.toString());
    return null;
    }
  }

  Future signOut()async{
    try{
      print('로그아웃 되었습니다');
      return await _auth.signOut();
    }catch(e){
      showtoast("로그아웃 실패");
    }
  }

}