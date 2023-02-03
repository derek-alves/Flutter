import '../../domain/storage/storage.dart';

class SharedAdapter implements LocalStorage {
  @override
  void add(String value) {}

  @override
  bool delete(String key) {
    return true;
  }
}
