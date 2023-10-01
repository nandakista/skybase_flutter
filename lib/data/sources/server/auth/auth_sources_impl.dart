import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:skybase/config/app/app_env.dart';
import 'package:skybase/core/database/secure_storage/secure_storage_manager.dart';
import 'package:skybase/config/network/api_request.dart';
import 'package:skybase/config/network/api_response.dart';
import 'package:skybase/data/models/repo/repo.dart';
import 'package:skybase/data/models/user/user.dart';

import 'auth_sources.dart';

class AuthSourcesImpl implements AuthSources {
  String tag = 'Auth Api';

  @override
  Future<User> login({
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiRequest.post(
        url: 'auth/login',
        body: {
          'phone': phoneNumber,
          'password': password,
          'email': email,
        },
      );
      return User.fromJson(ApiResponse.fromJson(response.data).data);
    } catch (e) {
      debugPrint('$tag Error = $e');
      rethrow;
    }
  }

  @override
  Future<User> verifyToken({
    required int userId,
    required String token,
  }) async {
    try {
      String? token = await SecureStorageManager.find.getToken();
      String url = AppEnv.config.baseUrl;
      url += 'auth/verify-token';
      final response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            'Accept': Headers.jsonContentType,
            'Client-Token': AppEnv.config.clientToken,
          },
          contentType: Headers.jsonContentType,
        ),
      );
      return User.fromJson(ApiResponse.fromJson(response.data).data);
    } catch (e) {
      debugPrint('$tag Error = $e');
      rethrow;
    }
  }

  @override
  Future<User> getProfile({required String username}) async {
    try {
      final res = await ApiRequest.get(
        url: '/users/$username',
        useToken: true,
      );
      return User.fromJson(res.data);
    } catch (e) {
      debugPrint('$tag Error = $e');
      rethrow;
    }
  }

  @override
  Future<List<Repo>> getProfileRepository({required String username}) async {
    try {
      final res = await ApiRequest.get(
        url: '/users/$username/repos?type=all',
        useToken: true,
      );
      return (res.data as List)
          .map((data) => Repo.fromJson(data))
          .toList()
          .cast<Repo>();
    } catch (e) {
      debugPrint('$tag Error = $e');
      rethrow;
    }
  }
}
