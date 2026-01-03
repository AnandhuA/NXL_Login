import 'package:flutter/material.dart';
import 'package:nxl_login/widgets/app_dialog_widget.dart';

IconData getIcon(DialogType type) {
  switch (type) {
    case DialogType.error:
      return Icons.error;
    case DialogType.confirmation:
      return Icons.help;
    case DialogType.info:
    return Icons.info;
  }
}

Color getColor(DialogType type) {
  switch (type) {
    case DialogType.error:
      return Colors.red;
    case DialogType.confirmation:
      return Colors.orange;
    case DialogType.info:
    return Colors.blue;
  }
}

List<Widget> buildActions(
  BuildContext context,
  DialogType type,
  String confirmText,
  String cancelText,
) {
  if (type == DialogType.confirmation) {
    return [
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: Text(cancelText),
      ),
      ElevatedButton(
        onPressed: () => Navigator.pop(context, true),
        child: Text(confirmText),
      ),
    ];
  }

  return [
    ElevatedButton(
      onPressed: () => Navigator.pop(context, true),
      child: Text(confirmText),
    ),
  ];
}
