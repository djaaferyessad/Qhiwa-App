import 'package:firebase_core/firebase_core.dart';
import 'package:first_test/firebase_options.dart';
import 'package:first_test/screens/wrraper.dart';
import 'package:first_test/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_test/models/user.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform , );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserF?>.value(
      value: AuthServices().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: Wrapper(),
      ),
    );
  }
}

