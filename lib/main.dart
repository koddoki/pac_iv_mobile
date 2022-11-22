import 'package:flutter/material.dart';
import 'package:ondwaveda/navbar.dart';
import 'login_page.dart';
import 'login_warning.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
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
