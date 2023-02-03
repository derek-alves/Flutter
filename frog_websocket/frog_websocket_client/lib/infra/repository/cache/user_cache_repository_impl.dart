import '../../../domain/repository/cache/user_cache_repository.dart';
import '../../../domain/storage/storage.dart';

class UserCacheRepositoryImpl implements UserCacheRepository {
  final LocalStorage localStorage;

  UserCacheRepositoryImpl(
    this.localStorage,
  );

  @override
  save(String userId) {
    localStorage.add(userId);
  }

  @override
  remove(String userId) {
    localStorage.delete(userId);
  }
}
