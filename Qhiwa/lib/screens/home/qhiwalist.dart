import 'package:first_test/models/qhiwas.dart';
import 'package:first_test/screens/home/qhiwatail.dart';
import 'package:flutter/material.dart' ;
import 'package:provider/provider.dart';

class qhiwalist extends StatefulWidget {
  const qhiwalist({super.key});

  @override
  State<qhiwalist> createState() => _qhiwalistState();
}

class _qhiwalistState extends State<qhiwalist> {


  @override
  Widget build(BuildContext context) {
  final qhiwa = Provider.of<List<qhiwas>?>(context) ;

    return ListView.builder(
          itemCount: qhiwa?.length,
          itemBuilder:  (context , index)
          {
            if(qhiwa != null)
            {
            return Qhiwatail(qhwa: qhiwa[index]) ;
            }
          }
        
        
        );
  }
}