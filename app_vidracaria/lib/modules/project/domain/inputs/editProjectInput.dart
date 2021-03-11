class EditProjectInput {
  String id;
  String title;
  int numberGlass;
  String description;
  String idUser;
  String imageUrl;
  int projectType;

  EditProjectInput(
      {this.id,
      this.title,
      this.numberGlass,
      this.description,
      this.idUser,
      this.imageUrl,
      this.projectType});
}
