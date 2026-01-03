import 'package:flutter/material.dart';
import 'package:nxl_login/core/theme/colors.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 0.5, color: AppColors.boderColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text("Or", style: TextStyle(color: AppColors.textSecondary)),
        ),
        const Expanded(
          child: Divider(thickness: 0.5, color: AppColors.boderColor),
        ),
      ],
    );
  }
}
