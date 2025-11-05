class AppConfig {
  String? minIosVersion;
  String? latestIosVersion;
  String? minAndroidVersion;
  String? latestAndroidVersion;

  AppConfig(
      {this.minIosVersion,
      this.latestIosVersion,
      this.minAndroidVersion,
      this.latestAndroidVersion});

  AppConfig.fromJson(Map<String, dynamic> json) {
    minIosVersion = json['minIosVersion'];
    latestIosVersion = json['latestIosVersion'];
    minAndroidVersion = json['minAndroidVersion'];
    latestAndroidVersion = json['latestAndroidVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minIosVersion'] = minIosVersion;
    data['latestIosVersion'] = latestIosVersion;
    data['minAndroidVersion'] = minAndroidVersion;
    data['latestAndroidVersion'] = latestAndroidVersion;
    return data;
  }
}
