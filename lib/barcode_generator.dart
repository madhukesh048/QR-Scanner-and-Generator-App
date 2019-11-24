import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

class BarcodeGenerator extends StatefulWidget {
  const BarcodeGenerator({Key key}) : super(key: key);

  @override
  _BarcodeGeneratorState createState() => _BarcodeGeneratorState();
}

class _BarcodeGeneratorState extends State<BarcodeGenerator> {
  GlobalKey globalKey = GlobalKey();
  String _dataString = "";
  String _inputErrorText;
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Barcode Generator'),
        ),
        body: _contentWidget());
  }

  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 20.0,
              right: 10.0,
              bottom: 20.0,
            ),
            child: Container(
              height: 40.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: "Enter a custom message",
                        errorText: _inputErrorText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: FlatButton(
                      color: Colors.amber,
                      child: Text("SUBMIT"),
                      onPressed: () {
                        setState(() {
                          _dataString = _textController.text;
                          _inputErrorText = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: RepaintBoundary(
                key: globalKey,
                child: BarCodeImage(
                  params: Code128BarCodeParams(
                    _dataString,
                    lineWidth: 2.0,
                    barHeight: 90.0,
                    withText: true,
                  ),
                  onError: (error) {
                    print('error = $error');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
