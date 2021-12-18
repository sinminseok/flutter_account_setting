import 'package:flutter/material.dart';
import 'package:login_container/database.dart';
import 'package:provider/provider.dart';
import 'Account/Sign_page.dart';
import 'Page/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<DatabaseService?>(context);
    print('wrapper_page');

    if(providerUser == null){
      return Sign_Page();
    }else{
      return Home(uid:providerUser.uid);
    }
  }
}
