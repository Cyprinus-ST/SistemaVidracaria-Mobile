import 'package:app_vidracaria/modules/util/widget/line_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2376ba),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('New Glass'),
              accountEmail: Text('contato@newglass.com.br'),
              currentAccountPicture: CircleAvatar(
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
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF2376ba),
            title: Text(
              'Dashboard',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
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
                                  top:
                                      MediaQuery.of(context).size.height * 0.17),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.42,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 20),
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
                                      padding:
                                          EdgeInsets.only(left: 30, top: 25),
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
                                  top:
                                      MediaQuery.of(context).size.height * 0.17),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.42,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 20),
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
                                      padding:
                                          EdgeInsets.only(left: 30, top: 25),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 20),
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
                                      padding:
                                          EdgeInsets.only(left: 10, top: 25),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 4, top: 20),
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
                                      padding:
                                          EdgeInsets.only(left: 10, top: 25),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 20),
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
                                      padding:
                                          EdgeInsets.only(left: 10, top: 25),
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
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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
                  elevation: 10,
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
                  elevation: 10,
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
                    elevation: 10,
                    color: Colors.blue[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
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
                    )),
                Card(
                  elevation: 10,
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
                  elevation: 10,
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
                          'Clientes',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  color: Colors.blue[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
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
      ),
    );
  }
}
