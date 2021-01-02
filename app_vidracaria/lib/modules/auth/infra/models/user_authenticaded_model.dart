import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';

/*class UserAuthenticadedModel extends UserAuthenticaded {
  final String token;

  UserAuthenticadedModel({this.token});
  
  UserAuthenticadedModel.fromJson(Map<String, dynamic> json)
    : token = json['acessToken'] as String ?? '';
}*/

class UserAuthenticadedModel extends UserAuthenticaded {
  bool authenticated;
  String created;
  String expiration;
  String acessToken;
  String userName;
  String message;

  UserAuthenticadedModel(
      {this.authenticated,
      this.created,
      this.expiration,
      this.acessToken,
      this.userName,
      this.message});

  UserAuthenticadedModel.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    created = json['created'];
    expiration = json['expiration'];
    acessToken = json['acessToken'];
    userName = json['userName'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authenticated'] = this.authenticated;
    data['created'] = this.created;
    data['expiration'] = this.expiration;
    data['acessToken'] = this.acessToken;
    data['userName'] = this.userName;
    data['message'] = this.message;
    return data;
  }
}