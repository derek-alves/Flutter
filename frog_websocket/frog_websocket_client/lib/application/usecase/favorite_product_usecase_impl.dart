import 'package:frog_websocket_client/domain/repository/cache/product_cache_repository.dart';

import '../../domain/usecase/favorite_product_usecase.dart';

class FavoriteProductUsecaseImpl implements FavoriteProductUsecase {
  final ProductCacheRepository storage;

  FavoriteProductUsecaseImpl(this.storage);
  @override
  bool call(String id) {
    storage.add(id);
    return true;
  }
}
