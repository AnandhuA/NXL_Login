import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nxl_login/core/config/sizes.dart';
import 'package:nxl_login/core/theme/colors.dart';
import 'package:nxl_login/core/utils/navigation_helper.dart';
import 'package:nxl_login/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Create Account")),
      body: Padding(
        padding: AppPadding.p24(),
        child: Consumer<AuthProvider>(
          builder: (context, auth, _) {
            return Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                AppSpacing.h20(),
                auth.isLoading
                    ? SpinKitThreeBounce(color: AppColors.black)
                    : ElevatedButton(
                        onPressed: () async {
                          await auth.register(
                            emailController.text,
                            passController.text,
                          );
                          if (context.mounted) {
                            NavigationHelper.pop(context);
                          }
                        },
                        child: const Text("Register"),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
