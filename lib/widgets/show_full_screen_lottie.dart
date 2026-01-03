
  import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> showFullScreenLottie({
    required BuildContext context,
    required String lottiePath,
    Duration duration = const Duration(seconds: 2),
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.3), 
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(child: Lottie.asset(lottiePath, repeat: false)),
        );
      },
    );

    await Future.delayed(duration);

    if (context.mounted) {
      Navigator.of(context).pop(); // close overlay
    }
  }