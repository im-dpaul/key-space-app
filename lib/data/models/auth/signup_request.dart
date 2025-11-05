class SignupRequest {
  String? name;
  String? email;
  String? mobileNumber;
  String? password;
  String? confirmPassword;
  String? roleName;
  bool? tncAgreed;
  String? profilePictureSlug;
  String? verificationToken;
  String? companyName;
  List<int>? mostlyDealsIn;
  int? cityId;

  SignupRequest(
      {this.name,
        this.email,
        this.mobileNumber,
        this.password,
        this.confirmPassword,
        this.roleName,
        this.tncAgreed,
        this.profilePictureSlug,
        this.verificationToken,
        this.companyName,
        this.mostlyDealsIn,
        this.cityId});

  SignupRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    roleName = json['roleName'];
    tncAgreed = json['tncAgreed'];
    profilePictureSlug = json['profilePictureSlug'];
    verificationToken = json['verificationToken'];
    companyName = json['companyName'];
    mostlyDealsIn = json['mostlyDealsIn'].cast<int>();
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['roleName'] = roleName;
    data['tncAgreed'] = tncAgreed;
    data['profilePictureSlug'] = profilePictureSlug;
    data['verificationToken'] = verificationToken;
    data['companyName'] = companyName;
    data['mostlyDealsIn'] = mostlyDealsIn;
    data['cityId'] = cityId;
    return data;
  }
}
