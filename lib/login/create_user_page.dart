import 'package:flutter/material.dart';
import 'package:ondwaveda/login/data/db.dart';
import 'package:ondwaveda/login/data/model.dart';
import 'package:ondwaveda/login/login_page.dart';
import 'login_warning.dart';

class CreateUserPage extends StatefulWidget {
  static String tag = 'login-page';

  const CreateUserPage({super.key});
  @override
  CreateUserPageState createState() => CreateUserPageState();
}

class CreateUserPageState extends State<CreateUserPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaController2 = TextEditingController();

  String errorMensage = '';


  void login() async {
    List users = await OndwavedaDB.instance.users();

    if(senhaController.text != '' && emailController.text != '') {
      if (senhaController.text == senhaController2.text) {
        for (var element in users) { 
          if(element.toString().contains(emailController.text)){
            errorMensage = 'Usuario já existe';
            setState(() {});
            return;
          }
        }
        await OndwavedaDB.instance.insertUser(Usuario(nome: emailController.text, senha: senhaController.text));
        Navigator.of(context).pop();
      }
      errorMensage = 'As duas senhas devem ser iguais!';
      setState(() {});
      return;
    }
    errorMensage = 'Preencha todos os campos!';
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

    final password2 = TextFormField(
      controller: senhaController2,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'repita a senha',
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
        child: const Text('Criar'),
      ),
    );

    final createLabel = TextButton(
      child: const Text(
        'Voltar',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {Navigator.of(context).pop();},
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
            const SizedBox(height: 8.0),
            password2,
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
