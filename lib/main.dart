import 'dart:developer';

import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:ondwaveda/navbar.dart';
import 'login_page.dart';
import 'login_warning.dart';
=======
import 'package:ondwaveda/login/create_user_page.dart';
import 'package:ondwaveda/login/data/provider.dart';
import 'package:ondwaveda/navbar.dart';
import 'package:provider/provider.dart';
import 'login/login_page.dart';
import 'login/login_warning.dart';
>>>>>>> Stashed changes

void main() => runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => EventProvider()),
    
  ], child: MyApp(),)
 );

class MyApp extends StatelessWidget {
<<<<<<< Updated upstream
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    LoginWarning.tag: (context) => LoginWarning(),
    Navbar.tag: (context) => Navbar(),
  };
=======
  const MyApp({super.key});

  // final routes = <String, WidgetBuilder>{
  //   LoginPage.tag: (context) => LoginPage(),
  //   CreateUserPage.tag: (context) => CreateUserPage(),
  //   LoginWarning.tag: (context) => LoginWarning(),
  //   Navbar.tag: (context) => Navbar(),
  //};
>>>>>>> Stashed changes

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ondwaveda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      initialRoute: LoginPage.tag,
      //routes: routes,
      onGenerateRoute: onGenerateRoute,
    );
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
   
    switch (settings.name) {
      case "login-page":
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );

      case "create-user":
        return MaterialPageRoute(
          builder: (context) => CreateUserPage(),
        );
      case "loginWarning-page":
        return MaterialPageRoute(
            builder: (context) => LoginWarning(
                (settings.arguments as Map)["usuario"][0]["nome"]));
      case "navbar-page": 
         return MaterialPageRoute(
            builder: (context) => Navbar());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                  "Erro Detectad0 \n entre em contato em: http://top5nacional.com"),
            ),
          ),
        );
    }
  }
}
