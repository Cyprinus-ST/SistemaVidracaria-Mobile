import 'package:app_vidracaria/modules/auth/domain/inputs/login_input.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/addCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/presenter/addCostumer/addCostumer_controller.dart';
import 'package:app_vidracaria/modules/costumer/presenter/addCostumer/states/state.dart';
import 'package:app_vidracaria/modules/util/widget/drawer_widget.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddProjectPage extends StatefulWidget {
  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState
    extends ModularState<AddProjectPage, AddCostumerController> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _nameText = new TextEditingController();
  final _emailText = new TextEditingController();
  final _phoneText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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

            if (state is AddCostumerError) {
              return _buildFormFields();
            }

            if (state is AddCostumerStart) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: _buildFormFields(),
              );
            } else if (state is AddCostumerLoading) {
              return LoadingWidget();
            } else if (state is AddCostumerSuccess) {
              return _buildFormFields();
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

  Widget _buildFormFields() {
    return Form(
      child: Card(
        elevation: 10,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Adicionar Projeto',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextFormField(
                  controller: _nameText,
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextFormField(
                  controller: _emailText,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextFormField(
                  controller: _phoneText,
                  decoration: InputDecoration(labelText: 'Telefone'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red[400]
                        ),
                        child: Text(
                          "Cancelar",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    FlatButton(
                      //color: Colors.green[300],
                      onPressed: () {
                        final input = new AddCostumerInput(
                            email: _emailText.text,
                            name: _nameText.text,
                            phone: _phoneText.text);
                        controller.doCreateClient(input);
                      },
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green
                        ),
                        child: Text(
                          "Adicionar",
                          style: TextStyle(fontSize: 16), textAlign: TextAlign.center,
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
}
