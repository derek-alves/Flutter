import 'package:frog_websocket_client/infra/factory/adapter/shared_adapter_factory.dart';

import '../../../../domain/repository/cache/user_cache_repository.dart';
import '../../../repository/cache/user_cache_repository_impl.dart';

UserCacheRepository userCacheRespositoryFactory() => UserCacheRepositoryImpl(
      sharedAdapterFactory(),
    );
