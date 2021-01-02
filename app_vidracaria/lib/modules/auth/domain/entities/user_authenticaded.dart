/*class UserAuthenticaded {
  final String token;

  UserAuthenticaded({this.token});
}*/

class UserAuthenticaded {
  bool authenticated;
  String created;
  String expiration;
  String acessToken;
  String userName;
  String message;

  UserAuthenticaded(
      {this.authenticated,
      this.created,
      this.expiration,
      this.acessToken,
      this.userName,
      this.message});
}