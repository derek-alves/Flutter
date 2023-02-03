import 'package:frog_websocket_client/infra/factory/adapter/shared_adapter_factory.dart';

import '../../../../domain/repository/cache/product_cache_repository.dart';
import '../../../repository/cache/product_cache_repository_impl.dart';

ProductCacheRepository productCacheRespositoryFactory() =>
    ProductCacheRepositoryImpl(
      sharedAdapterFactory(),
    );
