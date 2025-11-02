import 'package:get_it/get_it.dart';

import 'package:key_space_app/services/hardware_info/hardware_info.dart';
import 'package:key_space_app/services/storage/get_storage_contract.dart';
import 'package:key_space_app/services/hardware_info/hardware_info_contract.dart';
import 'package:key_space_app/services/internet_connectivity/internet_connectivity.dart';
import 'package:key_space_app/services/internet_connectivity/internet_connectivity_contract.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<InternetConnectivity>(
    InternetConnectivityContract(),
  );
  locator.registerSingleton<HardwareInfo>(HardwareInfoContract());

  await GetStorageServiceContract().initGetStorage();
}
