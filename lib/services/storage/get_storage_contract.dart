import 'package:get_storage/get_storage.dart';
import 'package:key_space_app/services/storage/get_storage_service.dart';

class GetStorageServiceContract implements GetStorageService {
  @override
  Future<void> initGetStorage() async {
    await GetStorage.init();
  }
}
