class Budget {
  String id;
  String idUser;
  String idCostumer;
  String idProject;
  int meterValue;
  int heightValue;
  int widthValue;
  String description;
  double total;
  double discount;
  String status;

  Budget(
      {this.id,
      this.idUser,
      this.idCostumer,
      this.idProject,
      this.meterValue,
      this.heightValue,
      this.widthValue,
      this.description,
      this.total,
      this.discount,
      this.status});
  
  Budget.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['idUser'];
    idCostumer = json['idCostumer'];
    idProject = json['idProject'];
    meterValue = json['meterValue'];
    heightValue = json['heightValue'];
    widthValue = json['widthValue'];
    description = json['description'];
    total = json['total'];
    discount = json['discount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idUser'] = this.idUser;
    data['idCostumer'] = this.idCostumer;
    data['idProject'] = this.idProject;
    data['meterValue'] = this.meterValue;
    data['heightValue'] = this.heightValue;
    data['widthValue'] = this.widthValue;
    data['description'] = this.description;
    data['total'] = this.total;
    data['discount'] = this.discount;
    data['status'] = this.status;
    return data;
  }
}
