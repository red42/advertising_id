import 'dart:async';

import 'package:flutter/services.dart';

class AdvertisingId {
  static const MethodChannel _channel =
      const MethodChannel('advertising_id');

  static Future<AdvertisingIdInfo> get advertisingIdInfo async {
    final Map<dynamic, dynamic> info = await _channel.invokeMethod('getAdvertisingId');
    return AdvertisingIdInfo(info['advertising_id'], info['tracking_allowed']);
  }
}

class AdvertisingIdInfo {
  final String advertisingId;
  final bool trackingAllowed;

  AdvertisingIdInfo(this.advertisingId, this.trackingAllowed);
}