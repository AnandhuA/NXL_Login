import 'package:flutter/material.dart';
import 'package:nxl_login/core/utils/helper_methods.dart';

enum DialogType { error, confirmation, info }

Future<bool?> showAppDialog({
  required BuildContext context,
  required String title,
  required String message,
  DialogType type = DialogType.info,
  String confirmText = "OK",
  String cancelText = "Cancel",
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: type != DialogType.confirmation,
    builder: (_) {
      return AlertDialog(
        title: Row(
          children: [
            Icon(getIcon(type), color: getColor(type)),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
        content: Text(message),
        actions: buildActions(context, type, confirmText, cancelText),
      );
    },
  );
}
