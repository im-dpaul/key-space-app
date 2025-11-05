import 'package:get_storage/get_storage.dart';
import 'package:key_space_app/data/models/onboarding/categories.dart';
import 'package:key_space_app/services/storage/storage_keys.dart';

class StorageUtils {
  StorageUtils._privateConstructor();

  static final _box = GetStorage();

  static String? getToken() => _box.read(StorageKeys.TOKEN);
  static void setToken(String value) => _box.write(StorageKeys.TOKEN, value);
  static clearToken() => _box.remove(StorageKeys.TOKEN);

  static bool isUserExists() => _box.read(StorageKeys.USER) != null;

  static void showComponent(bool value) =>
      _box.write(StorageKeys.SHOW_COMPONENTS, value);
  static bool? isShowComponent() => _box.read(StorageKeys.SHOW_COMPONENTS);

  static String getDeviceID() => _box.read(StorageKeys.DEVICE_ID);
  static void setDeviceID(String id) => _box.write(StorageKeys.DEVICE_ID, id);

  static void saveCategories(List<Categories>? categories) =>
      _box.write(StorageKeys.CATEGORIES, categories);

  static List<dynamic>? getSavedCategories() =>
      _box.read(StorageKeys.CATEGORIES);

  static bool isCategoriesExists() => _box.read(StorageKeys.CATEGORIES) != null;
}
