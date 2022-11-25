import 'package:flutter/widgets.dart';
import 'package:ondwaveda/login/data/db.dart';
import 'package:ondwaveda/login/data/model.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();

  Usuario a = Usuario(nome: 'test', senha: 'test123');


  //await OndwavedaDB.instance.insertUser(a);
  //print(await OndwavedaDB.instance.searchUser('test1', 'test123'));
  print(await OndwavedaDB.instance.users());
}