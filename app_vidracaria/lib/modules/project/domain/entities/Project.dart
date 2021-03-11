class Project {
  String id;
  String title;
  int numberGlass;
  String description;
  String idUser;
  String imageUrl;
  int projectType;

  Project(
      {this.id,
      this.title,
      this.numberGlass,
      this.description,
      this.idUser,
      this.imageUrl,
      this.projectType});
  
  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    numberGlass = json['numberGlass'];
    description = json['description'];
    idUser = json['idUser'];
    imageUrl = json['imageUrl'];
    projectType = json['projectType'];
  }
}
