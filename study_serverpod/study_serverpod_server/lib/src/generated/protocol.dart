/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'article_class.dart' as _i2;
import 'example.dart' as _i3;
import 'package:study_serverpod_server/src/generated/article_class.dart' as _i4;
import 'package:serverpod_auth_server/module.dart' as _i5;
import 'package:serverpod/protocol.dart' as _i6;
export 'article_class.dart';
export 'example.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Article) {
      return _i2.Article.fromJson(data, this) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Article?>()) {
      return (data != null ? _i2.Article.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data, this) : null) as T;
    }
    if (t == List<_i4.Article>) {
      return (data as List).map((e) => deserialize<_i4.Article>(e)).toList()
          as dynamic;
    }
    try {
      return _i5.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i6.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i5.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Article) {
      return 'Article';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i5.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Article') {
      return deserialize<_i2.Article>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i5.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i6.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i2.Article:
        return _i2.Article.t;
    }
    return null;
  }
}
