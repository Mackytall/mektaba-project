import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/user.dart';

final authProvider = StateNotifierProvider((ref) {
  return AuthNotifier(null);
});

final tokenProvider = StateNotifierProvider((ref) {
  return TokenNotifier(null);
});

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier(User? state) : super(state);

  setCurrentUser(User user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }
}

class TokenNotifier extends StateNotifier<String?> {
  TokenNotifier(String? state) : super(state);

  setCurrentToken(String token) {
    state = token;
  }

  void clearToken() {
    state = null;
  }
}
