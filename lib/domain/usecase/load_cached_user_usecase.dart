import '../model/domain_user.dart';
import '../repository/content_repository.dart';

class LoadCachedUserUseCase {
  final ContentRepository repository;

  LoadCachedUserUseCase(this.repository);

  Future<DomainUser?> execute() async {
    return await repository.loadCachedUser();
  }
}
