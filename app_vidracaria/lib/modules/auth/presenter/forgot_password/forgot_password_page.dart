import 'package:app_vidracaria/modules/auth/domain/inputs/forgot_password_input.dart';
import 'package:app_vidracaria/modules/auth/presenter/forgot_password/forgot_password_controller.dart';
import 'package:app_vidracaria/modules/auth/presenter/forgot_password/states/state.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPage createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends ModularState<ForgotPasswordPage, ForgotPasswordController> {
  final _emailText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Observer(builder: (_) {
            var state = controller.state;

            if (state is ForgotPasswordError) {
              return Center(
                child: Text("Deu ruim"),
              );
            }

            if (state is ForgotPasswordStart) {
              return _loginStartWidget();
            } else if (state is ForgotPasswordLoading) {
              return LoadingWidget();
            } else if (state is ForgotPasswordSuccess) {
              Modular.to.pushNamed('/');
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }

  Widget _loginStartWidget() {
    return Form(
      child: Padding(
        padding: EdgeInsets.only(top: 100, right: 25, left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Text(
                'Esqueceu sua senha?',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                '*Digite o email cadastrado, em breve irá receber um email com instruções para redefinir a sua senha.',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _emailText,
                keyboardType: TextInputType.text,
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
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: FlatButton(
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
                        final forgotPasswprdInput =
                            new ForgotPasswordInput(email: _emailText.text);
                        controller.doForgotPassword(forgotPasswprdInput);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  FlatButton(
                    color: Color(0xFFffa101),
                    child: Container(
                      width: double.maxFinite,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
