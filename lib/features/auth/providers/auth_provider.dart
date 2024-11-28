import 'package:flutter/foundation.dart';
import 'package:novelty_app/features/auth/data/repositories/authentication_repository.dart';
import 'package:novelty_app/features/auth/domain/entities/user.dart';

class AuthProvider extends ChangeNotifier {
  User? currentUser;
  bool isLoggedIn = false;
  AuthenticationRepository repository;
  AuthProvider(this.repository);

  Future<void> login(email, password) async {}
  Future<void> register(User user) async {}
  Future<void> logout() async {}
  Future<void> verify() async {}
  Future<void> checkLoggedIn() async {}
}
