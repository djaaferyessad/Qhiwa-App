import "package:first_test/constants/constant.dart";
import "package:flutter/material.dart" ;


 const TextInputDecoration = InputDecoration( 
    
    fillColor: Color.fromRGBO(255, 255, 255, 1),
    filled: true,
    enabledBorder: OutlineInputBorder( 
    borderSide: BorderSide( 
      color: QhiwaConstants.TextFieldBorderEnabledColor ,
      width: 2,
    ) ,

  ),
  focusedBorder: OutlineInputBorder( 
    borderSide: BorderSide( 
      color: QhiwaConstants.TextFieldBorderFocusedColor ,
      width: 2,
    ) ,
    
  ),
    );

 AppBar QhiwaAppBar({ String? text , bool? CenterTitle ,  Widget? leading }) { 

  return AppBar( 
        backgroundColor: QhiwaConstants.primaryColor,
        elevation: 0,
        centerTitle: CenterTitle,
        title:  Text(
          text ?? "",
          style: TextStyle( 
            color: Colors.white ,
            fontWeight: FontWeight.bold,
          ),      
          ),
        leading: leading,
          
      );
 }

  Widget QhiwaElevatedButton({required VoidCallback onPressed , required String text})  {                
    
    
    return ElevatedButton(
                  onPressed: onPressed ,
                  style: ElevatedButton.styleFrom( 
                    backgroundColor: QhiwaConstants.primaryColor,
                  ),
                  child: Text( 
                    text, 
                    style: TextStyle( 
                      color: Colors.white,
                    ),
                  
                  ),   
        );
  }


