import 'package:covid_19/homepage.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/datasource.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Roboto',
      primaryColor: primaryBlack,
    ),
    home: HomePage(),
  ));
}