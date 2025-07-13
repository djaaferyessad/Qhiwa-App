import 'package:cloud_firestore/cloud_firestore.dart' ;
import 'package:first_test/models/qhiwas.dart';
import 'package:first_test/models/user.dart';

class Database { 

  final String? uid ;
  Database( {this.uid} ) ;

final CollectionReference qhiwacollection = FirebaseFirestore.instance.collection("Qhiwa") ;

Future updateDateBase ({required String sugar , required String name , required int stregnth}) async 
{ 
    return await qhiwacollection.doc(uid).set( 
      { 

                "name" : name ,
                "sugar" : sugar ,
                "stregnth" : stregnth ,
      }
    ) ;
}

List<qhiwas> _fromSnapshotstoqhiwas (QuerySnapshot snapshot)
{
    return snapshot.docs.map((doc){ 
        final data = doc.data() as Map<String , dynamic> ;
      return qhiwas(
        name: data['name'] ?? '', 
        sugar: data['sugar'] ?? '0', 
        strength: data['stregnth']  ?? 0,
        );
    }).toList() ;  
}   

UserData _fromSnapshotToUserData(DocumentSnapshot snap)
{
  final data = snap.data() as Map<String , dynamic > ;
      return UserData( 
        uid: uid! ,
        name : data['name'] ,
        strength : data['stregnth'] ,
        sugar : data['sugar'] ,
      ) ;
}

Stream<List<qhiwas>> get qhiwa {
  return qhiwacollection.snapshots().map( 
    _fromSnapshotstoqhiwas
  ) ;
}

Stream<UserData> get userData { 
  return qhiwacollection.doc(uid).snapshots().map( 
    _fromSnapshotToUserData
  ) ;
}

}