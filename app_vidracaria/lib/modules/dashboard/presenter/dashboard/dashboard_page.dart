import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/presenter/login/login_controller.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/dashboard_controller.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/states/state.dart';
import 'package:app_vidracaria/modules/util/widget/line_chart.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  User userAuthenticaded;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Observer(builder: (_) {
              return UserAccountsDrawerHeader(
                accountName: controller.user.name != null ? Text(controller.user.name) : Text(''),
                accountEmail: controller.user.email != null ? Text(controller.user.email) : Text(''),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
              );
            }),
            ListTile(
              title: Text('Minha Conta'),
              trailing: Icon(Icons.email),
            ),
            ListTile(
              title: Text('Planos'),
              trailing: Icon(Icons.email),
            ),
            ListTile(
              title: Text('Orçamentos'),
              trailing: Icon(Icons.email),
            ),
          ],
        ),
      ),
      body: SizedBox(
        child: Observer(builder: (_) {
          var state = controller.state;

          if (state is DashboardError) {
            return Center(
              child: Text("Falhou tudo meu caro kkkk"),
            );
          }

          if (state is DashboardStart) {
            return _dashboardStartWidget();
          } else if (state is DashboardLoading) {
            return LoadingWidget();
          } else if (state is DashboardSuccess) {
            return _dashboardStartWidget();
          } else {
            return Center(
              child: Text("Falhou tudo meu caro kkkk"),
            );
          }
        }),
      ),
    );
  }

  Widget _dashboardStartWidget() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                overflow: Overflow.clip,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    color: Color(0xFF0076bc),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.27,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding:
                            EdgeInsets.only(bottom: 20, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Center(
                      child: Card(
                        color: Colors.white.withOpacity(0.97),
                        margin: EdgeInsets.only(top: 130),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: LineChartSample2(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width * 0.8,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 10,
            children: [
              Card(
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
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
                        color: Colors.black,
                      ),
                      Text(
                        'Minha Conta',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.green[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
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
              Card(
                color: Colors.blue[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.assessment,
                        size: 40,
                        color: Colors.black,
                      ),
                      Text(
                        'Orçamentos',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.red[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.broken_image,
                        size: 40,
                        color: Colors.black,
                      ),
                      Text(
                        'Projetos',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
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
              Card(
                color: Colors.blue[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
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
            ],
          ),
        ),
      ],
    );
  }
}
