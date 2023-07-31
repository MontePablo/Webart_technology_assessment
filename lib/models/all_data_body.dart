// https://app.quicktype.io ***********

class SignupBody {
  String? name="";
  String? emailId="";
  String? password="";
  SignupBody({
    this.name,this.emailId,this.password
  });
  Map<String, dynamic> toJson() => {
    "name": name,
    "emailId": emailId,
    "password": password,
  };
  factory SignupBody.fromJson(Map<String, dynamic> json) => SignupBody(
    name: json['name'],
    emailId: json["emailId"],
    password: json["password"],
  );
}

class OtpBody {
  String? emailId="";
  String? password="";
  String? otp="";

  OtpBody({
    this.emailId,
    this.password,
    this.otp,
  });
  Map<String, dynamic> toJson() => {
    "emailId": emailId,
    "password": password,
    "otp": otp
  };
  factory OtpBody.fromJson(Map<String, dynamic> json) => OtpBody(
    emailId: json["emailId"],
    password: json["password"],
    otp: json["otp"],
  );
}

class LoginBody {
  String? emailId="";
  String? password="";

  LoginBody({
    this.emailId,
    this.password,
  });
  Map<String, dynamic> toJson() => {
    "emailId": emailId,
    "password": password,
  };
  factory LoginBody.fromJson(Map<String, dynamic> json) => LoginBody(
    emailId: json["emailId"],
    password: json["password"],
  );
}


class Data {
  String emailId="";
  String password="";
  String name="";
  String otp="";
  String isVerified="";
  String isActive="";
  String id="";
  String createdAt="";
  String updatedAt="";
  String v="";
}

//not used
class Response {
  int success=100;
  Data data=Data();
  String tokenCode="";
  String message="";
}