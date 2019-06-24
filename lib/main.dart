import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/models.dart';
import 'package:flutter_quiz_app/screens/screens.dart';
import 'package:flutter_quiz_app/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: AuthService().user),
        StreamProvider<Report>.value(value: Global.reportRef.documentStream)
      ],
      child: MaterialApp(
        //Named Routes
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/topics': (context) => TopicScreen(),
          '/profile': (context) => ProfileScreen(),
          '/about': (context) => AboutScreen(),
        },

        // Theme
        theme: ThemeData(
            fontFamily: 'Nunito',
            bottomAppBarTheme: BottomAppBarTheme(
              color: Colors.black87,
            ),
            brightness: Brightness.dark,
            textTheme: TextTheme(
              body1: TextStyle(fontSize: 18),
              body2: TextStyle(fontSize: 16),
              button:
                  TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
              headline: TextStyle(fontWeight: FontWeight.bold),
              subhead: TextStyle(color: Colors.grey),
            ),
            buttonTheme: ButtonThemeData()),
      ),
    );
  }
}
