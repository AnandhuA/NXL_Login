import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxl_login/core/config/sizes.dart';
import 'package:nxl_login/core/theme/colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const AuthHeader({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: AppRadius.br8(),
            image: DecorationImage(image: AssetImage("assets/icons/iocn.png")),
          ),
        ),
        AppSpacing.h16(),
        Text(
          title,
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        Text(subTitle),
      ],
    );
  }
}
