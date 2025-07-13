import 'package:first_test/models/user.dart';
import 'package:first_test/services/database.dart';
import 'package:first_test/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:first_test/shared/constant.dart' ;
import 'package:provider/provider.dart';
//import 'package:first_test/services/database.dart' ;

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

final _formkey = GlobalKey<FormState>() ;
String _currentName = '' ;
int _currentStrength = 0 ;
String _currentSugar = '' ;
List<String> Sugars = ['0' , '1' , '2' , '3' , '4'] ;
String error = "" ;


  @override
  Widget build(BuildContext context) {
  final user = Provider.of<UserF?>(context) ;
    return StreamBuilder<UserData>(
      stream: Database(uid: user!.uid).userData,
      builder: (context, snapshot) 
      {
        if(snapshot.hasData)
        {
          UserData? userdata = snapshot.data ;
          return Form(
           key: _formkey,
          child:  Column( 
          children: [ 
            Text(
              "Update your 9hiwa settings ",
              style: TextStyle( 
                fontSize: 15 ,
                fontWeight: FontWeight.bold,
              ),
              
              ),
            SizedBox(height: 30,),
            TextFormField( 
              initialValue: userdata!.name,
              decoration: TextInputDecoration.copyWith(fillColor: Colors.brown[100] , hintText: "Name"),
              validator: (value) => value!.isEmpty ? "Enter a valid name" : null,
              onChanged: (value) => setState(() {
                _currentName = value;
              })
                
            ),
            SizedBox(height: 20,) ,
            DropdownButtonFormField(
              value: _currentSugar.isEmpty ? userdata.sugar : _currentSugar  ,
              items: Sugars.map((sugar) { 
                  return DropdownMenuItem(
                    value: sugar,
                    child: Text("${sugar} Sugar(s)"),
                    );
              }).toList() ,
               onChanged: (value) => setState(() {
                  _currentSugar = value.toString() ;
               })
               ), 
                
               SizedBox(height: 30,),
               Text(
                "Choose your coffee strength ",
                style: TextStyle( 
                  color: Colors.black,
                ),
               ),
               SizedBox(height: 10,),
               // slider 
               Slider(
                value: _currentStrength == 0 ?  userdata.strength.toDouble() : _currentStrength.toDouble(), 
                activeColor: Colors.brown[_currentStrength == 0 ?  userdata.strength : _currentStrength],
                inactiveColor: Colors.brown[_currentStrength == 0 ?  userdata.strength : _currentStrength],
                min: 100,
                max: 900,
                divisions: 2,
                  onChanged: (value) => setState(() {
                  _currentStrength = value.round() ;
                }),
                
                
                ),
               //button update 
               ElevatedButton(
                
                onPressed: (){ 
                  if(_formkey.currentState!.validate())
                  {
                    Database(uid: user.uid).updateDateBase(sugar: _currentSugar == '' ? userdata.sugar : _currentSugar , name: _currentName == '' ? userdata.name : _currentName , 
                   stregnth: _currentStrength == 0 ? userdata.strength : _currentStrength    );
                  }
                  Navigator.pop(context);
                
                }, 
                style: ElevatedButton.styleFrom( 
                  backgroundColor: Colors.brown ,
                ),
                child: Text( 
                  "Update" ,
                  style: TextStyle( 
                    color: Colors.white ,
                  ),
                ) ,
                
                
                )
          ],
                  ) 
                );
        }
        else 
        {
          return Loading() ;
        }
      }
    );


  }
}