import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan',
      home: Scan(),
    );
  }
}

class Scan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScanState();
  }
}

class ScanState extends State<Scan> {
  String qrStr = 'null';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('扫码练习'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Content:$qrStr',
                  style: TextStyle(fontSize: 30),
                ),
                RaisedButton(
                  child: Text('扫 码'),
                  color: Colors.blue,
                  onPressed: () async {
                    qrStr = await BarcodeScanner.scan();
                    setState(() {});
                  },
                )
              ],
            ),
          ],
        ));
  }
}
