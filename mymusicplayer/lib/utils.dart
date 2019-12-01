import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class Utils{
  
  static Future<void> getPermission() async {
    if (Platform.isAndroid) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      }
    } else if (Platform.isIOS) {}
  }
}