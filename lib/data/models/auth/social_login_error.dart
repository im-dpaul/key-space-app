class SocialLoginError {
  String? name;
  String? email;
  String? mobileNumber;
  String? profilePictureSlug;
  bool? userExists;

  SocialLoginError(
      {this.name, this.email, this.profilePictureSlug, this.userExists,
        //this.mobileNumber
      });

  SocialLoginError.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    profilePictureSlug = json['profilePictureSlug'];
    userExists = json['userExists'];
    mobileNumber=json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['profilePictureSlug'] = profilePictureSlug;
    data['userExists'] = userExists;
    data['mobileNumber']=mobileNumber;
    return data;
  }
}
