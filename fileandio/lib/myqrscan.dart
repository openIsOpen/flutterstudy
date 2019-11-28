import 'package:flutter/material.dart';
//import  'package:barcode_scan/barcode_scan.dart';

class MyQrScan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyQrScanState();
  }

}

class MyQrScanState extends State<MyQrScan>{
  String _qrStr = "null";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('扫码测试'),),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Content:$_qrStr'),
            RaisedButton(
              child: Text('Scan'),
              color: Colors.blue,
              onPressed: () async {
                //_qrStr= await BarcodeScanner.scan();
                setState(() {
                  
                });
              },
            )
          ],
        ),
      ),
    );
  }

}