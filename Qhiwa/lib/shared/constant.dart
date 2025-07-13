import "package:flutter/material.dart" ;

const TextInputDecoration = InputDecoration( 
    
    fillColor: Color.fromRGBO(255, 255, 255, 1),
    filled: true,
    enabledBorder: OutlineInputBorder( 
    borderSide: BorderSide( 
      color: Colors.black ,
      width: 2,
    ) ,

  ),
  focusedBorder: OutlineInputBorder( 
    borderSide: BorderSide( 
      color: Colors.brown ,
      width: 2,
    ) ,
    
  ),
                );