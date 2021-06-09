import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../globals.dart';

class SharePage extends StatefulWidget {
  SharePage({this.preview, this.image});
  final String preview;
  final File image;

  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: background,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Share Poster!'),
          backgroundColor: background,
          elevation: 10,
          centerTitle: true,
          actions: [
            ElevatedButton(
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
                },
              child: Icon(Icons.save, color: button,),
              style: ElevatedButton.styleFrom(primary: background,elevation: 0.0),
            ),
          ],
        ),
        body: Container(
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: widget.image == null
                          ? Image.asset(widget.preview, fit: BoxFit.fill,)
                          : Image.file(widget.image),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    Container(
                      width:
                      MediaQuery.of(context).size.width * 0.35,
                      height:
                      MediaQuery.of(context).size.height * 0.10,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _onShare(widget.preview, widget.image);
                            },
                          icon: Icon(Icons.share_outlined),
                          label: Text(
                            'Share',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: button,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            side: BorderSide(
                              width: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _onShare(asset, file) async{
  final ByteData bytes = (file == null)
      ? await rootBundle.load(asset)
      : await rootBundle.load(file);
  await Share.file('Poster', 'poster.png', bytes.buffer.asUint8List(), 'image/png');
}