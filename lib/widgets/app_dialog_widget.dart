import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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



Future<void> showSuccessDialog({
  required BuildContext context,
  required String message,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              "assets/animations/congratulation.json",
              height: 150,
              repeat: false,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    },
  );
}
