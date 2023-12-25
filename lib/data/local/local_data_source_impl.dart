import 'dart:convert';

import 'package:coptix/shared/utils/shared_preferences.dart';

import '../../domain/model/domain_user.dart';
import 'local_data_source.dart';

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future<DomainUser?> loadUser() async {
    try {
      String cachedUserJson = await SharedPreferencesUtils.getUser();
      
      if (cachedUserJson.isNotEmpty) {
        Map<String, dynamic> body =
            jsonDecode(cachedUserJson) as Map<String, dynamic>;
        return DomainUser.fromJson(body);
      }
      // Return Error
      return null;
    } catch (e) {
      
      return null;
    }
  }

  @override
  Future<bool> saveUser(DomainUser user) async {
    try {
      String cachedUserJson = jsonEncode(user.toJson());
      bool isSuccess = await SharedPreferencesUtils.saveUser(cachedUserJson);
      return isSuccess;
    } catch (e) {
      return false;
    }
  }
}
