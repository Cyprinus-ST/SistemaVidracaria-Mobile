class ProjectType {
  int id;
  String type;

  ProjectType({this.id, this.type});

  ProjectType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }
}