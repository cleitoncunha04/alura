import 'package:api_project/models/custom_snackbar_enum.dart';
import 'package:flutter/material.dart';

showCustomSnackBar({
  required BuildContext context,
  required CustomSnackBarTypes type,
  required String content,
}) {
  if (type == CustomSnackBarTypes.success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              content,
              overflow: TextOverflow.ellipsis,
            ),
            const Icon(
              Icons.done,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 320,
              child: Text(
                content,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.warning,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
