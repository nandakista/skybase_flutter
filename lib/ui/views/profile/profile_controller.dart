import 'package:get/get.dart';
import 'package:skybase/core/auth_manager/auth_manager.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/data/models/user/user.dart';
import 'package:skybase/data/repositories/auth/auth_repository.dart';
import 'package:skybase/data/sources/local/cached_key.dart';
import 'package:skybase/ui/views/profile/component/repository/profile_repository_controller.dart';

class ProfileController extends BaseController<User> {
  final AuthRepository repository;
  ProfileController({required this.repository});

  @override
  void onInit() {
    getCache(() => getProfile());
    super.onInit();
  }

  @override
  String get cachedId => AuthManager.find.user!.id.toString();

  @override
  String get cachedKey => CachedKey.PROFILE;

  @override
  void onRefresh() {
    getProfile();
    Get.find<ProfileRepositoryController>().onRefresh();
    super.onRefresh();
  }

  void getProfile() async {
    showLoading();
    try {
      final response = await repository.getProfile(username: 'nandakista');
      saveCacheAndFinish(data: response);
      dismissLoading();
    } catch (e) {
      dismissLoading();
      showError(e.toString());
    }
  }
}