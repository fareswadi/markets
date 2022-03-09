import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/bloc/CubitsHome.dart';
import 'package:markets/bloc/cubitsAuth.dart';
import 'package:markets/homepage.dart';
import 'package:markets/welcomePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp
  ]);
  runApp(

      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CubitdoAuth(),
          ),
          BlocProvider(
            create: (context) => CubitsHome(),
          ),
        ],
        child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        scaffoldBackgroundColor: Color(0XFF202040),
       bottomSheetTheme: BottomSheetThemeData(
         backgroundColor: Colors.transparent,
       ),
        /*iconTheme: IconThemeData(
          color: Colors.white,

        ),*/
        textTheme: TextTheme(
          headline4: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700
          )
        ),
      ),

      home:  HomePage(),

    );
  }
}

