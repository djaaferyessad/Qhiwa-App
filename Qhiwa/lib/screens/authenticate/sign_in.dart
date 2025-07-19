
import 'package:first_test/services/auth.dart';
import 'package:first_test/services/changeScreen.dart';
import 'package:first_test/shared/constant.dart';
import 'package:first_test/shared/loading.dart';
import 'package:flutter/material.dart' ;

class Signin extends StatefulWidget {
   final Function toggelView ;
  const Signin({super.key , required this.toggelView});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

final AuthServices _auth = AuthServices() ;
String email = '' ;
String password = '';
String error = "" ;
bool loading = false ;
final _formkey = GlobalKey<FormState>() ;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :  Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: QhiwaAppBar(text: "Sign up" ,CenterTitle:  false),
      body:  Container( 
        padding: EdgeInsets.symmetric(vertical: 20 ,horizontal: 50),
        child: SingleChildScrollView(
          child: Form( 
            key: _formkey,
            child: Column( 
              children: [ 
                SizedBox( 
                  height: 20,
                ), 
                TextFormField( 
                  decoration: TextInputDecoration.copyWith(hintText: "Email"),
                  validator: (value) => value!.isEmpty ? "Enter a valid Email" : null,
                  onChanged: (val) {
                    setState(() {
                        email = val ;
                    });
                  },
                ), 
                SizedBox( 
                  height: 20,
                ), 
                TextFormField( 
                  obscureText: true,
                decoration: TextInputDecoration.copyWith(hintText: "Password"),
                validator: (value) => value!.length < 6 ? "Password is less then 6 chars long" : null,
                  onChanged: (val) { 
                    password = val ;
                  },
                ) ,
                SizedBox(height: 20,), 
                ElevatedButton(
                  onPressed: () async {
                    if(_formkey.currentState!.validate())
                    {
                      setState(() {
                        loading = true ;
                      });
                      dynamic resault = await _auth.Signinwithemailandpassword(email, password) ;
          
                      if(resault == null) 
                      {
                        setState(() {
                          loading = false ;
                          error = "Password or Email incorrect" ;
                        });
                      }
                    }
          
                  }, 
                  style: ElevatedButton.styleFrom( 
                    backgroundColor: Colors.brown[400],
                  ),
                  child: Text( 
                    'Sign in', 
                    style: TextStyle( 
                      color: Colors.white,
                    ),
                  
                  ),  
                  ),
                  SizedBox( 
                    height: 5,
                  ), 
                  TextButton(onPressed: () { 
                   widget.toggelView();
                  },
                   child: Text("Sign up"  ,
                   style: TextStyle( 
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                   ),
                   ),
              
                   ),
                TextButton.icon(onPressed: () { 
                   QhiwaChanger(RouteName:  'RestPassword').changeroute(context);
                  },
                   label: Text("Forgot Password !" , style: TextStyle( 
                    color: Colors.brown,
                    
                   ), ),),

                   SizedBox(height: 12,) ,
                   Text(
                    error ,
                    style: TextStyle( 
                      color: Colors.red ,
                      fontSize: 12 ,
          
                    ),
                   )
              ],
          
            ),
          
          ),
        ),

            ),
      );
  }
}