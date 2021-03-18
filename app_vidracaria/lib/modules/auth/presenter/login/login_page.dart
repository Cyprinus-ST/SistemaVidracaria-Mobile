import 'dart:ffi';

import 'package:app_vidracaria/modules/auth/domain/inputs/login_input.dart';
import 'package:app_vidracaria/modules/auth/presenter/login/login_controller.dart';
import 'package:app_vidracaria/modules/auth/presenter/login/states/login_state.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/dashboard_page.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
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
  String errorMessage;

  final _formKey = GlobalKey<FormState>();

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
                this.errorMessage = state.error.message;
                return _loginStartWidget(true);
              }

              if (state is LoginStart) {
                return _loginStartWidget(false);
              } else if (state is NotAuthenticaded) {
                return _loginStartWidget(false);
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

  Widget _loginStartWidget(bool error) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Container(
            //height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.50,
            ),
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Digite seu Email';
                              }
                              return null;
                            },
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Digite sua Senha';
                              }
                              return null;
                            },
                            obscureText: true,
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
                                  if (_formKey.currentState.validate()) {
                                    final loginInput = new LoginInput(
                                        email: _emailText.text,
                                        password: _passwordText.text);
                                    controller.doAuthenticateUser(loginInput);
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(color: Colors.blue),
                                          text: 'Cadastrar-se',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Modular.to
                                                  .pushNamed('/register-user');
                                            },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(color: Colors.blue),
                                          text: 'Esqueceu a senha',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Modular.to.pushNamed(
                                                  '/forgot-password');
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        controller.state is LoginError ? _messageFlushBar() : Text('')
      ],
    );
  }

  Widget _messageFlushBar() {
    return Container(
      margin: EdgeInsets.only(top:40),
      width: double.maxFinite,
      child: Flushbar(
        animationDuration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
        title: 'Ocorreu uma falha',
        message: errorMessage,
        icon: Icon(
          Icons.info,
          size: 28,
          color: Colors.white,
        ),
        leftBarIndicatorColor: Colors.red,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      )..show(context),
    );
  }
}
