
import 'package:first_test/services/auth.dart';
import 'package:first_test/shared/constant.dart';
import 'package:first_test/shared/loading.dart';
import 'package:flutter/material.dart' ;

class register extends StatefulWidget {
  final Function toggelView ; 
  const register({super.key , required this.toggelView});



  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

final AuthServices _auth = AuthServices() ;


String email = '' ;
String password = '';
String confirmedpassword = '';
String error = '' ;
bool loading = false ;
final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.brown[100],
      appBar: AppBar( 
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text(
          "Sign Up to 9hiwa",
          style: TextStyle( 
            color: Colors.white ,
            fontWeight: FontWeight.bold,
          ),
          
          ),
      ),
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
                  decoration: TextInputDecoration.copyWith(hintText: "Email") ,
                  validator: (val) => val!.isEmpty ? "Enter the email" : null ,
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
                  validator: (val) => val!.length < 6 ? "Password less then 6 charachters " : null ,
                  onChanged: (val) { 
                    password = val ;
                  },
                ) ,
                SizedBox(height: 20,), 
                TextFormField( 
                  obscureText: true,
                  decoration:  TextInputDecoration.copyWith(hintText: "Confirm Password"),
                  validator: (value) => value != password ? "Passwrod are not the same " : null ,
              
                  onChanged: (val) { 
                    confirmedpassword = val ;
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
                        dynamic resault = await _auth.signupwithemailandpassword(email, password) ;
                        print("the resault $resault") ;
                        if(resault == null)
                        {
                          setState(() {
                            loading = false ;
                              error = "Please enter a valid email" ;
                          });
                        
                        }
                      }
                    
              
                  }, 
                  style: ElevatedButton.styleFrom( 
                    backgroundColor: Colors.brown[400],
                  ),
                  child: Text( 
                    'Sign Up', 
                    style: TextStyle( 
                      color: Colors.white,
                    ),
                  
                  ),   
                  ), 
                  TextButton.icon(onPressed: () { 
                   widget.toggelView();
                  },
                   label: Text("Sign in"),
              
                   ),
                   SizedBox(height: 12,) ,
                   Text( 
                    "$error",
                    style: TextStyle( 
                      color:  Colors.red ,
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