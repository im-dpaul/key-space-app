import 'package:get_storage/get_storage.dart';
import 'package:key_space_app/services/storage/storage_keys.dart';

class StorageUtils {
  StorageUtils._privateConstructor();

  static final _box = GetStorage();

  static String? getToken() => _box.read(StorageKeys.TOKEN);
  static void setToken(String value) => _box.write(StorageKeys.TOKEN, value);
  static clearToken() => _box.remove(StorageKeys.TOKEN);

  static void showComponent(bool value) =>
      _box.write(StorageKeys.SHOW_COMPONENTS, value);
  static bool? isShowComponent() => _box.read(StorageKeys.SHOW_COMPONENTS);
}
