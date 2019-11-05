import 'package:flutter/material.dart';

class QRGenerator extends StatelessWidget {
  const QRGenerator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('QR Generator'),
      ),
      body: Center(
        child: Text('generate'),
      ),
    );
  }
}
