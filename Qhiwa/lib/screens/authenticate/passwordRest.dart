import 'package:first_test/constants/constant.dart';
import 'package:first_test/services/auth.dart';
import 'package:first_test/services/changeScreen.dart';
import 'package:first_test/shared/constant.dart';
import 'package:first_test/shared/loading.dart';
import 'package:flutter/material.dart';

class PasswordRest extends StatefulWidget {

  @override
  State<PasswordRest> createState() => _PasswordRestState();
}

class _PasswordRestState extends State<PasswordRest> {
  final _formkey = GlobalKey<FormState>() ;
  final AuthServices _auth = AuthServices();

  String email = "" ;
  bool loading = false ;
  String error = '' ;

  @override
  Widget build(BuildContext context) {

    return loading ? Loading() : Scaffold( 
      backgroundColor: QhiwaConstants.backgroundColor,
      appBar: QhiwaAppBar(text: "Password Rest" , CenterTitle: true , 
      leading:   IconButton(
      onPressed: () => QhiwaChanger(RouteName: 'pop').changeroute(context),
       icon: Icon(Icons.arrow_back , color: Colors.white,size: 25,),
       
       ) 
      ),
      
      body: Container(
        padding: EdgeInsets.fromLTRB(60, 0, 60, 100),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column( 
              mainAxisSize: MainAxisSize.min,
              children: [ 
                TextFormField( 
                  decoration: TextInputDecoration.copyWith(hintText: "Enter your Email"),
                  validator: (value) => value!.isEmpty ? "Enter a valid Email" : null,
                  onChanged: (value) {
                     email = value ;
                  },
                ), 
                SizedBox( 
                  height: 20,
                ),
               QhiwaElevatedButton(
                onPressed: () async { 
                    if(_formkey.currentState!.validate())
                    {
                        setState(() {
                          loading = true ;
                        });
                      dynamic resault = await _auth.changepassword(email) ;
                      print("resault is ${resault}" );
                      if(resault == false)
                      {
                        setState(() {
                          loading = false ;
                          error = 'Enter a Valid Email' ;
                        });
                      }
                      else 
                      {
                      setState(() {
                        loading = false ;
                      }); 
                      ScaffoldMessenger.of(context).showSnackBar( 
                        SnackBar(content: Text("Password reset email sent!"))
                      );
                      }
          
          
                    }
                } , 
                text: "Send Rest code",
                
                ),
                SizedBox(height: 10,),
                  Text( 
                    error ,
                    style: TextStyle( 
                      color: Colors.red ,
                    ),
                  )
              ],
            )
            
            
            ),
        ),
      )


    );
  }
}