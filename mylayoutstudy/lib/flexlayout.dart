import 'package:flutter/material.dart';

class FlexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('FlexLayout'),),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children: <Widget>[
          Text('HelloWorld'),
          Flex(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  color:Colors.red
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.green,
                ),

              )
            ], 
            direction:Axis.horizontal,
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 20
            ),
            child: SizedBox(
              height: 100,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      height: 30,
                    ),
                  )
                ],
              ),
            )
          )

        ],
      ),
    );
  }
  
}