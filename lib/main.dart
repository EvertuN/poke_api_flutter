import 'package:flutter/material.dart';
import 'package:poke_api_flutter/view/homePage.dart';

Future<void> main () async {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
