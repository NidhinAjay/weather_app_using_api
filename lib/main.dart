import 'package:flutter/material.dart';
import 'package:weather_app/home.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home:weather()));
}

class weather extends StatefulWidget {
  const weather({Key? key}) : super(key: key);

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  @override
  Widget build(BuildContext context) {
    return home();
  }
}
