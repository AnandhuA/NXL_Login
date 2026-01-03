import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nxl_login/core/services/auth_services.dart';
import 'package:nxl_login/core/utils/firebase_error_mapper.dart';

class AppAuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? user;
  bool isLoading = false;
  String? error;

  //
  AppAuthProvider() {
    user = _authService.currentUser;
  }

  //------------ login ----------------
  Future<void> login(String email, String password) async {
    try {
      _setLoading(true);
      user = await _authService.login(email, password);
    } on FirebaseAuthException catch (e) {
      error = FirebaseErrorMapper.getMessage(e);
      log('Login error: ${e.code}');
    } catch (e) {
      error = 'Something went wrong. Please try again.';
      log('Unexpected login error: $e');
    } finally {
      _setLoading(false);
    }
  }

  //------------------ register -------------------
  Future<void> register(String email, String password) async {
    try {
      _setLoading(true);
      user = await _authService.register(email, password);
    } on FirebaseAuthException catch (e) {
      error = FirebaseErrorMapper.getMessage(e);
      log('Register error: ${e.code}');
    } catch (e) {
      error = 'Something went wrong. Please try again.';
      log('Unexpected register error: $e');
    } finally {
      _setLoading(false);
    }
  }

  //--------- logout ------------
  Future<void> logout() async {
    await _authService.logout();
    user = null;
    notifyListeners();
  }

  void clearError() {
    error = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
