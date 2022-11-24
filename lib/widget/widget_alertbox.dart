import 'package:flutter/material.dart';
import '../Theme/app_theme.dart';

class AlertBox {
  static Future<String?> alertbox(BuildContext context, String title,
      String message, void Function() onpressedOK) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onpressedOK();
              Navigator.of(context, rootNavigator: true).pop();
            } ,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
