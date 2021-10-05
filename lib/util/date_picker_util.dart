import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerUtil {
  static void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onPressed,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          child,
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Done'),
          onPressed: onPressed,
        ),
      ),
    );
  }

  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(fontSize: 24),
      ),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
