import 'dart:io';

import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/entities/ProjectType.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/filterProjectInput.dart';
import 'package:app_vidracaria/modules/project/presenter/projects/projects_controller.dart';
import 'package:app_vidracaria/modules/project/presenter/projects/states/state.dart';
import 'package:app_vidracaria/modules/util/widget/drawer_widget.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProjectPage extends StatefulWidget {
  ProjectPage({Key key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends ModularState<ProjectPage, ProjectsController> {
  final _titleText = new TextEditingController();
  int _typeProjectText;
  final _numberGlassText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 10,
            pinned: true,
            backgroundColor: Color(0xFF2376ba),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                return Modular.to.popAndPushNamed('/dashboard');
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
          SliverGroupBuilder(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: SliverToBoxAdapter(child: Observer(
              builder: (_) {
                var state = controller.state;

                if (state is ProjectError) {
                  return Center(
                    child: Text("Falhou tudo meu caro kkkk"),
                  );
                }

                if (state is ProjectStart) {
                  final input = new FilterProjectInput(
                    numberGlass: 0,
                    projectType: 0,
                    title: '',
                  );
                  controller.doBuilderContent(input);
                } else if (state is ProjectLoading) {
                  return LoadingWidget();
                } else if (state is ProjectSuccess) {
                  return _buildBodyPage(state.projects, state.types);
                } else {
                  return Center(
                    child: Text("Falhou tudo meu caro kkkk"),
                  );
                }
              },
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/dashboard/projects/add');
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
        elevation: 10,
        focusColor: Colors.white,
        backgroundColor: Color(0xFF2376ba),
      ),
    );
  }

  Widget _buildBodyPage(List<Project> projects, List<ProjectType> types) {
    return Column(
      children: [
        _buildFilterWidget(types),
        _buildListProject(projects),
      ],
    );
  }

  Widget _buildFilterWidget(List<ProjectType> types) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 10,
        child: ExpansionTile(
          title: Text(
            'Filtrar Projeto',
            style: TextStyle(fontSize: 20),
          ),
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      controller: _titleText,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hoverColor: Colors.yellow,
                        labelText: "Nome do Projeto",
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: "Informe nome do projeto",
                        hintStyle: TextStyle(color: Colors.grey[100]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 13),
                    child: DropdownButton(
                        itemHeight: 50,
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      controller: _numberGlassText,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hoverColor: Colors.yellow,
                        labelText: "Folha de Vidro",
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: "Informe a folha de vidro",
                        hintStyle: TextStyle(color: Colors.grey[100]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: RaisedButton(
                        color: Colors.yellow,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            'Filtrar',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPressed: () {
                          final input = new FilterProjectInput(
                            numberGlass: _numberGlassText.text.length == 0
                                ? 0
                                : int.parse(_numberGlassText.text),
                            projectType: _typeProjectText,
                            title: _titleText.text,
                          );

                          controller.doBuilderContent(input);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListProject(List<Project> projects) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return _buildCardProject(projects[index]);
        },
      ),
    );
  }

  Widget _buildCardProject(Project item) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Card(
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                height: 50,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Icon(Icons.verified_user, color: Colors.white)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Container(
                  child: Expanded(
                    child: Divider(
                      endIndent: 0,
                      indent: 0,
                      thickness: 12,
                      color: Colors.grey[100],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child:
                      item.imageUrl == "sem_imagem.jpg" || item.imageUrl == null
                          ? Icon(Icons.image)
                          : Image.file(File(item.imageUrl)),
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Container(
                  child: Expanded(
                    child: Divider(
                      endIndent: 0,
                      indent: 0,
                      thickness: 12,
                      color: Colors.grey[100],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 20, top: 10),
                    child: Column(
                      children: [
                        IconButton(
                            icon: Icon(Icons.mode_edit),
                            color: Colors.yellow[800],
                            onPressed: () {
                              Modular.to.pushNamed('/dashboard/projects/add',
                                  arguments: item);
                            }),
                        Text(
                          'Editar',
                          style: TextStyle(color: Colors.yellow[800]),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 20, top: 10),
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            Modular.to.pushNamed('/dashboard/projects/add',
                                arguments: item);
                          },
                        ),
                        Text(
                          'Excluir',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _messageFlushBar() {
    return Container(
      height: 100,
      child: Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        title: 'This action is prohibited',
        message: 'Lorem ipsum dolor sit amet',
        icon: Icon(
          Icons.info_outline,
          size: 28,
          color: Colors.blue.shade300,
        ),
        leftBarIndicatorColor: Colors.blue.shade300,
        duration: Duration(seconds: 3),
      )..show(context),
    );
  }
}
