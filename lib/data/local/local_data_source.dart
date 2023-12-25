import '../../domain/model/domain_user.dart';

abstract class LocalDataSource {
  Future<DomainUser?> loadUser();
  Future<bool> saveUser(DomainUser user);
}
