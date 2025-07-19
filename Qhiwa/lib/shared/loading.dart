import 'package:first_test/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' ;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container( 
      color: QhiwaConstants.primaryColor, 
      child: Center(
        child: SpinKitFadingFour( 
          color: QhiwaConstants.loadingSpinColor,
        ),
      ),
    );
  }
}