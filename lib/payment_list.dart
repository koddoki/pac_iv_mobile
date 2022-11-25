import 'package:flutter/material.dart';

class PaymentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const <Widget>[
        Card(
            child: ListTile(
                title: Text("\$Usuário que pagou"),
                subtitle: Text("\$Nome do plano"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('user.png'),
                ),
                trailing: Icon(
                  Icons.done,
                  color: Colors.green,
                ))),
        Card(
            child: ListTile(
                title: Text("\$Usuário que não pagou"),
                subtitle: Text("\$Nome do plano"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('user.png'),
                ),
                trailing: Icon(
                  Icons.close,
                  color: Colors.red,
                ))),
      ],
    );
  }
}
