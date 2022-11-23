import 'package:flutter/material.dart';
import 'package:ondwaveda/login/create_user_page.dart';
import 'package:ondwaveda/login/data/db.dart';
import 'login_warning.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  const LoginPage({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  String errorMensage = '';

  void login() async {
    List user = await OndwavedaDB.instance.searchUser(emailController.text, senhaController.text);

    if (user.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed(LoginWarning.tag);
    }
    errorMensage = 'Usuario Invalido';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'e-mail@ondwaveda.com',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: senhaController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'senha',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(12),
    );
    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: style,
        onPressed: ()=> login(),
        child: const Text('Entrar'),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(24),
        // ),
        // padding: EdgeInsets.all(12),
        // color: Colors.lightBlueAccent,
        // child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final createLabel = TextButton(
      child: const Text(
        'Criar conta',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {Navigator.of(context).pushNamed(CreateUserPage.tag);},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            const SizedBox(height: 48.0),
            email,
            const SizedBox(height: 8.0),
            password,
            errorMensage != '' ? Text(errorMensage,style: const TextStyle(color: Colors.red),textAlign: TextAlign.center,) : const SizedBox(),
            const SizedBox(height: 24.0),
            loginButton,
            createLabel
          ],
        ),
      ),
    );
  }
}
