import 'package:flutter/material.dart';
import '../navbar.dart';

class LoginWarning extends StatelessWidget {
  static String tag = 'loginWarning-page';

  const LoginWarning({super.key});

  @override
  Widget build(BuildContext context) {
    const userIcon = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('user.png'),
        ),
      ),
    );

    const welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Bem vindo de volta, userName!',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    const lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Você tem XX atividades para hoje.\nXX de seus alunos ainda não pagaram o boleto do mês.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    final nextButton = ElevatedButton(
      style: style,
      onPressed: () {
        Navigator.of(context).pushNamed(Navbar.tag);
      },
      child: const Text('Certo!'),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(28.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children:  <Widget>[userIcon, welcome, lorem, nextButton],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
