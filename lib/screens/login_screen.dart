import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nxl_login/core/config/sizes.dart';
import 'package:nxl_login/core/theme/colors.dart';
import 'package:nxl_login/core/utils/navigation_helper.dart';
import 'package:nxl_login/providers/auth_provider.dart';
import 'package:nxl_login/screens/register_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: AppPadding.p24(),
        child: Consumer<AuthProvider>(
          builder: (context, auth, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        onPressed: () {
                          auth.login(emailController.text, passController.text);
                        },
                        child: const Text("Login"),
                      ),
                TextButton(
                  onPressed: () {
                    NavigationHelper.push(context, RegisterScreen());
                  },
                  child: const Text("Create Account"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
