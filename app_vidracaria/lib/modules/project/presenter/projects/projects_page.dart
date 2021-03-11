import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
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
  final _typeProjectText = new TextEditingController();
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
                  return _buildFilterWidget();
                }

                if (state is ProjectStart) {
                  final input = new FilterProjectInput(
                    numberGlass: 0,
                    projectType: 0,
                    title: '',
                  );
                  controller.doListProjects(input);
                } else if (state is ProjectLoading) {
                  return LoadingWidget();
                } else if (state is ProjectSuccess) {
                  return _buildBodyPage(state.projects);
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

  Widget _buildBodyPage(List<Project> projects) {
    return Column(
      children: [
        _buildFilterWidget(),
        _buildListProject(projects),
      ],
    );
  }

  Widget _buildFilterWidget() {
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      controller: _typeProjectText,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hoverColor: Colors.yellow,
                        labelText: "Tipo de Projeto",
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: "Escolha o tipo de projeto",
                        hintStyle: TextStyle(color: Colors.grey[100]),
                      ),
                    ),
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
                            numberGlass: int.parse(_numberGlassText.text),
                            projectType: int.parse(_typeProjectText.text),
                            title: _titleText.text,
                          );

                          controller.doListProjects(input);
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
                color: Colors.green,
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
                            color: Colors.white),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      item.description ?? '',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.remove_red_eye,
                      color: Colors.yellow[800],
                      size: 35,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.restore_from_trash,
                      color: Colors.red,
                      size: 35,
                    ),
                  ),
                ],
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 20, top: 10),
                    child: Text(
                      'Descrição:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Card(
                          color: Colors.green,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.sd_card,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Text('Cliente')
                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          color: Colors.yellow[900],
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.sd_card,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Text('Ferragens')
                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          color: Colors.blue,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.sd_card,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Text('Materiais')
                      ],
                    ),
                  ],
                ),
              )
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
