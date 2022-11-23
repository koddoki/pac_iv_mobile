import 'package:flutter/material.dart';
import 'package:ondwaveda/login/create_user_page.dart';
import 'package:ondwaveda/navbar.dart';
import 'login/login_page.dart';
import 'login/login_warning.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    CreateUserPage.tag: (context) => CreateUserPage(),
    LoginWarning.tag: (context) => LoginWarning(),
    Navbar.tag: (context) => Navbar(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ondwaveda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
