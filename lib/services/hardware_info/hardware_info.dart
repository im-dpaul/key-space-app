abstract class HardwareInfo {
  String? get operatingSystem;

  String? get device;

  String? get udid;

  String? get appName;

  String? get packageName;

  String? get version;

  String? get buildNumber;

  String? get timeZone;

  String? get lang;

  Future<void> init();
}
