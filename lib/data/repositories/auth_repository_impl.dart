import 'package:skybase/data/sources/server/auth/auth_sources_impl.dart';
import 'package:skybase/domain/entities/user/user.dart';
import 'package:skybase/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSourcesImpl apiService;

  AuthRepositoryImpl({required this.apiService});

  String tag = 'AuthRepositoryImpl::->';

  @override
  Future<User> login({
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    return await apiService.login(
      phoneNumber: phoneNumber,
      email: email,
      password: password,
    );
  }

  @override
  Future<User> verifyToken({
    required int userId,
    required String token,
  }) async {
    return await apiService.verifyToken(userId: userId, token: token);
  }
}