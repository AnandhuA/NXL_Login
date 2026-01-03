import 'package:flutter/material.dart';
import 'package:nxl_login/providers/app_auth_provider.dart';
import 'package:nxl_login/screens/login_screen.dart';
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
            onPressed: () {
              context.read<AppAuthProvider>().logout();
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
          const Center(child: Text("Logged In Successfully 🎉")),
        ],
      ),
    );
  }
}
