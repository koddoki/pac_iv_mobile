import 'package:flutter/material.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(flex: 3),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.only(left: 20),
          height: 250,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Aulas Diarias",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
        Spacer(flex: 2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.only(left: 20),
          height: 250,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Pendencias",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
