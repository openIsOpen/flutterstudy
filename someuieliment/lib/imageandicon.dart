import 'package:flutter/material.dart';

class ImageAndIcon extends StatelessWidget{
  final String icon = "\uE914 \uE000 \uE90D";
  /*
  ImageAndIcon(){  
    // accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
    // error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
    // fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image&Icons'),),
      body: Column(
        children: <Widget>[
          Image(
            image: AssetImage('images/1.jpg'),
            width: 200,
          ),
          Image(
            image: NetworkImage('http://pic15.nipic.com/20110809/2852987_102440194840_2.jpg'),
            width: 200,
            //color: Colors.blue,
            //colorBlendMode: BlendMode.dstOut,
          ),
          
          Text(icon,
        style: TextStyle(
            fontFamily: "MaterialIcons",
            fontSize: 24.0,
            color: Colors.green
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.accessible,color: Colors.green,),
              Icon(Icons.error,color: Colors.green,),
              Icon(Icons.fingerprint,color: Colors.green,),
            ],
          )

        ],
      ),
    );
  }

}