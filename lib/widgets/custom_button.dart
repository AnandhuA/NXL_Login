import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nxl_login/core/config/sizes.dart';
import 'package:nxl_login/core/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.br12()),
        backgroundColor: AppColors.primary,
      ),
      child: isLoading
          ? SpinKitThreeBounce(color: AppColors.white)
          : Text(title, style: TextStyle(color: AppColors.textPrimary)),
    );
  }
}
