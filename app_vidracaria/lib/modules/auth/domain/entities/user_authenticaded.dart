/*class UserAuthenticaded {
  final String token;

  UserAuthenticaded({this.token});
}*/

import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';

class UserAuthenticaded {
  bool authenticated;
  String created;
  String expiration;
  String acessToken;
  User user;
  String message;

  UserAuthenticaded(
      {this.authenticated,
      this.created,
      this.expiration,
      this.acessToken,
      this.user,
      this.message});

  UserAuthenticaded.fromJson(Map<String, dynamic> json) :
    authenticated = json['authenticated'] as bool ?? false,
    created = json['created'] as String ?? '',
    expiration = json['expiration'] as String ?? '',
    acessToken = json['acessToken'] as String ?? '',
    user = json['user'] == null ? null : User.fromJson(json['user'] ?? User),
    message = json['message'] as String ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authenticated'] = this.authenticated;
    data['created'] = this.created;
    data['expiration'] = this.expiration;
    data['acessToken'] = this.acessToken;
    data['user'] = this.user;
    data['message'] = this.message;
    return data;
  }
}