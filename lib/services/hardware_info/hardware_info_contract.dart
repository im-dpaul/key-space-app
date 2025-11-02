import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:key_space_app/services/hardware_info/hardware_info.dart';

/// Service that is responsible for getting hardware device info
class HardwareInfoContract implements HardwareInfo {
  static final deviceInfo = DeviceInfoPlugin();

  String? _operatingSystem;
  String? _device;
  String? _udid;
  String? _appName;
  String? _packageName;
  String? _version;
  String? _buildNumber;
  String? _timeZone;
  String? _lang;

  @override
  String? get operatingSystem => _operatingSystem;

  @override
  String? get device => _device;

  @override
  String? get udid => _udid;

  @override
  String? get appName => _appName;

  @override
  String? get packageName => _packageName;

  @override
  String? get version => _version;

  @override
  String? get buildNumber => _buildNumber;

  @override
  String? get timeZone => _timeZone;

  @override
  String? get lang => _lang;

  @override
  Future<void> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (Platform.isIOS) {
      await prepareIosInfo(packageInfo);
    } else if (Platform.isAndroid) {
      await prepareAndroidInfo(packageInfo);
    }
  }

  prepareIosInfo(PackageInfo packageInfo) async {
    final iosInfo = await deviceInfo.iosInfo;
    _udid = iosInfo.identifierForVendor;
    _operatingSystem = 'iOS';
    _device = iosInfo.utsname.machine;
    _appName = packageInfo.appName;
    _packageName = packageInfo.packageName;
    _version = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
    _timeZone = DateTime.now().timeZoneName;
    _lang = Platform.localeName.split('_')[0];
  }

  prepareAndroidInfo(PackageInfo packageInfo) async {
    const androidIdPlugin = AndroidId();
    final String? androidId = await androidIdPlugin.getId();
    final androidInfo = await deviceInfo.androidInfo;
    _udid = androidId ?? androidInfo.id;
    _operatingSystem = 'Android';
    _device = androidInfo.model;
    _appName = packageInfo.appName;
    _packageName = packageInfo.packageName;
    _version = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
    _timeZone = DateTime.now().timeZoneName;
    _lang = Platform.localeName.split('_')[0];
  }
}
