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
    name = json['Name'];
    email = json['Email'];
    password = json['Password'];
    cpf = json['CPF'];
    pathAvatar = json['PathAvatar'];
    type = json['Type'];
    street = json['Street'];
    neighborhood = json['Neighborhood'];
    city = json['City'];
    state = json['State'];
    country = json['Country'];
    number = json['Number'];
    complement = json['Complement'];
    phone = json['Phone'];
    tokenPassword = json['TokenPassword'];
    cpf = json['CEP'];
  }

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
