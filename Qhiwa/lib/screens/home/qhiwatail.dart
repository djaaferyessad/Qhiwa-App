import 'package:first_test/models/qhiwas.dart';
import 'package:flutter/material.dart';

class Qhiwatail extends StatelessWidget {

final qhiwas qhwa  ; 
const Qhiwatail({required this.qhwa}) ;

  @override
  Widget build(BuildContext context) {
    return Padding
    (
      padding: EdgeInsets.only(top: 10) ,
      child: Card( 
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile( 
          leading: CircleAvatar( 
            backgroundColor: Colors.brown[qhwa.strength],
            radius: 20,
            backgroundImage: AssetImage('assets/coffee_icon.png'),
            
          ),
          title: Text(qhwa.name),
          subtitle: Text("Takes ${qhwa.sugar} sugar(s)"),

        ),
      ),

    
    );
  }
}