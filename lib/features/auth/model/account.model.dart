class AccountModel {
  String email;
  String role;
  String accessToken;
  String refreshToken;

  AccountModel({this.email, this.role, this.accessToken, this.refreshToken});

  AccountModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    role = json['role'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['role'] = this.role;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
