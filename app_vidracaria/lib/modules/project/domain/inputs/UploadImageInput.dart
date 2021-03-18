import 'package:http/http.dart';

class UpdateImageInput {
  String idProject;
  String idUser;
  String image;

  UpdateImageInput({this.idProject, this.idUser, this.image});
}
