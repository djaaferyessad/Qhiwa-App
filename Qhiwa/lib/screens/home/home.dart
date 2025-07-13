
import 'package:first_test/models/qhiwas.dart';
import 'package:first_test/screens/home/qhiwalist.dart';
import 'package:first_test/screens/home/settings.dart';
import 'package:first_test/services/auth.dart';
import 'package:first_test/services/database.dart';
import 'package:flutter/material.dart' ;
import 'package:provider/provider.dart' ;


class Home extends StatelessWidget {

  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {

      void _showSettingssheet()
      {
        showModalBottomSheet(context: context ,  
        shape:RoundedRectangleBorder( 
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ) , 
        
        builder: (context) {
          
          return Padding(
            padding: EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
          // 👇 Push up based on keyboard height
          //bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
          
            child: Container(
              child: SettingsForm(),
            ),
          ) ;
        }
        );
      }



    return StreamProvider<List<qhiwas>?>.value(
      value: Database().qhiwa,
      initialData: null,
      child: Scaffold( 
        backgroundColor: Colors.brown[50],
        appBar: AppBar( 
          title: Text("9hiwa team ", 
          style: TextStyle( 
            fontWeight: FontWeight.bold ,
            color: Colors.white,
          ),
          ),
          backgroundColor: const Color.fromARGB(255, 138, 101, 68),
          elevation: 5,
          actions: [
          TextButton.icon(
          onPressed:() async {
            await _auth.signout() ;
      
          }, 
          label: Text(
            "Sign out",
            style: TextStyle( 
              color: Colors.black,
            ),
            
            ) ,
          icon: Icon(
            Icons.person,
            color: Colors.black,
            
            ),
          ), 
          TextButton.icon(
            onPressed: () { 
              _showSettingssheet() ;
            }, 
            label: Text(
              "Settings",
              style: TextStyle( 
                color: Colors.black,
              ),
              
              
              ) ,
            icon: Icon( 
              Icons.settings ,
              color: Colors.black,
            ),
            
            )
        
          ],
      
        ),
        body: Container(
          decoration: BoxDecoration( 
            image: DecorationImage(
              image: AssetImage('assets/coffe_background.png'),
              fit: BoxFit.cover ,
              )
          ),
          child: qhiwalist()
          
          
          ),
      
        
      ),
    );
  }
}