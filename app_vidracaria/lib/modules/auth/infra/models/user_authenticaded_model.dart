import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/infra/models/user_model.dart';


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
  User user;
  String message;

  UserAuthenticadedModel(
      {this.authenticated,
      this.created,
      this.expiration,
      this.acessToken,
      this.user,
      this.message});

  UserAuthenticadedModel.fromJson(Map<String, dynamic> json) :
    authenticated = json['authenticated'] as bool ?? false,
    created = json['created'] as String ?? '',
    expiration = json['expiration'] as String ?? '',
    acessToken = json['acessToken'] as String ?? '',
    user = json['user'] == null ? null : UserModel.fromJson(json['user'] ?? UserModel),
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