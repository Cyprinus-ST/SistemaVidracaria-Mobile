import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/entities/ProjectType.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/addProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/editProjectInput.dart';
import 'package:app_vidracaria/modules/project/presenter/addProject/addProject_controller.dart';
import 'package:app_vidracaria/modules/project/presenter/addProject/states/state.dart';
import 'package:app_vidracaria/modules/util/widget/drawer_widget.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class AddProjectPage extends StatefulWidget {
  final Project project;

  AddProjectPage({this.project});

  @override
  _AddProjectPageState createState() => _AddProjectPageState(project: project);
}

class _AddProjectPageState
    extends ModularState<AddProjectPage, AddProjectController> {
  final Project project;
  _AddProjectPageState({this.project});

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _titleText = new TextEditingController();
  final _descriptionText = new TextEditingController();
  final _numberGlassText = new TextEditingController();
  int _typeProjectText;

  String actionButton = "Adicionar";

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _fillTextContents();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF2376ba),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                return Modular.to.popAndPushNamed('/dashboard/projects');
              },
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 0, top: 20),
              child: Text(
                'Projetos',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          SliverToBoxAdapter(child: Observer(builder: (_) {
            var state = controller.state;

            if (state is AddProjectError) {
              return LoadingWidget();
            }

            if (state is AddProjectStart) {
              controller.listProjectType();
            } else if (state is AddProjectLoading) {
              return LoadingWidget();
            } else if (state is AddProjectSuccess) {
              return _buildFormFields(state.types);
            } else {
              return Center(
                child: Text("Falhou tudo meu caro kkkk"),
              );
            }
          })),
        ],
      ),
    );
  }

  void _fillTextContents() {
    if (this.project != null) {
      setState(() {
        this._titleText.text = this._titleText.text == ""
            ? this.project.title
            : this._titleText.text;
        this._descriptionText.text = this._descriptionText.text == ""
            ? this.project.description
            : this._descriptionText.text;
        this._numberGlassText.text = this._numberGlassText.text == ""
            ? this.project.numberGlass.toString()
            : this._numberGlassText.text;
        this._typeProjectText =
            this._typeProjectText ?? this.project.projectType;
        //this._imageFile = this._imageFile.path == null ? PickedFile(this.project.imageUrl) : this._imageFile;
        this.actionButton = "Editar";
      });
    }
  }

  Widget _buildFormFields(List<ProjectType> types) {
    return Form(
      key: _formKey,
      child: Card(
        elevation: 10,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  actionButton + ' Projeto',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Digite o Titulo do projeto';
                    }
                    return null;
                  },
                  controller: _titleText,
                  decoration: InputDecoration(labelText: 'Titulo'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextFormField(
                  controller: _descriptionText,
                  decoration: InputDecoration(labelText: 'Descrição'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Digite o milimetro da folha de vidro';
                    }
                    return null;
                  },
                  controller: _numberGlassText,
                  decoration: InputDecoration(labelText: 'Folha de Vidro (mm)'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 13, bottom: 13),
                child: DropdownButton(
                    isExpanded: true,
                    hint: Text('Tipo de Projeto'),
                    items: types.map((item) {
                      return DropdownMenuItem(
                        child: Text(item.type),
                        value: item.id,
                      );
                    }).toList(),
                    onChanged: (int item) {
                      setState(() {
                        this._typeProjectText = item;
                      });
                    },
                    value: _typeProjectText),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 13, bottom: 13),
                child: OutlineButton(
                  child: Text('Selecionar Imagem'),
                  onPressed: _pickImage,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Modular.to.popAndPushNamed('/dashboard/projects');
                      },
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red[400]),
                        child: Center(
                          child: Text(
                            "Cancelar",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        _buttonBehavior(project);
                      },
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        child: Center(
                          child: Text(
                            actionButton,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _buttonBehavior(Project item) {
    if (_formKey.currentState.validate()) {
      if (item != null) {
        final input = new EditProjectInput(
            id: item.id,
            description: _descriptionText.text,
            idUser: item.idUser,
            imageUrl: _imageFile.path,
            numberGlass: int.parse(_numberGlassText.text),
            projectType: _typeProjectText,
            title: _titleText.text);
        controller.doEditProject(input);
      } else {
        final input = new AddProjectInput(
          description: _descriptionText.text,
          title: _titleText.text,
          numberGlass: int.parse(_numberGlassText.text),
          projectType: _typeProjectText,
          imageUrl: _imageFile.path,
        );
        controller.doAddProject(input);
      }
    }
  }

  void _pickImage() async {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error " + e);
    }
  }
}
