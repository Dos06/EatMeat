import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Util extends StatelessWidget {
  const Util({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static Widget createDialog(
    BuildContext context, {
    required String title,
    String? content,
    List<CupertinoDialogAction>? actions,
  }) =>
      CupertinoAlertDialog(
        title: Text(title),
        content: Text(content!),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            child: const Text(
              'Confirm',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
}
