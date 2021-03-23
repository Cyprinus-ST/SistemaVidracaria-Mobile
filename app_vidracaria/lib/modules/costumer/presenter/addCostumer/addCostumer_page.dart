import 'package:app_vidracaria/modules/costumer/domain/entities/Costumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/addCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/editCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/presenter/addCostumer/addCostumer_controller.dart';
import 'package:app_vidracaria/modules/costumer/presenter/addCostumer/states/state.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/editProjectInput.dart';
import 'package:app_vidracaria/modules/util/widget/drawer_widget.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddCostumerPage extends StatefulWidget {
  final Costumer costumer;

  AddCostumerPage({this.costumer});

  @override
  _AddCostumerPageState createState() =>
      _AddCostumerPageState(costumer: costumer);
}

class _AddCostumerPageState
    extends ModularState<AddCostumerPage, AddCostumerController> {
  final Costumer costumer;

  _AddCostumerPageState({this.costumer});

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _nameText = new TextEditingController();
  final _emailText = new TextEditingController();
  final _phoneText = new TextEditingController();

  String actionButton = "Adicionar";

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
                return Modular.to.popAndPushNamed('/dashboard/costumers');
              },
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 0, top: 20),
              child: Text(
                'Clientes',
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

  void _fillTextContents() {
    if (this.costumer != null) {
      setState(() {
        this._nameText.text = this._nameText.text == ""
            ? this.costumer.name
            : this._nameText.text;
        this._emailText.text = this._emailText.text == ""
            ? this.costumer.email
            : this._emailText.text;
        this._phoneText.text = this._phoneText.text == ""
            ? this.costumer.phone
            : this._phoneText.text;
        //this._imageFile = this._imageFile.path == null ? PickedFile(this.project.imageUrl) : this._imageFile;
        this.actionButton = "Editar";
      });
    }
  }

  void _buttonBehavior(Costumer item) {
    if (_formKey.currentState.validate()) {
      if (item != null) {
        final input = new EditCostumerInput(
        id: item.id,
        email: _emailText.text,
        name: _nameText.text,
        phone: _phoneText.text);
        controller.doEditCostumer(input);
      } else {
        final input = new AddCostumerInput(
            email: _emailText.text,
            name: _nameText.text,
            phone: _phoneText.text);
        controller.doCreateClient(input);
      }
    }
  }

  Widget _buildFormFields() {
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
                  'Adicionar Cliente',
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
                    RaisedButton(
                      color: Colors.red[300],
                      onPressed: () {},
                      child: Container(
                        child: Text(
                          "Cancelar",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.green[300],
                      onPressed: () {
                        _buttonBehavior(costumer);
                      },
                      child: Container(
                        child: Text(
                          this.actionButton,
                          style: TextStyle(fontSize: 16),
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
