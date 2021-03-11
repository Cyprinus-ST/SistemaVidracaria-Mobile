class Costumer {
  String id;
  String name;
  String email;
  String phone;
  String idUser;

  Costumer(
      {this.id,
      this.name, this.email, this.phone, this.idUser});
  
  Costumer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    idUser = json['idUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['idUser'] = this.idUser;
    return data;
  }
}
