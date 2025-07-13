import "package:first_test/screens/authenticate/authenticate.dart";
import "package:first_test/screens/home/home.dart";
import "package:flutter/material.dart" ;
import "package:provider/provider.dart";
import 'package:first_test/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserF?>(context) ;

    if(user == null)
    {
      return Authenticate() ;
    }
    else
    return Home();
    
  }
}