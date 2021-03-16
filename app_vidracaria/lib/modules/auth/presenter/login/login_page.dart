import 'package:app_vidracaria/modules/auth/domain/inputs/login_input.dart';
import 'package:app_vidracaria/modules/auth/presenter/login/login_controller.dart';
import 'package:app_vidracaria/modules/auth/presenter/login/states/login_state.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/dashboard_page.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _emailText = new TextEditingController();
  final _passwordText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SizedBox(
        child: Column(
          children: [
            Observer(builder: (_) {
              var state = controller.state;

              if (state is LoginError) {
                return _messageFlushBar();
              }

              if (state is LoginStart) {
                return _loginStartWidget();
              } else if(state is NotAuthenticaded) {
                return _loginStartWidget();
              } else if (state is LoginLoading) {
                return LoadingWidget();
              } else if (state is LoginSuccess) {
                return DashboardPage();
              } else {
                return Center(
                  child: Text("Falhou tudo meu caro kkkk"),
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Future<bool> verifyUSerAutthenticated() async {
    return await controller.verifyIfUserAuthenticated();
  }

  Widget _loginStartWidget() {
    return Form(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.45,
        ),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: _emailText,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hoverColor: Colors.yellow,
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: "Informe o email",
                    hintStyle: TextStyle(color: Colors.grey[100]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: _passwordText,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: "Senha",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    FlatButton(
                      color: Color(0xFF0076bc),
                      child: Container(
                        width: double.maxFinite,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        final loginInput = new LoginInput(
                            email: _emailText.text,
                            password: _passwordText.text);
                        controller.doAuthenticateUser(loginInput);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /*TextButton(
                            onPressed: () {
                              Modular.to.pushNamed('/register-user');
                            },
                            child: Text(
                              'Cadastrar-se',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Modular.to.pushNamed('/forgot-password');
                            },
                            child: Text(
                              'Esqueceu a senha',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),*/
                        ],
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
