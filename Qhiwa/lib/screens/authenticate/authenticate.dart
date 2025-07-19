import "package:first_test/screens/authenticate/sign_in.dart";
import "package:flutter/material.dart";
import "package:first_test/screens/authenticate/register.dart";

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}


class _AuthenticateState extends State<Authenticate> {
      bool SignInform = true ;
      String view = '' ;
      void toggelview()
      {
      setState(() {
        SignInform = !SignInform ;
      });  
      }

  @override
  Widget build(BuildContext context) {
    if(SignInform)
    {
      return Signin(toggelView: toggelview); 
    }
    else 
    {
      return register(toggelView: toggelview);
    }

  }
}