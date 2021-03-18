class User {
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

  User(
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
  
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    cpf = json['cpf'];
    pathAvatar = json['pathAvatar'];
    type = json['type'];
    street = json['street'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    number = json['number'];
    complement = json['complement'];
    phone = json['phone'];
    tokenPassword = json['tokenPassword'];
    cpf = json['cep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['cpf'] = this.cpf;
    data['pathAvatar'] = this.pathAvatar;
    data['type'] = this.type;
    data['street'] = this.street;
    data['neighborhood'] = this.neighborhood;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['number'] = this.number;
    data['complement'] = this.complement;
    data['phone'] = this.phone;
    data['tokenPassword'] = this.tokenPassword;
    data['cep'] = this.cep;
    return data;
  }
}
