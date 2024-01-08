import '../model/domain_user.dart';
import '../repository/repository.dart';

class LoadCachedUserUseCase {
  final Repository repository;

  LoadCachedUserUseCase(this.repository);

  Future<DomainUser?> execute() async {
    return await repository.loadCachedUser();
  }
}
