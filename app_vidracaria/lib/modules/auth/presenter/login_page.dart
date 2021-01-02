import 'package:app_vidracaria/modules/auth/domain/inputs/login_input.dart';
import 'package:app_vidracaria/modules/auth/presenter/login_bloc.dart';
import 'package:app_vidracaria/modules/auth/presenter/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bloc = Modular.get<LoginBloc>();
  final _emailText = new TextEditingController();
  final _passwordText = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder(
            stream: bloc,
            builder: (context, snapshot) {
              final state = bloc.state;

              if (state is LoginStart) {
                return _loginStartWidget(); //pode retornar uma função, widget, etc
              }

              if (state is LoginError) {
                return Center(
                  child: Text("Houve um erro ao logar"),
                );  //pode retornar uma função, widget, etc
              }

              if (state is LoginLoading) {
                return CircularProgressIndicator(); //pode retornar uma função, widget, etc
              }

              if (state is LoginSuccess) {
                return Center(
                  child: Text("Logado com Sucesso"),
                ); //pode retornar uma função, widget, etc
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _loginStartWidget() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _emailText,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                labelText: "Email", hintText: "Informe o email"),
          ),
          TextFormField(
            controller: _passwordText,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                labelText: "Senha", hintText: "Informe o email"),
          ),
          RaisedButton(
            color: Colors.black,
            child: Container(
              width: 10,
              height: 10,
              child: Text('Entrar'),
            ),
            onPressed: () {
              final loginInput = new LoginInput(
                email: _emailText.text,
                password: _passwordText.text
              );
              bloc.add(loginInput);
            },
          ),
        ],
      ),
    );
  }
}
