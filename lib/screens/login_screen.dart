import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nxl_login/core/config/sizes.dart';
import 'package:nxl_login/core/theme/colors.dart';
import 'package:nxl_login/core/utils/navigation_helper.dart';
import 'package:nxl_login/core/utils/validator_helper.dart';
import 'package:nxl_login/providers/app_auth_provider.dart';
import 'package:nxl_login/screens/home_screen.dart';
import 'package:nxl_login/screens/register_screen.dart';
import 'package:nxl_login/widgets/app_dialog_widget.dart';
import 'package:nxl_login/widgets/auth_header.dart';
import 'package:nxl_login/widgets/auth_rich_text.dart';
import 'package:nxl_login/widgets/custom_button.dart';
import 'package:nxl_login/widgets/custom_text_feild.dart';
import 'package:nxl_login/widgets/or_divider_widget.dart';
import 'package:nxl_login/widgets/show_full_screen_lottie.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.p24(),
          child: Stack(
            children: [
              //-------------- SUCCESS LISTENER ---------------
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

              //---------- ERROR LISTENER --------------
              Selector<AppAuthProvider, String?>(
                selector: (_, auth) => auth.error,
                builder: (_, error, _) {
                  if (error != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      await showAppDialog(
                        context: context,
                        title: "Login Failed",
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

              //----------- MAIN UI -------------
              Consumer<AppAuthProvider>(
                builder: (context, auth, _) {
                  return Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .start,
                        children: [
                          AuthHeader(
                            title: "Login",
                            subTitle: "Please login to your account",
                          ),
                          AppSpacing.h20(),
                          CustomTextFeild(
                            headingText: "E-mail Address",
                            icon: Icons.email_outlined,
                            controller: emailController,
                            title: "Email",
                            keyboardType: TextInputType.emailAddress,
                            validator: ValidatorHelper.email,
                          ),
                          AppSpacing.h20(),
                          CustomTextFeild(
                            headingText: "Password",
                            icon: Icons.lock_outline,
                            controller: passController,
                            title: "Password",
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator: ValidatorHelper.password,
                          ),
                          AppSpacing.h12(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          AppSpacing.h20(),

                          CustomButton(
                            title: "Login",
                            isLoading: auth.isLoading,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                auth.login(
                                  emailController.text,
                                  passController.text,
                                );
                              }
                            },
                          ),
                          AppSpacing.h12(),
                          OrDividerWidget(),
                          AppSpacing.h12(),
                          Center(
                            child: AuthRichText(
                              questionText: "Don't have an Account?",
                              actionText: "Create Account",
                              onTap: () {
                                NavigationHelper.pushReplacement(
                                  context,
                                  const RegisterScreen(),
                                );
                              },
                            ),
                          ),
                        ],
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
