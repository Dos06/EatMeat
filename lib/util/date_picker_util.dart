import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension DateTimeRoundExtension on DateTime {
  DateTime roundDown({Duration delta = const Duration(minutes: 15)}) {
    return DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds);
  }

  DateTime roundUp({Duration delta = const Duration(minutes: 15)}) {
    return DateTime.fromMillisecondsSinceEpoch(
        delta.inMilliseconds + millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds);
  }
}

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
