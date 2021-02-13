import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';

class UserModel extends User {
  String id;
  String name;
  String email;
  String password;
  String cpf;
  String pathAvatar;
  String type;
  String street;
  String neighborhood;
  String city;
  String state;
  String country;
  String number;
  String complement;
  String phone;
  String tokenPassword;
  String cep;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.cpf,
      this.pathAvatar,
      this.type,
      this.street,
      this.neighborhood,
      this.city,
      this.state,
      this.country,
      this.number,
      this.complement,
      this.phone,
      this.tokenPassword,
      this.cep});

  UserModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    email = json['email'],
    password =json['password'],
    cpf = json['cpf'],
    pathAvatar = json['pathAvatar'],
    type = json['type'],
    street = json['street'],
    neighborhood = json['neighborhood'],
    city = json['city'],
    state = json['state'],
    country = json['country'],
    number = json['number'],
    complement = json['complement'],
    phone = json['phone'],
    tokenPassword = json['tokenPassword'],
    cep = json['cep'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['CPF'] = this.cpf;
    data['PathAvatar'] = this.pathAvatar;
    data['Type'] = this.type;
    data['Street'] = this.street;
    data['Neighborhood'] = this.neighborhood;
    data['City'] = this.city;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Number'] = this.number;
    data['Complement'] = this.complement;
    data['Phone'] = this.phone;
    data['TokenPassword'] = this.tokenPassword;
    data['CEP'] = this.cep;
    return data;
  }

}
