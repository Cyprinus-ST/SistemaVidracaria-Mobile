import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              trailing: Icon(Icons.email),
            ),
            ListTile(
              title: Text('Planos'),
              trailing: Icon(Icons.email),
            ),
            ListTile(
              title: Text('OrÃ§amentos'),
              trailing: Icon(Icons.email),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF2376ba),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                return Modular.to.popAndPushNamed('/');
              },
            ),
            title: Text(
              'OrÃ§amentos',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
          ),
          SliverGroupBuilder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SliverFillRemaining(
              child: _buildBudgetsList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _body() {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
              trailing: Icon(Icons.email),
            ),
            ListTile(
              title: Text('Planos'),
              trailing: Icon(Icons.email),
            ),
            ListTile(
              title: Text('OrÃ§amentos'),
              trailing: Icon(Icons.email),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 0.45,
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
                      color: Color(0xFF2a2462),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.27,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: 40, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_back),
                                    color: Colors.white,
                                    onPressed: () {
                                      return Modular.to.popAndPushNamed('/');
                                    },
                                  ),
                                  Text(
                                    'OrÃ§amentos',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                ],
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
                      fit: FlexFit.tight,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.28),
                          child: _buildBudgetsList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetsList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 50,
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'OrÃ§amento New Glass',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(Icons.verified_user, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Status: ConcluÃ­do',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Colors.yellow[800],
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.restore_from_trash,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, bottom: 20, top: 10),
                          child: Text(
                            'RelatÃ³rios:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Card(
                                color: Colors.green,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Cliente')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.yellow[900],
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Ferragens')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.blue,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Materiais')
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 50,
                      color: Colors.yellow[800],
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'OrÃ§amento New Glass',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(Icons.timer, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Status: Em Andamento',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Colors.yellow[800],
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.restore_from_trash,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, bottom: 20, top: 10),
                          child: Text(
                            'RelatÃ³rios:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Card(
                                color: Colors.green,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Cliente')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.yellow[900],
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Ferragens')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.blue,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Materiais')
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 50,
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'OrÃ§amento New Glass',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(Icons.remove_circle_outline, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Status: Cancelado',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Colors.yellow[800],
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.restore_from_trash,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, bottom: 20, top: 10),
                          child: Text(
                            'RelatÃ³rios:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Card(
                                color: Colors.green,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Cliente')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.yellow[900],
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Ferragens')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.blue,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Materiais')
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
