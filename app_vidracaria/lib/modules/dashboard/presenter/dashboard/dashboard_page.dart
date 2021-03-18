import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/dashboard_controller.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/states/state.dart';
import 'package:app_vidracaria/modules/util/widget/line_chart.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  String errorMessage;
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2376ba),
      drawer: Drawer(
        child: Observer(
          builder: (_) {
            var user = controller.user;
            if (user != null) {
              return ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(user.name),
                    accountEmail: Text(user.email),
                    currentAccountPicture: user.pathAvatar == null ? CircleAvatar(
                      backgroundColor: Colors.red,
                    ) : CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  ListTile(
                    title: Text('Minha Conta'),
                  ),
                  ListTile(
                    title: Text('Planos'),
                  ),
                  ListTile(
                    title: Text('Orçamentos'),
                  ),
                  ListTile(
                    title: Text('Projetos'),
                  ),
                  ListTile(
                    title: Text('Clientes'),
                  ),
                  ListTile(
                    title: Text('Fornecedores'),
                  ),
                ],
              );
            } else {
              return LoadingWidget();
            }
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          var state = controller.state;

          if (state is DashboardError) {
            //this.errorMessage = state.error;
            return _buildDashboarPage(true);
          }

          if (state is DashboardStart) {
            return _buildDashboarPage(false);
          } else if (state is DashboardLoading) {
            return LoadingWidget();
          } else if (state is FailureGetUserAuthenticaded) {
            this.errorMessage = state.message;
            return _buildDashboarPage(true);
          } else if (state is DashboardSuccess) {
            return _buildDashboarPage(false);
          } else {
            return Center(
              child: Text("Falhou tudo meu caro kkkk"),
            );
          }
        },
      ),
    );
  }

  Widget _buildDashboarPage(bool error) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF2376ba),
          title: Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              'Dashboard',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          floating: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 5),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.orange,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.17),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Orçamentos',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 25),
                                    child: Row(
                                      children: [
                                        Text(
                                          '1.200',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.red,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.17),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Projetos',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 25),
                                    child: Row(
                                      children: [
                                        Text(
                                          '1.200',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.greenAccent,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Clientes',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 25),
                                    child: Row(
                                      children: [
                                        Text(
                                          '30',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.blue,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 4, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Fornecedores',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 25),
                                    child: Row(
                                      children: [
                                        Text(
                                          '5',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.purple,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Clientes',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 25),
                                    child: Row(
                                      children: [
                                        Text(
                                          '30',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverGroupBuilder(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 10,
            children: [
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.yellow[900],
                      ),
                      Text(
                        'Minha Conta',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.yellow[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.payment,
                        size: 40,
                        color: Colors.green[300],
                      ),
                      Text(
                        'Planos',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[300]),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: FlatButton(
                  onPressed: () {
                    return Modular.to.pushNamed('/dashboard/budget');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.assessment,
                          size: 40,
                          color: Colors.blue[300],
                        ),
                        Text(
                          'Orçamentos',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[300]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: FlatButton(
                  onPressed: () {
                    return Modular.to.pushNamed('/dashboard/projects');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.red[300],
                        ),
                        Text(
                          'Projetos',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[300]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: FlatButton(
                  onPressed: () {
                    return Modular.to.pushNamed('/dashboard/costumers');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.payment,
                          size: 40,
                          color: Colors.purpleAccent,
                        ),
                        Text(
                          'Clientes',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.purpleAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: FlatButton(
                  onPressed: null,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.payment,
                          size: 40,
                          color: Colors.black,
                        ),
                        Text(
                          'Planos',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
