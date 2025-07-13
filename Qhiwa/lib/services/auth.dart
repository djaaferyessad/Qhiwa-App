
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_test/models/user.dart';
import 'package:first_test/services/database.dart';
class AuthServices {

final FirebaseAuth _auth = FirebaseAuth.instance ;

UserF? _FirebaseUser(UserCredential user)
{ 
    return UserF(uid: user.user!.uid);  
}
  // Converts User? to UserF (for the stream)
  UserF? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return UserF(uid: user.uid);
    } else {
      return null;
    }
  }

// auth change user stream 
Stream<UserF?> get user{
  return _auth.authStateChanges().map(_userFromFirebaseUser);
}

// sign in anon 
  Future singinanon() async
  {
    try {
    UserCredential userCredential = await _auth.signInAnonymously();
    return  _FirebaseUser(userCredential);
    }
    catch(e)
    {
      print(e.toString()); 
      return null ;
    }

  }


//sing in pass email 
Future Signinwithemailandpassword(String email , String password) async {
  try {
  UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password) ;
  return _FirebaseUser(userCredential) ;
  }
  catch(e)
  {
    print(e.toString()) ;
    return null ;
  }


}



// sign up 

Future signupwithemailandpassword(String email , String password) async
{ 
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await Database(uid: userCredential.user!.uid).updateDateBase(sugar: '0', name: email.split('@')[0] , stregnth: 100) ;
    return _FirebaseUser(userCredential); 


  } 
  catch(e)
  {
    print(e.toString());
    return null;
  }
}

// sing out 
Future signout() async {
  try{ 
    return await _auth.signOut();
  }
  catch(e)
  {
    print(e.toString()) ;
    return null ;
  }
}



}