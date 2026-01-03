import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nxl_login/providers/app_auth_provider.dart';
import 'package:nxl_login/screens/login_screen.dart';
import 'package:nxl_login/widgets/app_dialog_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final bool? confirmed = await showAppDialog(
                context: context,
                title: "Logout",
                message: "Are you sure you want to logout?",
                type: DialogType.confirmation,
                confirmText: "Logout",
                cancelText: "Cancel",
              );

              if (confirmed == true && context.mounted) {
                context.read<AppAuthProvider>().logout();
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          //------- LOGOUT LISTENER -------
          Selector<AppAuthProvider, bool>(
            selector: (_, auth) => auth.user == null,
            builder: (_, isLoggedOut, _) {
              if (isLoggedOut) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                });
              }
              return const SizedBox.shrink();
            },
          ),

          //------- MAIN UI ------
          Column(
            mainAxisAlignment: .center,
            children: [Lottie.asset("assets/animations/Welcome.json")],
          ),
        ],
      ),
    );
  }
}
