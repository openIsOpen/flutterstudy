import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body:Center(
        child: Text('Home'),
      )
    );
  }
}

class Email_Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email'),),
      body:Center(
        child: Text('Email'),
      )
    );
  }
}

class Page_Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page'),),
      body:Center(
        child: Text('Page'),
      )
    );
  }
}

class AirPlay_Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AirPlay'),),
      body:Center(
        child: Text('AirPlay'),
      )
    );
  }
}