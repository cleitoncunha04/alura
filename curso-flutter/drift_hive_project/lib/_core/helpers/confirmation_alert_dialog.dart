import 'package:flutter/material.dart';

Future<dynamic> showConfrimationAlertDialog(
  BuildContext context, {
  String title = 'Deseja confirmar isso?',
  String content = 'Essa ação poderá ser danosa...',
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, false),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
