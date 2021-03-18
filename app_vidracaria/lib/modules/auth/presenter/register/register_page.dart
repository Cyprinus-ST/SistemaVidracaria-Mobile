import 'package:app_vidracaria/modules/auth/domain/inputs/register_input.dart';
import 'package:app_vidracaria/modules/auth/presenter/register/register_controller.dart';
import 'package:app_vidracaria/modules/auth/presenter/register/states/state.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends ModularState<RegisterPage, RegisterController> {
  final _emailText = new TextEditingController();

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Observer(
            builder: (_) {
              var state = controller.state;

              if (state is RegisterError) {
                return Center(
                  child: Text("Deu ruim"),
                );
              }

              if (state is RegisterStart) {
                return _buildStartWidget();
              } else if (state is RegisterLoading) {
                return LoadingWidget();
              } else if (state is RegisterSuccess) {
                return Center(
                  child: Text("Registrado com Sucesso"),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStartWidget() {
    return Form(
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.08,
            right: 25,
            left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Text(
                'Vamos criar sua conta!',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Container(
                child: Expanded(
                  child: Divider(
                    endIndent: 1,
                    indent: 1,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.symmetric(vertical: 0),
              child: _buildFormFields(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    color: Color(0xFFffa101),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.30,
                      height: 50,
                      child: Center(
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Modular.to.pushNamed('/');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: FlatButton(
                      color: Color(0xFF0076bc),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.30,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Criar Conta',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white),
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

  Widget _buildFormFields() {
    return Stepper(
      controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.blue,
                child: Container(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_up, color: Colors.white),
                    onPressed: onStepCancel,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.blue,
                child: Container(
                  width: 40,
                  height: 40,
                  child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      onPressed: onStepContinue),
                ),
              ),
            ),
          ],
        );
      },
      type: stepperType,
      physics: ScrollPhysics(),
      currentStep: _currentStep,
      onStepTapped: (step) => tapped(step),
      onStepContinue: continued,
      onStepCancel: cancel,
      steps: <Step>[
        Step(
          title: new Text('Conta'),
          content: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite seu nome';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Nome'),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite seu telefone';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Telefone'),
                    ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Digite seu CPF';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'CPF'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Digite o email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Endereço de Email'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Digite sua senha';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
              ],
            ),
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: new Text('Endereço'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'CEP'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'País'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Estado'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cidade'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Bairro'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número'),
              ),
            ],
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
        ),
      ],
    );
  }

  /*switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }*/

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (_formKey.currentState.validate()) {
      _currentStep < 1 ? setState(() => _currentStep += 1) : null;
    }
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
