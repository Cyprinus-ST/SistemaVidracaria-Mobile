import 'dart:core';

class FilterProjectInput {
  int start;
  int maxResults;
  int projectType;
  int numberGlass;
  int page;
  String title;
  String idUser;

  FilterProjectInput(
      {this.start,
      this.maxResults,
      this.projectType,
      this.numberGlass,
      this.page,
      this.title,
      this.idUser});

    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['maxResults'] = this.maxResults;
    data['projectType'] = this.projectType;
    data['numberGlass'] = this.numberGlass;
    data['page'] = this.page;
    data['title'] = this.title;
    data['idUser'] = this.idUser;
    return data;
  }
}
