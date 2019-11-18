import 'package:flutter/material.dart';

class HeroPageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text('HeroPageB'),
      ),
      */
      body: Hero(
        child: Image.asset('images/1.JPG'),
        tag: 'hello',
      ),
    );
  }
}

class HeroPageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PageA'),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: InkWell(
            child: Hero(
              tag: 'hello',
              child: ClipOval(
                child: Image.asset(
                  'images/1.JPG',
                  width: 50,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, PageRouteBuilder(pageBuilder:
                  (BuildContext context, Animation animation,
                      Animation secondAnimation) {
                return new FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text('原图'),
                    ),
                    body: HeroPageB(),
                  ),
                );
              }));
            },
          ),
        ));
  }
}
