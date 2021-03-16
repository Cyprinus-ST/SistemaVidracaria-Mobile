import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/entities/ProjectType.dart';
import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/UploadImageInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/addProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/deleteProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/editProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/filterProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/getProjectnput.dart';

abstract class ProjectDatasource {
  Future<void> addProject(AddProjectInput input);
  Future<List<Project>> listProject(FilterProjectInput input);
  Future<void> deleteProject(DeleteProjectInput input);
  Future<Project> getProject(GetProjectInput input);
  Future<void> editProject(EditProjectInput input);
  Future<List<ProjectType>> listTypeProject();
  Future<void> uploadImageProject(UpdateImageInput input);
}