import 'package:flutter/material.dart';
import 'home_page.dart';

void main(){
  runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey),
      title: "IMC",
      home: Home(),
    )
  );
}