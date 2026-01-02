import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nxl_login/core/services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? user;
  bool isLoading = false;
  String? error;

  //
  AuthProvider() {
    user = _authService.currentUser;
  }

  //------------ login ----------------
  Future<void> login(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      user = await _authService.login(email, password);
    } catch (e) {
      error = e.toString();
      log("eroor   $error");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //------------------ register -------------------
  Future<void> register(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      user = await _authService.register(email, password);
    } catch (e) {
      error = e.toString();
      log("eroor   $error");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //--------- logout ------------
  Future<void> logout() async {
    await _authService.logout();
    user = null;
    notifyListeners();
  }
}
