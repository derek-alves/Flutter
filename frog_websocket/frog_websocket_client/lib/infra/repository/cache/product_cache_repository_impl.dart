// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:frog_websocket_client/domain/storage/local_storage.dart';

import '../../../domain/repository/cache/product_cache_repository.dart';

class ProductCacheRepositoryImpl implements ProductCacheRepository {
  final LocalStorage localStorage;
  ProductCacheRepositoryImpl(this.localStorage);

  @override
  add(String id) {
    localStorage.add(id);
  }

  @override
  delete(String id) {
    localStorage.delete(id);
  }
}
