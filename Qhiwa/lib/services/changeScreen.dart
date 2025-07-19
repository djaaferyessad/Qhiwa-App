
import 'package:first_test/screens/authenticate/authenticate.dart';
import 'package:first_test/screens/authenticate/passwordRest.dart';
import 'package:flutter/material.dart';

class QhiwaChanger { 
  String RouteName ;
  Authenticate auth = Authenticate() ;
  QhiwaChanger( {required this.RouteName}) ;

    void changeroute(BuildContext context) 
    { 
      switch(RouteName)
      { 
        case "RestPassword" :
        Navigator.of(context).push( 
          MaterialPageRoute(builder: (context) => PasswordRest()) 
        );
        break ;
        default :
         Navigator.of(context).pop();
         break ;
      }
    }
}