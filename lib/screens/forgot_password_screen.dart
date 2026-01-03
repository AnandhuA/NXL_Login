import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:nxl_login/core/config/sizes.dart';
import 'package:nxl_login/core/utils/navigation_helper.dart';
import 'package:nxl_login/widgets/custom_button.dart';
import 'package:nxl_login/widgets/custom_text_feild.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.p24(),
              child: Column(
                children: [
                  Lottie.asset("assets/animations/password.json"),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.h12(),
                  Text(
                    "Don't worry! it happens,Please enter the email\naddress associated with your account",
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.h16(),
          
                  CustomTextFeild(
                    controller: emailController,
                    title: "Email",
                    icon: Icons.email_outlined,
                    headingText: "Enter your email address",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  AppSpacing.h16(),
                  CustomButton(
                    title: "Get OTP",
                    onTap: () {
                      NavigationHelper.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
