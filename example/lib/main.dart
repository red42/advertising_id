import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:advertising_id/advertising_id.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AdvertisingIdInfo _advertisingIdInfo;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    AdvertisingIdInfo advertisingIdInfo;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      advertisingIdInfo = await AdvertisingId.advertisingIdInfo;
    } on PlatformException {
      advertisingIdInfo = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted)
      return;

    setState(() {
      _advertisingIdInfo = advertisingIdInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Center(
          child: new Text('Advertising Id: ${_advertisingIdInfo.advertisingId}'),
        ),
      ),
    );
  }
}
