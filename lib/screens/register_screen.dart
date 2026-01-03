import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nxl_login/core/config/sizes.dart';
import 'package:nxl_login/core/utils/navigation_helper.dart';
import 'package:nxl_login/core/utils/validator_helper.dart';
import 'package:nxl_login/providers/app_auth_provider.dart';
import 'package:nxl_login/screens/home_screen.dart';
import 'package:nxl_login/screens/login_screen.dart';
import 'package:nxl_login/widgets/app_dialog_widget.dart';
import 'package:nxl_login/widgets/auth_header.dart';
import 'package:nxl_login/widgets/auth_rich_text.dart';
import 'package:nxl_login/widgets/custom_button.dart';
import 'package:nxl_login/widgets/custom_text_feild.dart';
import 'package:nxl_login/widgets/or_divider_widget.dart';
import 'package:nxl_login/widgets/show_full_screen_lottie.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.p24(),
          child: Column(
            children: [
              //---------- SUCCESS-----------------
              Selector<AppAuthProvider, User?>(
                selector: (_, auth) => auth.user,
                builder: (_, user, _) {
                  if (user != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      await showFullScreenLottie(
                        context: context,
                        lottiePath: "assets/animations/congratulation.json",
                        duration: const Duration(seconds: 2),
                      );

                      if (context.mounted) {
                        NavigationHelper.pushAndRemoveUntil(
                          context,
                          const HomeScreen(),
                        );
                      }
                    });
                  }
                  return const SizedBox.shrink();
                },
              ),

              //----------- ERROR LISTENER -----------------
              Selector<AppAuthProvider, String?>(
                selector: (_, auth) => auth.error,
                builder: (_, error, _) {
                  if (error != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      await showAppDialog(
                        context: context,
                        title: "Registration Failed",
                        message: error,
                      );
                      if (context.mounted) {
                        context.read<AppAuthProvider>().clearError();
                      }
                    });
                  }
                  return const SizedBox.shrink();
                },
              ),

              //------------- MAIN UI-----------------
              Consumer<AppAuthProvider>(
                builder: (context, auth, _) {
                  return Form(
                    key: _formKey,
                    child: GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            AuthHeader(
                              title: "Create Account",
                              subTitle:
                                  "Please fill the details below to create your account",
                            ),
                            AppSpacing.h16(),
                            CustomTextFeild(
                              headingText: "Enter your Name",
                              icon: Icons.person_2_outlined,
                              controller: nameController,
                              title: "Name",
                              keyboardType: TextInputType.name,
                              validator: ValidatorHelper.name,
                            ),
                            AppSpacing.h16(),

                            CustomTextFeild(
                              headingText: "Enter Your Email",
                              icon: Icons.email_outlined,
                              controller: emailController,
                              title: "Email",
                              keyboardType: TextInputType.emailAddress,
                              validator: ValidatorHelper.email,
                            ),
                            AppSpacing.h16(),

                            CustomTextFeild(
                              headingText: "Enter your Password",
                              icon: Icons.lock_outline,
                              controller: passController,
                              title: "Password",
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              validator: ValidatorHelper.password,
                            ),
                            AppSpacing.h16(),

                            CustomTextFeild(
                              headingText: "Re-Enter your Password",
                              icon: Icons.lock_outline,
                              controller: confirmPassController,
                              title: "Confirm Password",
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              validator: (value) =>
                                  ValidatorHelper.confirmPassword(
                                    password: passController.text,
                                    confirmPassword: value,
                                  ),
                            ),

                            AppSpacing.h20(),

                            CustomButton(
                              title: "Register",
                              isLoading: auth.isLoading,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  auth.register(
                                    emailController.text.trim(),
                                    passController.text.trim(),
                                  );
                                }
                              },
                            ),
                            AppSpacing.h12(),
                            OrDividerWidget(),
                            AppSpacing.h12(),
                            Center(
                              child: AuthRichText(
                                questionText: "Already have an Account?",
                                actionText: "Login",
                                onTap: () {
                                  NavigationHelper.pushReplacement(
                                    context,
                                    const LoginScreen(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
