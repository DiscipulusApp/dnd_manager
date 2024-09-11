import 'package:flutter/services.dart';

class DNDManager {
  static const platform = MethodChannel('dev.harrydekat.dnd_manager/dnd');

  static Future<void> setDNDMode(bool silent) async {
    try {
      await platform.invokeMethod('setDNDMode', {'silent': silent});
    } on PlatformException catch (e) {
      print("Failed to set DND mode: '${e.message}'.");
      rethrow;
    }
  }

  static Future<bool> get hasDNDAccess async {
    try {
      return await platform.invokeMethod('checkDNDAccess');
    } on PlatformException catch (e) {
      print("Failed to check DND access: '${e.message}'.");
      return false;
    }
  }

  static Future<void> requestDNDAccess() async {
    try {
      await platform.invokeMethod('requestDNDAccess');
    } on PlatformException catch (e) {
      print("Failed to request DND access: '${e.message}'.");
      rethrow;
    }
  }

  static Future<bool> get isSilent async {
    try {
      return await platform.invokeMethod('isSilentModeOn');
    } on PlatformException catch (e) {
      print("Failed to check silent mode: '${e.message}'.");
      return false;
    }
  }
}
